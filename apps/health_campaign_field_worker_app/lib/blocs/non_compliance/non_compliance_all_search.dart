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

part 'non_compliance_all_search.freezed.dart';

typedef NonComplianceAllSearchEmitter = Emitter<NonComplianceAllSearchState>;

class NonComplianceAllSearchBloc
    extends Bloc<NonComplianceAllSearchEvent, NonComplianceAllSearchState> {
  final UserActionLocalRepository userActionLocalRepository;
  final CustomUserActionLocalRepository customUserActionLocalRepository;

  NonComplianceAllSearchBloc(
    super.initialState, {
    required this.userActionLocalRepository,
    required this.customUserActionLocalRepository,
  }) {
    on(_handleSearch);
  }

  FutureOr<void> _handleSearch(
    NonComplianceAllSearchEvent event,
    NonComplianceAllSearchEmitter emit,
  ) async {
    List<UserActionModel> nonComplianceUserActions =
        await customUserActionLocalRepository.searchUserAction(
      beneficiaryTag: event.beneficiaryTag,
      action: "NON_COMPLIANCE",
    );
    emit(NonComplianceAllSearchState.search(
      loading: false,
      nonComplianceUserAction: nonComplianceUserActions,
    ));
  }
}

@freezed
class NonComplianceAllSearchEvent with _$NonComplianceAllSearchEvent {
  const factory NonComplianceAllSearchEvent.search({
    String? beneficiaryTag,
  }) = NonComplianceAllSearchCompleteEvent;
}

@freezed
class NonComplianceAllSearchState with _$NonComplianceAllSearchState {
  const factory NonComplianceAllSearchState.init() =
      NonComplianceAllSearchInitState;
  const factory NonComplianceAllSearchState.search({
    @Default(false) bool loading,
    List<UserActionModel>? nonComplianceUserAction,
  }) = NonComplianceAllSearchCompleteState;
}
