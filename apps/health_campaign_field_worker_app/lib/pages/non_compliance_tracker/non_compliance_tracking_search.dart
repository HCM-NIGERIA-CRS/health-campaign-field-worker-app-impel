import 'package:collection/collection.dart';
import 'package:digit_components/widgets/digit_info_card.dart';
import 'package:digit_data_model/models/entities/beneficiary_type.dart';
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
import 'package:registration_delivery/blocs/search_households/individual_global_search.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart';
import 'package:registration_delivery/blocs/unique_id/unique_id.dart';
import 'package:registration_delivery/utils/global_search_parameters.dart';
import 'package:registration_delivery/widgets/beneficiary/id_count_alert.dart';
import '../../blocs/non_compliance/non_compliance_all_search.dart';
import '../../blocs/non_compliance/non_compliance_search.dart';
import '../../blocs/non_compliance/non_compliance_tracking.dart';
import '../../blocs/search/non_compliance_search.dart';
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
import '../../widgets/custom_pop_route.dart';
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

  Coordinate? location;
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
        .read<NonComplianceIndividualSearchBloc>()
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

    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, locationState) {
        location = Coordinate(locationState.latitude, locationState.longitude);
        return GlobalBackHandler(
          child: Scaffold(
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
              child: ScrollableContent(
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
                                                NonComplianceIndividualSearchBloc>()
                                            .add(const searchHouseholdSMCBloc
                                                .SearchHouseholdsSMCEvent.clear());
                                        setState(() {
                                          isChildAbsentEnabled = value;

                                          isHouseNonCompliant = false;
                                          searchController.clear();
                                          blocWrapper.clearEvent();
                                        });

                                        if (isChildAbsentEnabled) {
                                          searchBeneficiary();
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
                                                NonComplianceIndividualSearchBloc>()
                                            .add(const searchHouseholdSMCBloc
                                                .SearchHouseholdsSMCEvent.clear());
                                        setState(() {
                                          isHouseNonCompliant = value;
                                          isChildAbsentEnabled = false;

                                          searchController.clear();
                                          blocWrapper.clearEvent();
                                        });

                                        if (isHouseNonCompliant) {
                                          searchBeneficiary();
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(spacer2),
                                child: DigitSearchBar(
                                  controller: searchController,
                                  icon: const SizedBox.shrink(),
                                  keyboardType: TextInputType.text,
                                  hintText: (RegistrationDeliverySingleton()
                                              .householdType ==
                                          HouseholdType.community)
                                      ? localizations.translate(i18
                                          .searchBeneficiary.clfSearchHintText)
                                      : localizations.translate(
                                          i18.searchBeneficiary
                                              .beneficiarySearchHintText,
                                        ),
                                  textCapitalization: TextCapitalization.words,
                                  onChanged: (value) {
                                    context
                                        .read<
                                            NonComplianceIndividualSearchBloc>()
                                        .add(const searchHouseholdSMCBloc
                                            .SearchHouseholdsSMCEvent.clear());
                                    setState(() {
                                      blocWrapper.clearEvent();
                                    });
                                    if (value.trim().length >= 3) {
                                      searchBeneficiary(
                                        nameSearch: value.trim(),
                                      );
                                    } else if (value.isEmpty) {
                                      searchBeneficiary();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  BlocBuilder<NonComplianceAllSearchBloc,
                      NonComplianceAllSearchState>(
                    builder: (context, nonComplianceState) {
                      if (nonComplianceState
                          is NonComplianceAllSearchCompleteState) {
                        Map<String, String?> statusMap = {};
                        List<UserActionModel> actions =
                            nonComplianceState.nonComplianceUserAction ?? [];
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

                        // sort the user actions

                        List<UserActionModel> sortedUserAction = [];

                        if (actions.isNotEmpty) {
                          sortedUserAction.addAll(actions.sorted((a, b) {
                            return (b.clientAuditDetails?.lastModifiedTime ??
                                    b.clientAuditDetails?.createdTime ??
                                    0)
                                .compareTo(
                                    a.clientAuditDetails?.lastModifiedTime ??
                                        a.clientAuditDetails?.createdTime ??
                                        0);
                          }));
                        }

                        return BlocBuilder<NonComplianceIndividualSearchBloc,
                            searchHouseholdSMCBloc.SearchHouseholdsSMCState>(
                          builder: (context, searchSMCState) {
                            if (searchSMCState.loading) {
                              return const SliverFillRemaining(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            } else {
                              if ((isChildAbsentEnabled ||
                                      isHouseNonCompliant) &&
                                  searchSMCState.householdMembers.isEmpty) {
                                return SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                        (ctx, index) {
                                  return DigitInfoCard(
                                    description: localizations.translate(
                                      i18_local.searchBeneficiary
                                          .nonComplianceSearchInfoDescription,
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
                                    final i =
                                        searchSMCState.householdMembers[index];
                                    return Container(
                                      margin: const EdgeInsets.only(
                                          bottom: kPadding),
                                      child: NonComplianceBeneficiaryCard(
                                        currentLocation: location,
                                        householdMember: i,
                                        status: statusMap[i.tasks?.firstOrNull
                                            ?.clientReferenceId],
                                        onOpenPressed: () async {
                                          var id = i.tasks?.firstOrNull
                                              ?.clientReferenceId;
                                          context
                                              .read<NonComplianceSearchBloc>()
                                              .add(
                                                NonComplianceSearchEvent.search(
                                                    beneficiaryTag: context
                                                        .loggedInUserUuid,
                                                    resourceTag: id),
                                              );
                                          context.router.push(
                                              NonComplianceUpdateStatusRoute(
                                            householdMember: i,
                                            userActionModel: sortedUserAction
                                                .firstWhereOrNull(
                                              (element) =>
                                                  element.resourceTag == id,
                                            ),
                                          ));
                                        },
                                      ),
                                    );
                                  },
                                  childCount:
                                      searchSMCState.householdMembers.length,
                                ),
                              );
                            }
                          },
                        );
                      }
                      return SliverList(
                          delegate: SliverChildBuilderDelegate((ctx, index) {
                        return const SizedBox.shrink();
                      }, childCount: 0));
                    },
                  ),
                ],
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
                        if (FocusScope.of(context).hasFocus) {
                          FocusScope.of(context).unfocus();
                        }
                        context.router.maybePop();
                      },
                    ),
                  ],
                );
              }),
            ),
          ),
        );
      },
    );
  }

  getFilterIconNLabel() {
    return {
      'label': localizations.translate(
        i18.searchBeneficiary.filterLabel,
      ),
      'icon': Icons.filter_alt
    };
  }

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

  void searchBeneficiary({
    bool isPagination = false,
    String nameSearch = "",
  }) {
    final individualGlobalSearchSMC =
        context.read<NonComplianceIndividualSearchBloc>();
    individualGlobalSearchSMC
        .add(searchHouseholdSMCBloc.IndividualGlobalSearchSMCEvent(
            globalSearchParams: GlobalSearchParametersSMC(
      isProximityEnabled: false,
      latitude: location?.latitude,
      longitude: location?.longitude,
      maxRadius: RegistrationDeliverySingleton().maxRadius,
      nameSearch: nameSearch,
      beneficiaryId: null,
      isChildAbsentEnabled: isChildAbsentEnabled,
      isHouseNonCompliant: isHouseNonCompliant,
      filter: selectedFilters,
      offset: isPagination
          ? blocWrapper.individualGlobalSearchBloc.state.offset
          : offset,
      limit: isPagination
          ? blocWrapper.individualGlobalSearchBloc.state.limit
          : limit,
    )));
  }

  void fetchBeneficiaryIdCount() {
    context.read<UniqueIdBloc>().add(const UniqueIdEvent.fetchIdCount());
  }

  void searchBeneficiaryName({
    bool isPagination = false,
    String nameSearch = "",
  }) {
    if (!isPagination) {
      blocWrapper.clearEvent();
    }
    if (RegistrationDeliverySingleton().beneficiaryType ==
        BeneficiaryType.individual) {
      blocWrapper.individualGlobalSearchBloc
          .add(SearchHouseholdsEvent.individualGlobalSearch(
              globalSearchParams: GlobalSearchParameters(
        isProximityEnabled: false,
        latitude: location?.latitude,
        longitude: location?.longitude,
        maxRadius: RegistrationDeliverySingleton().maxRadius,
        nameSearch: nameSearch,
        filter: [],
        offset: isPagination
            ? blocWrapper.houseHoldGlobalSearchBloc.state.offset
            : offset,
        limit: isPagination
            ? blocWrapper.houseHoldGlobalSearchBloc.state.limit
            : limit,
      )));
    } else {
      blocWrapper.houseHoldGlobalSearchBloc.add(
        SearchHouseholdsEvent.houseHoldGlobalSearch(
          globalSearchParams: GlobalSearchParameters(
            projectId: RegistrationDeliverySingleton().projectId,
            isProximityEnabled: false,
            latitude: location?.latitude,
            longitude: location?.longitude,
            maxRadius: RegistrationDeliverySingleton().maxRadius,
            nameSearch: nameSearch,
            filter: [],
            offset: isPagination
                ? blocWrapper.houseHoldGlobalSearchBloc.state.offset
                : offset,
            limit: isPagination
                ? blocWrapper.houseHoldGlobalSearchBloc.state.limit
                : limit,
          ),
        ),
      );
    }
  }
}
