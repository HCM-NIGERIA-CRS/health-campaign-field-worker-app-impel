import 'dart:async';
import 'dart:collection';

import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/repositories/local/transit_post/custom_user_action.dart';

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
    List<UserActionModel> userActions =
        await customUserActionLocalRepository.searchUserAction(
      beneficiaryTag: event.beneficiaryTag,
      action: "DAILY_PLAN",
    );
    emit(DipSearchState.search(
      loading: false,
      selectedDipUserAction: userActions.firstOrNull,
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
    String? beneficiaryTag,
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
