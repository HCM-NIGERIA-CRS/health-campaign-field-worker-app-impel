import 'dart:async';
import 'dart:collection';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registration_delivery/utils/utils.dart';
import 'package:transit_post/data/repositories/local/user_action.dart';

import '../../data/repositories/local/transit_post/custom_user_action.dart';
import '../../models/settlement/settlement_model.dart';

part 'daily_implementation_plan.freezed.dart';

typedef DailyImplementationPlanEmitter = Emitter<DailyImplementationPlanState>;

class DailyImplementationPlanBloc
    extends Bloc<DailyImplementationPlanEvent, DailyImplementationPlanState> {
  final CustomUserActionLocalRepository customUserActionLocalRepository;
  final UserActionLocalRepository userActionLocalRepository;

  DailyImplementationPlanBloc(
    super.initialState, {
    required this.customUserActionLocalRepository,
    required this.userActionLocalRepository,
  }) {
    on(_selectSettlement);
    on(_selectSettlementDate);
    on(_handleCreate);
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

    List<SettlementModel> settlementData =
        currentState?.settlementData?.map((e) => e).toList() ?? [];

    for (SettlementModel settlement in event.settlementData) {
      int index = settlementData
          .indexWhere((e) => e.boundaryCode == settlement.boundaryCode);
      index == -1
          ? settlementData.add(settlement)
          : settlementData[index] = settlement;
    }
    emit(DailyImplementationPlanState.selectSettlements(
      date: currentState?.date,
      administrativeUnit: currentState?.administrativeUnit,
      wfpSupervisor: currentState?.wfpSupervisor,
      selectedSettlements: currentState?.selectedSettlements,
      settlementData: settlementData,
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
      await userActionLocalRepository.create(dipActionModel);
      emit(DailyImplementationPlanState.create(
        loading: false,
        dipUserAction: dipActionModel,
      ));
    } catch (e) {}
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
    required List<SettlementModel> settlementData,
  }) = DailyImplementationPlanSelectSettlementsDateEvent;

  const factory DailyImplementationPlanEvent.handleCreate({
    required UserActionModel dipUserAction,
  }) = DailyImplementationPlanCreateEvent;
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
    @Default(null) List<SettlementModel>? settlementData,
  }) = DailyImplementationPlanSelectSettlementsState;

  const factory DailyImplementationPlanState.create(
          {@Default(false) bool loading,
          @Default(null) UserActionModel? dipUserAction}) =
      DailyImplementationPlanCreateState;
}
