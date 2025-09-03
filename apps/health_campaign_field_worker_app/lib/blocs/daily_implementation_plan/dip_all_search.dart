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

part 'dip_all_search.freezed.dart';

typedef DipAllSearchEmitter = Emitter<DipAllSearchState>;

class DipAllSearchBloc extends Bloc<DipAllSearchEvent, DipAllSearchState> {
  final CustomUserActionLocalRepository customUserActionLocalRepository;

  DipAllSearchBloc(
    super.initialState, {
    required this.customUserActionLocalRepository,
  }) {
    on(_handleAllSettlementSearch);
    on(_handleClearAllSearch);
  }

  FutureOr<void> _handleAllSettlementSearch(
    DipAllSearchSettlementEvent event,
    DipAllSearchEmitter emit,
  ) async {
    emit(const DipAllSearchState.search(
      loading: true,
      allDipUserAction: null,
    ));
    List<UserActionModel>? vehicleUserActions =
        await customUserActionLocalRepository.searchUserAction(
            action: event.userAction);
    emit(DipAllSearchState.search(
      loading: false,
      allDipUserAction: vehicleUserActions,
    ));
  }

  FutureOr<void> _handleClearAllSearch(
    DipAllSearchSettlementClearEvent event,
    DipAllSearchEmitter emit,
  ) {
    emit(const DipAllSearchState.search(
      loading: false,
      allDipUserAction: null,
    ));
  }
}

@freezed
class DipAllSearchEvent with _$DipAllSearchEvent {
  const factory DipAllSearchEvent.search({
    String? userAction,
  }) = DipAllSearchSettlementEvent;

  const factory DipAllSearchEvent.clearSearch() =
      DipAllSearchSettlementClearEvent;
}

@freezed
class DipAllSearchState with _$DipAllSearchState {
  const factory DipAllSearchState.init() = DipAllSearchInitState;
  const factory DipAllSearchState.search({
    @Default(false) bool loading,
    @Default(null) List<UserActionModel>? allDipUserAction,
  }) = DipAllSearchSettlementState;
}
