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

part 'dip_search.freezed.dart';

typedef DipSearchEmitter = Emitter<DipSearchState>;

class DipSearchBloc extends Bloc<DipSearchEvent, DipSearchState> {
  final CustomUserActionLocalRepository customUserActionLocalRepository;

  DipSearchBloc(
    super.initialState, {
    required this.customUserActionLocalRepository,
  }) {
    on(_handleSettlementSearch);
    on(_handleClearSearch);
  }

  FutureOr<void> _handleSettlementSearch(
    DipSearchSettlementEvent event,
    DipSearchEmitter emit,
  ) async {
    emit(const DipSearchState.search(
      loading: true,
      selectedDipUserAction: null,
    ));
    List<UserActionModel> vehicleUserActions =
        await customUserActionLocalRepository.searchUserAction(
            clientReferenceId: event.clientReferenceId);
    emit(DipSearchState.search(
      loading: false,
      selectedDipUserAction: vehicleUserActions.firstOrNull,
    ));
  }

  FutureOr<void> _handleClearSearch(
    DipSearchSettlementClearEvent event,
    DipSearchEmitter emit,
  ) {
    emit(const DipSearchState.search(
      loading: false,
      selectedDipUserAction: null,
    ));
  }
}

@freezed
class DipSearchEvent with _$DipSearchEvent {
  const factory DipSearchEvent.search({
    String? clientReferenceId,
  }) = DipSearchSettlementEvent;

  const factory DipSearchEvent.clearSearch() = DipSearchSettlementClearEvent;
}

@freezed
class DipSearchState with _$DipSearchState {
  const factory DipSearchState.init() = DipSearchInitState;
  const factory DipSearchState.search({
    @Default(false) bool loading,
    @Default(null) UserActionModel? selectedDipUserAction,
  }) = DipSearchSettlementState;
}
