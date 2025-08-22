import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transit_post/data/repositories/local/user_action.dart';

part 'register_daily_plan.freezed.dart';

typedef RegisterDailyPlanEmitter = Emitter<RegisterDailyPlanState>;

class RegisterDailyPlanBloc
    extends Bloc<RegisterDailyPlanEvent, RegisterDailyPlanState> {
  final UserActionLocalRepository userActionLocalRepository;

  RegisterDailyPlanBloc(
    super.initialState, {
    required this.userActionLocalRepository,
  }) {
    on(_handleCreate);
  }

  FutureOr<void> _handleCreate(
    RegisterDailyPlanCreateEvent event,
    RegisterDailyPlanEmitter emit,
  ) async {}
}

@freezed
class RegisterDailyPlanEvent with _$RegisterDailyPlanEvent {
  const factory RegisterDailyPlanEvent.handleCreate() =
      RegisterDailyPlanCreateEvent;
}

@freezed
class RegisterDailyPlanState with _$RegisterDailyPlanState {
  const factory RegisterDailyPlanState.create({
    @Default(false) bool loading,
  }) = RegisterDailyPlanCreateState;
}
