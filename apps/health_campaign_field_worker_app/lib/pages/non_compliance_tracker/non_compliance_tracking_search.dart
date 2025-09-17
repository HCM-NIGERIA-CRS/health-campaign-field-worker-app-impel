import 'package:collection/collection.dart';
import 'package:digit_components/widgets/digit_info_card.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_chip.dart';
import 'package:digit_ui_components/widgets/atoms/digit_search_bar.dart';
import 'package:digit_ui_components/widgets/atoms/switch.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:registration_delivery/blocs/unique_id/unique_id.dart';
import 'package:registration_delivery/widgets/beneficiary/id_count_alert.dart';
import '../../blocs/non_compliance/non_compliance_all_search.dart';
import '../../blocs/non_compliance/non_compliance_search.dart';
import '../../blocs/non_compliance/non_compliance_tracking.dart';
import '../../utils/constants.dart';
import '../../utils/utils.dart';
import '../../widgets/custom_back_navigation.dart';
import 'package:registration_delivery/blocs/search_households/search_bloc_common_wrapper.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart'
    as registration_delivery;

import 'package:registration_delivery/utils/i18_key_constants.dart' as i18;
import '../../blocs/search/individual_global_search_smc.dart';
import '../../blocs/search/search_households_smc.dart'
    as searchHouseholdSMCBloc;
import '../../utils/i18_key_constants.dart' as i18_local;
import 'package:registration_delivery/utils/utils.dart';
import 'package:registration_delivery/widgets/localized.dart';

import '../../blocs/registration_delivery/custom_search_household.dart';
import '../../router/app_router.dart';
import '../../utils/search/global_search_parameters_smc.dart';
import '../../widgets/non_compliance_tracking/non_compliance_beneficiary_card.dart';
import '../../widgets/showcase/showcase_wrappers.dart';

@RoutePage()
class NonComplianceTrackingSearchPage extends LocalizedStatefulWidget {
  const NonComplianceTrackingSearchPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<NonComplianceTrackingSearchPage> createState() =>
      _NonComplianceTrackingSearchPage();
}

