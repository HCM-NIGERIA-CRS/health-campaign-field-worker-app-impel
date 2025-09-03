import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transit_post/data/repositories/local/user_action.dart';
import 'package:transit_post/utils/utils.dart';

import '../../data/repositories/local/transit_post/custom_user_action.dart';

part 'fixed_post.freezed.dart';

typedef FixedPostEmitter = Emitter<FixedPostState>;
typedef UserActionRemoteRepository
    = DataRepository<UserActionModel, UserActionSearchModel>;

class FixedPostBloc extends Bloc<FixedPostEvent, FixedPostState> {
  final UserActionLocalRepository userActionLocalRepository;
  final CustomUserActionLocalRepository customUserActionLocalRepository;

  final UserActionRemoteRepository userActionRemoteRepository;

  FixedPostBloc(
    super.initialState, {
    required this.userActionLocalRepository,
    required this.customUserActionLocalRepository,
    required this.userActionRemoteRepository,
  }) {
    on(_handleFixedPostSelection);
    on(_handleDeliveryCount);
    on(_handleRecordDelivery);
  }

  FutureOr<void> _handleFixedPostSelection(
    FixedPostSelectionEvent event,
    FixedPostEmitter emit,
  ) async {
    emit(state.copyWith(
      fixedPostType: event.fixedPostType,
      fixedPostName: event.fixedPostName,
      locationAccuracy: event.locationAccuracy,
      latitude: event.latitude,
      longitude: event.longitude,
    ));
  }

  FutureOr<void> _handleDeliveryCount(
    FixedPostDeliveryCountEvent event,
    FixedPostEmitter emit,
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
    FixedPostDeliveryEvent event,
    FixedPostEmitter emit,
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
              'FixedPostType',
              state.fixedPostType,
            ),
            AdditionalField(
              'FixedPostName',
              state.fixedPostName,
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

  // FutureOr<int> fetchCount(
  //   String? userId, {
  //   UserActionSearchModel? query,
  // }) async {
  //   return retryLocalCallOperation<int>(() async {
  //     final totalCount =
  //         userActionLocalRepository.search(UserActionSearchModel(),);
  //   });
  // }
}

@freezed
class FixedPostEvent with _$FixedPostEvent {
  const factory FixedPostEvent.handleSelection({
    @Default(0) double latitude,
    @Default(0) double longitude,
    @Default(0) double locationAccuracy,
    String? fixedPostType,
    String? fixedPostName,
  }) = FixedPostSelectionEvent;

  const factory FixedPostEvent.handleDelivery({
    @Default(0) double latitude,
    @Default(0) double longitude,
    @Default(0) double locationAccuracy,
    String? scannedResource,
    String? action,
    int? curCount,
    int? totalCount,
  }) = FixedPostDeliveryEvent;

  const factory FixedPostEvent.handleDeliveryCount({
    @Default(0) int curCount,
    @Default(0) int totalCount,
    String? action,
  }) = FixedPostDeliveryCountEvent;
}

@freezed
class FixedPostState with _$FixedPostState {
  const factory FixedPostState({
    @Default(false) loading,
    @Default(0) double latitude,
    @Default(0) double longitude,
    @Default(0) double locationAccuracy,
    String? fixedPostType,
    String? fixedPostName,
    int? curCount,
    int? totalCount,
  }) = _FixedPostState;
}
