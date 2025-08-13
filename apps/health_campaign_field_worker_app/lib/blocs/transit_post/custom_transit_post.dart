import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transit_post/data/repositories/local/user_action.dart';
import 'package:transit_post/utils/utils.dart';

part 'custom_transit_post.freezed.dart';

typedef CustomTransitPostEmitter = Emitter<CustomTransitPostState>;
typedef UserActionRemoteRepository
    = DataRepository<UserActionModel, UserActionSearchModel>;

class CustomTransitPostBloc
    extends Bloc<CustomTransitPostEvent, CustomTransitPostState> {
  final UserActionLocalRepository userActionLocalRepository;
  final UserActionRemoteRepository userActionRemoteRepository;

  CustomTransitPostBloc(
    super.initialState, {
    required this.userActionLocalRepository,
    required this.userActionRemoteRepository,
  }) {
    on(_handleSubmitDelivery);
  }

  FutureOr<void> _handleSubmitDelivery(
    CustomTransitPostEvent event,
    CustomTransitPostEmitter emit,
  ) async {
    try {
      //TODO : set action type enum in backend and here
      //for delivery intervention in transit and fixed post

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
          action: 'OTHER',
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
            if (event.drugType != null && (event.drugType?.isNotEmpty ?? false))
              AdditionalField("drugType", event.drugType),
            if (event.beneficiaryDelivered != null)
              AdditionalField(
                  "beneficiaryDeliveredCount", event.beneficiaryDelivered),
            if (event.additionalFields != null &&
                (event.additionalFields?.isNotEmpty ?? false))
              ...event.additionalFields!
          ])));
      emit(state.copyWith(
        transitPostType: state.transitPostType ?? "",
        transitPostName: state.transitPostName ?? "",
      ));
    } catch (e) {
      rethrow;
    }
  }
}

@freezed
class CustomTransitPostEvent with _$CustomTransitPostEvent {
  const factory CustomTransitPostEvent.submitDelivery({
    @Default(0) double latitude,
    @Default(0) double longitude,
    @Default(0) double locationAccuracy,
    String? scannedResource,
    String? drugType,
    int? beneficiaryDelivered,
    List<AdditionalField>? additionalFields,
  }) = TransitPostSubmitDeliveryEvent;
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
  }) = _CustomTransitPostState;
}