class _NonComplianceTrackingSearchPage
    extends LocalizedState<NonComplianceTrackingSearchPage> {
  final TextEditingController searchController = TextEditingController();

  bool isChildAbsentEnabled = false;
  bool isHouseNonCompliant = false;

  int offset = 0;
  int limit = 10;
  RegExp pattern = RegExp(r'^\d{9}$');

  bool _isProgressDialogVisible = false;
  final ProgressDialog _progressDialog = ProgressDialog();

  double lat = 0.0;
  double long = 0.0;
  List<String> selectedFilters = [];

  searchHouseholdSMCBloc.SearchHouseholdsSMCState searchHouseholdsSMCState =
      const searchHouseholdSMCBloc.SearchHouseholdsSMCState(
          loading: false, householdMembers: []);

  late final SearchBlocWrapper blocWrapper; // Declare BlocWrapper

  @override
  void initState() {
    // Initialize the BlocWrapper with instances of SearchHouseholdsBloc, SearchMemberBloc, and ProximitySearchBloc
    context
        .read<NonComplianceAllSearchBloc>()
        .add(NonComplianceAllSearchEvent.search(
          beneficiaryTag: context.loggedInUserUuid,
        ));
    context.read<LocationBloc>().add(const LoadLocationEvent());
    blocWrapper = context.read<SearchBlocWrapper>();

    context
        .read<IndividualGlobalSearchSMCBloc>()
        .add(const searchHouseholdSMCBloc.SearchHouseholdsSMCEvent.clear());
    super.initState();
  }

  @override
  void dispose() {
    blocWrapper.clearEvent();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) => Scaffold(
            body: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification) {
                  final metrics = scrollNotification.metrics;
                  if (metrics.atEdge && metrics.pixels != 0) {
                    // triggerGlobalSearchEvent(isPagination: true);
                  }
                }
                return true;
              },
              child: BlocBuilder<CustomSearchHouseholdsBloc,
                  CustomSearchHouseholdsState>(
                builder: (context, searchHouseholdsState) {
                  return ScrollableContent(
                    header: const Column(children: [
                      CustomBackNavigationHelpHeaderWidget(
                        showHelp: false,
                      ),
                    ]),
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(spacer2),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(spacer2),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    localizations.translate(i18_local
                                        .common.nonComplianceTrackingLabel),
                                    style: textTheme.headingXl.copyWith(
                                      color: theme.colorTheme.text.primary,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(spacer2),
                                        child: DigitSwitch(
                                          value: isChildAbsentEnabled,
                                          onChanged: (value) {
                                            searchController.clear();
                                            context
                                                .read<
                                                    IndividualGlobalSearchSMCBloc>()
                                                .add(const searchHouseholdSMCBloc
                                                    .SearchHouseholdsSMCEvent.clear());
                                            setState(() {
                                              isChildAbsentEnabled = value;

                                              isHouseNonCompliant = false;
                                              searchController.clear();
                                              blocWrapper.clearEvent();
                                            });

                                            if (isChildAbsentEnabled) {
                                              searchAbsentChild();
                                            }
                                          },
                                        ),
                                      ),
                                      Text(
                                        localizations.translate(i18_local
                                            .individualDetails
                                            .absentSearchTextLabel),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(spacer2),
                                        child: DigitSwitch(
                                          value: isHouseNonCompliant,
                                          onChanged: (value) {
                                            searchController.clear();
                                            context
                                                .read<
                                                    IndividualGlobalSearchSMCBloc>()
                                                .add(const searchHouseholdSMCBloc
                                                    .SearchHouseholdsSMCEvent.clear());
                                            setState(() {
                                              isHouseNonCompliant = value;
                                              isChildAbsentEnabled = false;

                                              searchController.clear();
                                              blocWrapper.clearEvent();
                                            });

                                            if (isHouseNonCompliant) {
                                              searchNonCompliantHouse();
                                            }
                                          },
                                        ),
                                      ),
                                      Text(
                                        localizations.translate(i18_local
                                            .individualDetails
                                            .nonCompliantHouseSearchTextLabel),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              BlocBuilder<LocationBloc, LocationState>(
                                builder: (context, locationState) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(spacer2),
                                        child: DigitSearchBar(
                                          controller: searchController,
                                          icon: const SizedBox.shrink(),
                                          keyboardType: TextInputType.text,
                                          hintText:
                                              (RegistrationDeliverySingleton()
                                                          .householdType ==
                                                      HouseholdType.community)
                                                  ? localizations.translate(i18
                                                      .searchBeneficiary
                                                      .clfSearchHintText)
                                                  : localizations.translate(
                                                      i18.searchBeneficiary
                                                          .beneficiarySearchHintText,
                                                    ),
                                          textCapitalization:
                                              TextCapitalization.words,
                                          onChanged: (value) {},
                                        ),
                                      ),
                                      selectedFilters.isNotEmpty
                                          ? Align(
                                              alignment: Alignment.topLeft,
                                              child: SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.06,
                                                child: ListView.builder(
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        selectedFilters.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(spacer1),
                                                        child: DigitChip(
                                                          label:
                                                              '${localizations.translate(getStatus(selectedFilters[index]))}'
                                                              ' (${searchHouseholdsState.totalResults})',
                                                          capitalizedFirstLetter:
                                                              false,
                                                          onItemDelete: () {
                                                            setState(() {
                                                              selectedFilters.remove(
                                                                  selectedFilters[
                                                                      index]);
                                                            });

                                                            // triggerGlobalSearchEvent();
                                                          },
                                                        ),
                                                      );
                                                    }),
                                              ),
                                            )
                                          : const Offstage(),
                                    ],
                                  );
                                },
                              ),
                              if (searchHouseholdsState.resultsNotFound &&
                                  !searchHouseholdsState.loading)
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: spacer2,
                                      top: spacer2,
                                      right: spacer2),
                                  child: InfoCard(
                                    type: InfoType.info,
                                    description:
                                        (RegistrationDeliverySingleton()
                                                    .householdType ==
                                                HouseholdType.community)
                                            ? localizations.translate(i18
                                                .searchBeneficiary.clfInfoTitle)
                                            : localizations.translate(
                                                i18_local.searchBeneficiary
                                                    .beneficiaryInfoDescription,
                                              ),
                                    title: localizations.translate(
                                      i18.searchBeneficiary
                                          .beneficiaryInfoTitle,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      if (searchHouseholdsState.loading)
                        const SliverFillRemaining(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      BlocBuilder<NonComplianceAllSearchBloc,
                          NonComplianceAllSearchState>(
                        builder: (context, nonComplianceState) {
                          if (nonComplianceState
                              is NonComplianceAllSearchCompleteState) {
                            Map<String, String?> statusMap = {};
                            List<UserActionModel> actions =
                                nonComplianceState.nonComplianceUserAction ??
                                    [];
                            for (var element in actions) {
                              if (element.resourceTag != null) {
                                statusMap[element.resourceTag!] = element
                                        .additionalFields?.fields
                                        .firstWhereOrNull(
                                            (e) => e.key == Constants.status)
                                        ?.value ??
                                    null;
                              }
                            }
                            if (isChildAbsentEnabled) {
                              BlocConsumer<
                                  IndividualGlobalSearchSMCBloc,
                                  searchHouseholdSMCBloc
                                  .SearchHouseholdsSMCState>(
                                listener: (context, searchSMCstate) {},
                                builder: (context, searchSMCstate) {
                                  if (searchSMCstate.loading) {
                                    return const SliverFillRemaining(
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  } else {
                                    if (isChildAbsentEnabled &&
                                        searchSMCstate
                                            .householdMembers.isEmpty) {
                                      return SliverList(
                                          delegate: SliverChildBuilderDelegate(
                                              (ctx, index) {
                                        return DigitInfoCard(
                                          description: localizations.translate(
                                            i18_local.searchBeneficiary
                                                .beneficiaryInfoDescription,
                                          ),
                                          title: localizations.translate(
                                            i18.searchBeneficiary
                                                .beneficiaryInfoTitle,
                                          ),
                                        );
                                      }, childCount: 1));
                                    }
                                    return SliverList(
                                      delegate: SliverChildBuilderDelegate(
                                        (ctx, index) {
                                          final i = searchSMCstate
                                              .householdMembers[index];
                                          return Container(
                                            margin: const EdgeInsets.only(
                                                bottom: kPadding),
                                            child: NonComplianceBeneficiaryCard(
                                              currentLocation:
                                                  Coordinate(lat, long),
                                              householdMember: i,
                                              onOpenPressed: () async {
                                                String id = i.tasks?.firstOrNull
                                                        ?.clientReferenceId ??
                                                    "";
                                                context
                                                    .read<
                                                        NonComplianceSearchBloc>()
                                                    .add(
                                                      NonComplianceSearchEvent
                                                          .search(
                                                        beneficiaryTag: context
                                                            .loggedInUserUuid,
                                                        resourceTag: id,
                                                      ),
                                                    );
                                                context.router.push(
                                                    NonComplianceUpdateStatusRoute(
                                                  householdMember: i,
                                                  userActionModel:
                                                      actions.firstWhereOrNull(
                                                    (element) =>
                                                        element.resourceTag ==
                                                        id,
                                                  ),
                                                ));
                                              },
                                            ),
                                          );
                                        },
                                        childCount: searchSMCstate
                                            .householdMembers.length,
                                      ),
                                    );
                                  }
                                },
                              );
                            }
                            if (isHouseNonCompliant) {
                              return BlocConsumer<
                                  IndividualGlobalSearchSMCBloc,
                                  searchHouseholdSMCBloc
                                  .SearchHouseholdsSMCState>(
                                listener: (context, searchSMCstate) {},
                                builder: (context, searchSMCstate) {
                                  if (searchSMCstate.loading) {
                                    return const SliverFillRemaining(
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  } else {
                                    if (isHouseNonCompliant &&
                                        searchSMCstate
                                            .householdMembers.isEmpty) {
                                      return SliverList(
                                          delegate: SliverChildBuilderDelegate(
                                              (ctx, index) {
                                        return DigitInfoCard(
                                          description: localizations.translate(
                                            i18_local.searchBeneficiary
                                                .beneficiaryInfoDescription,
                                          ),
                                          title: localizations.translate(
                                            i18.searchBeneficiary
                                                .beneficiaryInfoTitle,
                                          ),
                                        );
                                      }, childCount: 1));
                                    }
                                    return SliverList(
                                      delegate: SliverChildBuilderDelegate(
                                        (ctx, index) {
                                          final i = searchSMCstate
                                              .householdMembers[index];
                                          return Container(
                                            margin: const EdgeInsets.only(
                                                bottom: kPadding),
                                            child: NonComplianceBeneficiaryCard(
                                              currentLocation:
                                                  Coordinate(lat, long),
                                              householdMember: i,
                                              status: statusMap[i
                                                  .tasks
                                                  ?.firstOrNull
                                                  ?.clientReferenceId],
                                              onOpenPressed: () async {
                                                var id = i.tasks?.firstOrNull
                                                    ?.clientReferenceId;
                                                context
                                                    .read<
                                                        NonComplianceSearchBloc>()
                                                    .add(
                                                      NonComplianceSearchEvent.search(
                                                          beneficiaryTag: context
                                                              .loggedInUserUuid,
                                                          resourceTag: id),
                                                    );
                                                context.router.push(
                                                    NonComplianceUpdateStatusRoute(
                                                  householdMember: i,
                                                  userActionModel:
                                                      actions.firstWhereOrNull(
                                                    (element) =>
                                                        element.resourceTag ==
                                                        id,
                                                  ),
                                                ));
                                              },
                                            ),
                                          );
                                        },
                                        childCount: searchSMCstate
                                            .householdMembers.length,
                                      ),
                                    );
                                  }
                                },
                              );
                            }
                          }
                          return SliverList(
                              delegate:
                                  SliverChildBuilderDelegate((ctx, index) {
                            return const SizedBox.shrink();
                          }, childCount: 0));
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
            bottomNavigationBar: Offstage(
              offstage: RegistrationDeliverySingleton().householdType ==
                      HouseholdType.community &&
                  searchController.text.length < 3,
              child: BlocBuilder<CustomSearchHouseholdsBloc,
                      CustomSearchHouseholdsState>(
                  builder: (context, searchHouseholdsState) {
                return DigitCard(
                  margin: const EdgeInsets.only(top: spacer2),
                  padding: const EdgeInsets.all(spacer2),
                  children: [
                    DigitButton(
                      capitalizeLetters: false,
                      label: localizations.translate(i18.common.coreCommonHome),
                      mainAxisSize: MainAxisSize.max,
                      type: DigitButtonType.primary,
                      size: DigitButtonSize.large,
                      isDisabled: false,
                      onPressed: () {
                        context.router.maybePop();
                      },
                    ),
                  ],
                );
              }),
            )));
  }

  getFilterIconNLabel() {
    return {
      'label': localizations.translate(
        i18.searchBeneficiary.filterLabel,
      ),
      'icon': Icons.filter_alt
    };
  }

  // void searchByBeneficiaryId(
  //     {bool isPagination = false, String beneficiaryId = ""}) {
  //   final individualglobalsearchSMC =
  //       context.read<IndividualGlobalSearchSMCBloc>();
  //   individualglobalsearchSMC
  //       .add(searchHouseholdSMCBloc.IndividualGlobalSearchSMCEvent(
  //           globalSearchParams: GlobalSearchParametersSMC(
  //     isProximityEnabled: isProximityEnabled,
  //     latitude: lat,
  //     longitude: long,
  //     maxRadius: RegistrationDeliverySingleton().maxRadius,
  //     nameSearch: "",
  //     beneficiaryId: beneficiaryId,
  //     isChildAbsentEnabled: false,
  //     isHouseNonCompliant: isHouseNonCompliant,
  //     filter: selectedFilters,
  //     offset: isPagination
  //         ? blocWrapper.individualGlobalSearchBloc.state.offset
  //         : offset,
  //     limit: isPagination
  //         ? blocWrapper.individualGlobalSearchBloc.state.limit
  //         : limit,
  //     projectId: RegistrationDeliverySingleton().projectId!,
  //   )));
  // }

  bool isBeneficiaryIdValid(String value) {
    if (value.trim().length != Constants.beneficiaryIdLength) return false;

    return true;
  }

  bool isLowerCase(String ch) {
    return ch.codeUnitAt(0) >= 97 && ch.codeUnitAt(0) <= 122;
  }

  bool isBeneficiaryIdValidPattern(String value) {
    bool isValid = true;
    if (value.trim().length > Constants.beneficiaryIdLength) {
      isValid = false;
    } else if (!pattern.hasMatch(value.trim())) {
      isValid = false;
    }
    return isValid;
  }

  void searchAbsentChild({
    bool isPagination = false,
  }) {
    final individualglobalsearchSMC =
        context.read<IndividualGlobalSearchSMCBloc>();
    individualglobalsearchSMC
        .add(searchHouseholdSMCBloc.IndividualGlobalSearchSMCEvent(
            globalSearchParams: GlobalSearchParametersSMC(
      isProximityEnabled: false,
      latitude: lat,
      longitude: long,
      maxRadius: RegistrationDeliverySingleton().maxRadius,
      nameSearch: "",
      beneficiaryId: "",
      isChildAbsentEnabled: isChildAbsentEnabled,
      isHouseNonCompliant: isHouseNonCompliant,
      filter: selectedFilters,
      offset: isPagination
          ? blocWrapper.individualGlobalSearchBloc.state.offset
          : offset,
      limit: isPagination
          ? blocWrapper.individualGlobalSearchBloc.state.limit
          : limit,
      // projectId: RegistrationDeliverySingleton().projectId!,
    )));
  }

  void searchNonCompliantHouse({
    bool isPagination = false,
  }) {
    final individualglobalsearchSMC =
        context.read<IndividualGlobalSearchSMCBloc>();
    individualglobalsearchSMC
        .add(searchHouseholdSMCBloc.IndividualGlobalSearchSMCEvent(
            globalSearchParams: GlobalSearchParametersSMC(
      isProximityEnabled: false,
      latitude: lat,
      longitude: long,
      maxRadius: RegistrationDeliverySingleton().maxRadius,
      nameSearch: "",
      beneficiaryId: "",
      isChildAbsentEnabled: isChildAbsentEnabled,
      isHouseNonCompliant: isHouseNonCompliant,
      filter: selectedFilters,
      offset: isPagination
          ? blocWrapper.individualGlobalSearchBloc.state.offset
          : offset,
      limit: isPagination
          ? blocWrapper.individualGlobalSearchBloc.state.limit
          : limit,
      // projectId: RegistrationDeliverySingleton().projectId!,
    )));
  }

  void fetchBeneficiaryIdCount() {
    context.read<UniqueIdBloc>().add(const UniqueIdEvent.fetchIdCount());
  }
}
