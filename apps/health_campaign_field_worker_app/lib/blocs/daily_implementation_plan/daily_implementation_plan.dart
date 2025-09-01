import 'dart:async';
import 'dart:collection';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registration_delivery/utils/utils.dart';
import 'package:transit_post/data/repositories/local/user_action.dart';

import '../../data/repositories/local/custom_user_action.dart';

part 'daily_implementation_plan.freezed.dart';

typedef DailyImplementationPlanEmitter = Emitter<DailyImplementationPlanState>;

class DailyImplementationPlanBloc
    extends Bloc<DailyImplementationPlanEvent, DailyImplementationPlanState> {
  final CustomUserActionLocalRepository userActionLocalRepository;

  DailyImplementationPlanBloc(
    super.initialState, {
    required this.userActionLocalRepository,
  }) {
    on(_selectSettlement);
    on(_selectSettlementDate);
    on(_handleCreate);
    on(_handleAllSettlementSearch);
    on(_handleSettlementSearch);
  }

  FutureOr<void> _selectSettlement(
    DailyImplementationPlanSelectSettlementsEvent event,
    DailyImplementationPlanEmitter emit,
  ) async {
    emit(DailyImplementationPlanState.selectSettlements(
      date: event.date,
      administrativeUnit: event.administrativeUnit,
      wfpSupervisor: event.wfpSupervisor,
      selectedSettlements: event.selectedSettlements,
    ));
  }

  FutureOr<void> _selectSettlementDate(
    DailyImplementationPlanSelectSettlementsDateEvent event,
    DailyImplementationPlanEmitter emit,
  ) async {
    DailyImplementationPlanSelectSettlementsState? currentState;
    try {
      currentState = state as DailyImplementationPlanSelectSettlementsState;
    } catch (e) {}

    Map<String, String> selectedSettlements = {};
    for (var settlement in (currentState?.selectedSettlementsDate ?? {}).keys) {
      selectedSettlements[settlement] =
          currentState!.selectedSettlementsDate![settlement]!;
    }
    for (var settlement in event.selectedSettlementsDate.keys) {
      selectedSettlements[settlement] =
          event.selectedSettlementsDate[settlement]!;
    }
    emit(DailyImplementationPlanState.selectSettlements(
      date: currentState?.date,
      administrativeUnit: currentState?.administrativeUnit,
      wfpSupervisor: currentState?.wfpSupervisor,
      selectedSettlements: currentState?.selectedSettlements,
      selectedSettlementsDate: selectedSettlements,
    ));
  }

  FutureOr<void> _handleCreate(
    DailyImplementationPlanCreateEvent event,
    DailyImplementationPlanEmitter emit,
  ) async {
    emit(const DailyImplementationPlanState.create(loading: true));
    UserActionModel dipActionModel = event.dipUserAction;
    try {
      dipActionModel = dipActionModel.copyWith(
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
      await userActionLocalRepository.createUserAction(dipActionModel);
      emit(DailyImplementationPlanState.create(
        loading: false,
        dipUserAction: dipActionModel,
      ));
    } catch (e) {}
  }

  FutureOr<void> _handleAllSettlementSearch(
    DailyImplementationPlanAllSearchEvent event,
    DailyImplementationPlanEmitter emit,
  ) async {
    DailyImplementationPlanSearchState? currentState;
    try {
      currentState = state as DailyImplementationPlanSearchState;
    } catch (e) {}

    emit(DailyImplementationPlanState.search(
      loading: true,
      selectedDipUserAction: currentState?.selectedDipUserAction,
      allDipUserAction: currentState?.allDipUserAction,
    ));
    List<UserActionModel>? vehicleUserActions =
        await userActionLocalRepository.searchUserAction(
      action: event.userAction,
    );
    emit(DailyImplementationPlanState.search(
      loading: false,
      selectedDipUserAction: currentState?.selectedDipUserAction,
      allDipUserAction: vehicleUserActions,
    ));
  }

  FutureOr<void> _handleSettlementSearch(
    DailyImplementationPlanSearchEvent event,
    DailyImplementationPlanEmitter emit,
  ) async {
    DailyImplementationPlanSearchState? currentState;
    try {
      currentState = state as DailyImplementationPlanSearchState;
    } catch (e) {}
    emit(DailyImplementationPlanState.search(
      loading: true,
      selectedDipUserAction: currentState?.selectedDipUserAction,
      allDipUserAction: currentState?.allDipUserAction,
    ));
    List<UserActionModel> vehicleUserActions = await userActionLocalRepository
        .searchUserAction(clientReferenceId: event.clientReferenceId);
    emit(DailyImplementationPlanState.search(
      loading: false,
      selectedDipUserAction: vehicleUserActions.firstOrNull,
      allDipUserAction: currentState?.allDipUserAction,
    ));
  }
}

@freezed
class DailyImplementationPlanEvent with _$DailyImplementationPlanEvent {
  const factory DailyImplementationPlanEvent.handleSelectSettlements({
    required int date,
    required String administrativeUnit,
    required String wfpSupervisor,
    required List<String> selectedSettlements,
  }) = DailyImplementationPlanSelectSettlementsEvent;

  const factory DailyImplementationPlanEvent.handleSelectSettlementsDate({
    required Map<String, String> selectedSettlementsDate,
  }) = DailyImplementationPlanSelectSettlementsDateEvent;

  const factory DailyImplementationPlanEvent.handleCreate({
    required UserActionModel dipUserAction,
  }) = DailyImplementationPlanCreateEvent;

  const factory DailyImplementationPlanEvent.handleAllSearch({
    String? userAction,
  }) = DailyImplementationPlanAllSearchEvent;

  const factory DailyImplementationPlanEvent.handleSearch({
    String? clientReferenceId,
  }) = DailyImplementationPlanSearchEvent;
}

@freezed
class DailyImplementationPlanState with _$DailyImplementationPlanState {
  const factory DailyImplementationPlanState.init() =
      DailyImplementationPlanInitState;

  const factory DailyImplementationPlanState.selectSettlements({
    @Default(null) int? date,
    @Default(null) String? administrativeUnit,
    @Default(null) String? wfpSupervisor,
    @Default(null) List<String>? selectedSettlements,
    @Default(null) Map<String, String>? selectedSettlementsDate,
  }) = DailyImplementationPlanSelectSettlementsState;

  const factory DailyImplementationPlanState.create(
          {@Default(false) bool loading,
          @Default(null) UserActionModel? dipUserAction}) =
      DailyImplementationPlanCreateState;

  const factory DailyImplementationPlanState.search({
    @Default(false) bool loading,
    @Default(null) UserActionModel? selectedDipUserAction,
    @Default(null) List<UserActionModel>? allDipUserAction,
  }) = DailyImplementationPlanSearchState;
}
