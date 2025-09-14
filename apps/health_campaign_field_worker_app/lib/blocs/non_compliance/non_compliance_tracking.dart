import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart';
import 'package:registration_delivery/models/entities/status.dart';
import 'package:registration_delivery/models/entities/task.dart';
import 'package:registration_delivery/utils/typedefs.dart';
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
    on(_handleSearch);
    on(_handleAllSearch);
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

  FutureOr<void> _handleSearch(
    NonComplianceTrackingSearchEvent event,
    NonComplianceTrackingEmitter emit,
  ) async {
    List<UserActionModel> nonComplianceUserActions =
        await customUserActionLocalRepository.searchUserAction(
      beneficiaryTag: event.beneficiaryTag,
      action: "NON_COMPLIANCE",
    );
    emit(NonComplianceTrackingState.search(
      loading: false,
      nonComplianceUserAction: nonComplianceUserActions.firstOrNull,
    ));
  }

  FutureOr<void> _handleAllSearch(
    NonComplianceTrackingAllSearchEvent event,
    NonComplianceTrackingEmitter emit,
  ) async {
    List<UserActionModel> nonComplianceUserActions =
        await customUserActionLocalRepository.searchUserAction(
      action: "NON_COMPLIANCE",
    );
    emit(NonComplianceTrackingState.allSearch(
      loading: false,
      nonComplianceUserAction: nonComplianceUserActions,
    ));
  }
}

@freezed
class NonComplianceTrackingEvent with _$NonComplianceTrackingEvent {
  const factory NonComplianceTrackingEvent.create(
          {UserActionModel? nonComplianceUserAction}) =
      NonComplianceTrackingCreateEvent;
  const factory NonComplianceTrackingEvent.search({
    String? beneficiaryTag,
  }) = NonComplianceTrackingSearchEvent;
  const factory NonComplianceTrackingEvent.allSearch() =
      NonComplianceTrackingAllSearchEvent;
}

@freezed
class NonComplianceTrackingState with _$NonComplianceTrackingState {
  const factory NonComplianceTrackingState.init() =
      NonComplianceTrackingInitState;
  const factory NonComplianceTrackingState.create({
    @Default(false) bool loading,
    UserActionModel? nonComplianceUserAction,
  }) = NonComplianceTrackingCreateState;
  const factory NonComplianceTrackingState.search({
    @Default(false) bool loading,
    UserActionModel? nonComplianceUserAction,
  }) = NonComplianceTrackingSearchState;
  const factory NonComplianceTrackingState.allSearch({
    @Default(false) bool loading,
    List<UserActionModel>? nonComplianceUserAction,
  }) = NonComplianceTrackingAllSearchState;
}
