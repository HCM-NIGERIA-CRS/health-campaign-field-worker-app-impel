import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transit_post/data/repositories/local/user_action.dart';
import 'package:transit_post/utils/utils.dart';

import '../../data/repositories/local/transit_post/custom_user_action.dart';

part 'custom_transit_post.freezed.dart';

typedef CustomTransitPostEmitter = Emitter<CustomTransitPostState>;
typedef UserActionRemoteRepository
    = DataRepository<UserActionModel, UserActionSearchModel>;

class CustomTransitPostBloc
    extends Bloc<CustomTransitPostEvent, CustomTransitPostState> {
  final CustomUserActionLocalRepository customUserActionLocalRepository;
  final UserActionLocalRepository userActionLocalRepository;
  final UserActionRemoteRepository userActionRemoteRepository;

  CustomTransitPostBloc(
    super.initialState, {
    required this.customUserActionLocalRepository,
    required this.userActionLocalRepository,
    required this.userActionRemoteRepository,
  }) {
    on(_handleTransitPostSelection);
    on(_handleDeliveryCount);
    on(_handleRecordDelivery);
  }

  FutureOr<void> _handleTransitPostSelection(
    CustomTransitPostSelectionEvent event,
    CustomTransitPostEmitter emit,
  ) async {
    emit(state.copyWith(
      transitPostType: event.transitPostType,
      transitPostName: event.transitPostName,
      locationAccuracy: event.locationAccuracy,
      latitude: event.latitude,
      longitude: event.longitude,
    ));
  }

  FutureOr<void> _handleDeliveryCount(
    CustomTransitPostDeliveryCountEvent event,
    CustomTransitPostEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    final totalCount =
        await customUserActionLocalRepository.fetchUserActionCount(
            TransitPostSingleton().loggedInUserUuid, event.action);

    final curCount = await customUserActionLocalRepository.fetchUserActionCount(
        TransitPostSingleton().loggedInUserUuid, event.action,
        query: UserActionSearchModel(
            auditDetails: AuditDetails(
                createdBy: TransitPostSingleton().loggedInUserUuid!,
                createdTime: DateTime.now().millisecondsSinceEpoch)));

    emit(state.copyWith(
      loading: false,
      totalCount: totalCount,
      curCount: curCount,
    ));
  }

  FutureOr<void> _handleRecordDelivery(
    CustomTransitPostDeliveryEvent event,
    CustomTransitPostEmitter emit,
  ) async {
    try {
      await userActionLocalRepository.create(UserActionModel(
          latitude: event.latitude,
          longitude: event.longitude,
          locationAccuracy: event.locationAccuracy,
          tenantId: TransitPostSingleton().tenantId,
          clientReferenceId: IdGen.instance.identifier,
          isSync: false,
          timestamp: DateTime.now().millisecondsSinceEpoch,
          projectId: TransitPostSingleton().projectId!,
          boundaryCode: TransitPostSingleton().boundary!.code!,
          action: event.action ?? 'OTHER',
          rowVersion: 1,
          clientAuditDetails: ClientAuditDetails(
            createdBy: TransitPostSingleton().loggedInUserUuid!,
            createdTime: DateTime.now().millisecondsSinceEpoch,
            lastModifiedBy: TransitPostSingleton().loggedInUserUuid,
            lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
          ),
          auditDetails: AuditDetails(
            createdBy: TransitPostSingleton().loggedInUserUuid!,
            createdTime: DateTime.now().millisecondsSinceEpoch,
            lastModifiedBy: TransitPostSingleton().loggedInUserUuid,
            lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
          ),
          additionalFields: UserActionAdditionalFields(version: 1, fields: [
            AdditionalField(
              'transitPostType',
              state.transitPostType,
            ),
            AdditionalField(
              'transitPostName',
              state.transitPostName,
            ),
            AdditionalField(
              'scannedResource',
              event.scannedResource,
            ),
          ])));
      emit(state.copyWith(
        curCount: state.curCount != null ? state.curCount! + 1 : 1,
        totalCount: state.totalCount != null ? state.totalCount! + 1 : 1,
      ));
    } catch (e) {
      rethrow;
    }
  }
}

@freezed
class CustomTransitPostEvent with _$CustomTransitPostEvent {
  const factory CustomTransitPostEvent.handleSelection({
    @Default(0) double latitude,
    @Default(0) double longitude,
    @Default(0) double locationAccuracy,
    String? transitPostType,
    String? transitPostName,
  }) = CustomTransitPostSelectionEvent;

  const factory CustomTransitPostEvent.handleDelivery({
    @Default(0) double latitude,
    @Default(0) double longitude,
    @Default(0) double locationAccuracy,
    String? scannedResource,
    String? action,
    int? curCount,
    int? totalCount,
  }) = CustomTransitPostDeliveryEvent;

  const factory CustomTransitPostEvent.handleDeliveryCount({
    @Default(0) int curCount,
    @Default(0) int totalCount,
    String? action,
  }) = CustomTransitPostDeliveryCountEvent;
}

@freezed
class CustomTransitPostState with _$CustomTransitPostState {
  const factory CustomTransitPostState({
    @Default(false) loading,
    @Default(0) double latitude,
    @Default(0) double longitude,
    @Default(0) double locationAccuracy,
    String? transitPostType,
    String? transitPostName,
    int? curCount,
    int? totalCount,
  }) = _CustomTransitPostState;
}
