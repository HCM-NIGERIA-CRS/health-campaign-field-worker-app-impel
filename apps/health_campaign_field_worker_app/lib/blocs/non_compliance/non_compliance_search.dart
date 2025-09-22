import 'dart:async';

import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transit_post/data/repositories/local/user_action.dart';

import '../../data/repositories/local/transit_post/custom_user_action.dart';

part 'non_compliance_search.freezed.dart';

typedef NonComplianceSearchEmitter = Emitter<NonComplianceSearchState>;

class NonComplianceSearchBloc
    extends Bloc<NonComplianceSearchEvent, NonComplianceSearchState> {
  final UserActionLocalRepository userActionLocalRepository;
  final CustomUserActionLocalRepository customUserActionLocalRepository;

  NonComplianceSearchBloc(
    super.initialState, {
    required this.userActionLocalRepository,
    required this.customUserActionLocalRepository,
  }) {
    on(_handleSearch);
  }

  FutureOr<void> _handleSearch(
    NonComplianceSearchEvent event,
    NonComplianceSearchEmitter emit,
  ) async {
    List<UserActionModel> nonComplianceUserActions =
        await customUserActionLocalRepository.searchUserAction(
      beneficiaryTag: event.beneficiaryTag,
      resourceTag: event.resourceTag,
      action: "NON_COMPLIANCE",
    );
    emit(NonComplianceSearchState.search(
      loading: false,
      nonComplianceUserAction: nonComplianceUserActions.firstOrNull,
    ));
  }
}

@freezed
class NonComplianceSearchEvent with _$NonComplianceSearchEvent {
  const factory NonComplianceSearchEvent.search({
    String? beneficiaryTag,
    String? resourceTag,
  }) = NonComplianceSearchCompleteEvent;
}

@freezed
class NonComplianceSearchState with _$NonComplianceSearchState {
  const factory NonComplianceSearchState.init() = NonComplianceSearchInitState;
  const factory NonComplianceSearchState.search({
    @Default(false) bool loading,
    UserActionModel? nonComplianceUserAction,
  }) = NonComplianceSearchCompleteState;
}
