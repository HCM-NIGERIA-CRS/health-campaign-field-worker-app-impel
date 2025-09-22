import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_flow.freezed.dart';

typedef CurrentFlowEmitter = Emitter<CurrentFlowState>;

class CurrentFlowBloc extends Bloc<CurrentFlowEvent, CurrentFlowState> {
  CurrentFlowBloc(
    super.initialState,
  ) {
    on(_setCurrentFlow);
  }

  FutureOr<void> _setCurrentFlow(
    CurrentFlowEvent event,
    CurrentFlowEmitter emit,
  ) async {
    emit(CurrentFlowState.set(
      currentFlows: event.currentFlows,
    ));
  }
}

@freezed
class CurrentFlowEvent with _$CurrentFlowEvent {
  const factory CurrentFlowEvent.set({
    Set<String>? currentFlows,
  }) = CurrentFlowSetEvent;
}

@freezed
class CurrentFlowState with _$CurrentFlowState {
  const factory CurrentFlowState.set({
    Set<String>? currentFlows,
  }) = CurrentFlowSetState;
}
