import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registration_delivery/utils/utils.dart';
import 'package:transit_post/data/repositories/local/user_action.dart';

import '../../data/repositories/local/transit_post/custom_user_action.dart';

part 'non_compliance_tracking.freezed.dart';

typedef NonComplianceTrackingEmitter = Emitter<NonComplianceTrackingState>;

class NonComplianceTrackingBloc
    extends Bloc<NonComplianceTrackingEvent, NonComplianceTrackingState> {
  final UserActionLocalRepository userActionLocalRepository;
  final CustomUserActionLocalRepository customUserActionLocalRepository;

  NonComplianceTrackingBloc(
    super.initialState, {
    required this.userActionLocalRepository,
    required this.customUserActionLocalRepository,
  }) {
    on(_handleCreate);
    on(_handleUpdate);
  }

  FutureOr<void> _handleCreate(
    NonComplianceTrackingCreateEvent event,
    NonComplianceTrackingEmitter emit,
  ) async {
    emit(const NonComplianceTrackingState.create(loading: true));
    UserActionModel? nonComplianceUserAction = event.nonComplianceUserAction;
    try {
      nonComplianceUserAction = nonComplianceUserAction?.copyWith(
        clientAuditDetails: ClientAuditDetails(
            createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
            createdTime: DateTime.now().millisecondsSinceEpoch,
            lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid!,
            lastModifiedTime: DateTime.now().millisecondsSinceEpoch),
        auditDetails: AuditDetails(
            createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
            createdTime: DateTime.now().millisecondsSinceEpoch,
            lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid!,
            lastModifiedTime: DateTime.now().millisecondsSinceEpoch),
      );
      // create the userAction model with trip action as start
      if (nonComplianceUserAction != null) {
        await userActionLocalRepository.create(nonComplianceUserAction);
        emit(NonComplianceTrackingState.create(
          loading: false,
          nonComplianceUserAction: nonComplianceUserAction,
        ));
      }
    } catch (e) {}
  }

  FutureOr<void> _handleUpdate(
    NonComplianceTrackingUpdateEvent event,
    NonComplianceTrackingEmitter emit,
  ) async {
    emit(const NonComplianceTrackingState.create(loading: true));
    UserActionModel? nonComplianceUserAction = event.nonComplianceUserAction;
    try {
      nonComplianceUserAction = nonComplianceUserAction?.copyWith(
        clientAuditDetails: nonComplianceUserAction.clientAuditDetails
            ?.copyWith(
                lastModifiedBy:
                    RegistrationDeliverySingleton().loggedInUserUuid!,
                lastModifiedTime: DateTime.now().millisecondsSinceEpoch),
        auditDetails: nonComplianceUserAction.auditDetails?.copyWith(
            lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid!,
            lastModifiedTime: DateTime.now().millisecondsSinceEpoch),
      );
      // create the userAction model with trip action as start
      if (nonComplianceUserAction != null) {
        await customUserActionLocalRepository
            .updateUserAction(nonComplianceUserAction);
        emit(NonComplianceTrackingState.update(
          loading: false,
          nonComplianceUserAction: nonComplianceUserAction,
        ));
      }
    } catch (e) {}
  }
}

@freezed
class NonComplianceTrackingEvent with _$NonComplianceTrackingEvent {
  const factory NonComplianceTrackingEvent.create(
          {UserActionModel? nonComplianceUserAction}) =
      NonComplianceTrackingCreateEvent;
  const factory NonComplianceTrackingEvent.update(
          {UserActionModel? nonComplianceUserAction}) =
      NonComplianceTrackingUpdateEvent;
}

@freezed
class NonComplianceTrackingState with _$NonComplianceTrackingState {
  const factory NonComplianceTrackingState.init() =
      NonComplianceTrackingInitState;
  const factory NonComplianceTrackingState.create({
    @Default(false) bool loading,
    UserActionModel? nonComplianceUserAction,
  }) = NonComplianceTrackingCreateState;
  const factory NonComplianceTrackingState.update({
    @Default(false) bool loading,
    UserActionModel? nonComplianceUserAction,
  }) = NonComplianceTrackingUpdateState;
}
