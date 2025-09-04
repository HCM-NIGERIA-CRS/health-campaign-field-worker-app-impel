import 'package:digit_components/widgets/digit_info_card.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_chip.dart';
import 'package:digit_ui_components/widgets/atoms/digit_search_bar.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/atoms/switch.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:registration_delivery/blocs/app_localization.dart';
import 'package:registration_delivery/blocs/unique_id/unique_id.dart';
import 'package:registration_delivery/widgets/beneficiary/id_count_alert.dart';
import '../../blocs/registration_delivery/custom_beneficairy_registration.dart';
import '../../utils/constants.dart';
import '../../widgets/custom_back_navigation.dart';
import 'package:registration_delivery/blocs/search_households/search_bloc_common_wrapper.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart'
    as registration_delivery;

import 'package:registration_delivery/utils/i18_key_constants.dart' as i18;
import '../../utils/extensions/extensions.dart';
import '../../blocs/search/individual_global_search_smc.dart';
import '../../blocs/search/search_households_smc.dart'
    as searchHouseholdSMCBloc;
import '../../utils/i18_key_constants.dart' as i18_local;
import 'package:registration_delivery/models/entities/status.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:registration_delivery/utils/utils.dart';
import 'package:registration_delivery/widgets/beneficiary/view_beneficiary_card.dart';
import 'package:registration_delivery/widgets/localized.dart';
import 'package:registration_delivery/widgets/status_filter/status_filter.dart';

import '../../blocs/registration_delivery/custom_search_household.dart';
import '../../router/app_router.dart';
import '../../utils/search/global_search_parameters_smc.dart';
import '../../widgets/showcase/showcase_wrappers.dart';
import '../../widgets/registration_delivery/custom_view_beneficiary_card.dart';

@RoutePage()
class CustomSearchBeneficiaryPage extends LocalizedStatefulWidget {
  const CustomSearchBeneficiaryPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<CustomSearchBeneficiaryPage> createState() =>
      _CustomSearchBeneficiaryPageState();
}

class _CustomSearchBeneficiaryPageState
    extends LocalizedState<CustomSearchBeneficiaryPage> {
  final TextEditingController searchController = TextEditingController();
  bool isProximityEnabled = false;
  bool isSearchByBeneficiaryIdEnabled = false;

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

  // late final SearchBlocWrapper blocWrapper; // Declare BlocWrapper
  late final CustomSearchHouseholdsBloc customSearchHouseholdsBloc;

  searchHouseholdSMCBloc.SearchHouseholdsSMCState searchHouseholdsSMCState =
      const searchHouseholdSMCBloc.SearchHouseholdsSMCState(
          loading: false, householdMembers: []);

  late final SearchBlocWrapper blocWrapper; // Declare BlocWrapper

  @override
  void initState() {
    // Initialize the BlocWrapper with instances of SearchHouseholdsBloc, SearchMemberBloc, and ProximitySearchBloc
    customSearchHouseholdsBloc = context.read<CustomSearchHouseholdsBloc>();
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
                triggerGlobalSearchEvent(isPagination: true);
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
                                localizations.translate(
                                  RegistrationDeliverySingleton()
                                                  .householdType !=
                                              null &&
                                          RegistrationDeliverySingleton()
                                                  .householdType ==
                                              HouseholdType.community
                                      ? i18.searchBeneficiary.searchCLFLabel
                                      : RegistrationDeliverySingleton()
                                                  .beneficiaryType !=
                                              BeneficiaryType.household
                                          ? i18.searchBeneficiary
                                              .statisticsLabelText
                                          : i18.searchBeneficiary
                                              .searchIndividualLabelText,
                                ),
                                style: textTheme.headingXl.copyWith(
                                  color: theme.colorTheme.text.primary,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          BlocBuilder<LocationBloc, LocationState>(
                            builder: (context, locationState) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(spacer2),
                                    child: DigitSearchBar(
                                      controller: searchController,
                                      icon: const SizedBox.shrink(),
                                      keyboardType:
                                          !isSearchByBeneficiaryIdEnabled
                                              ? TextInputType.text
                                              : TextInputType.number,
                                      hintText: (RegistrationDeliverySingleton()
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
                                      onChanged: (value) {
                                        if (isSearchByBeneficiaryIdEnabled &&
                                            isBeneficiaryIdValid(
                                                value.trim()) &&
                                            searchController.text
                                                    .trim()
                                                    .length ==
                                                Constants.beneficiaryIdLength) {
                                          searchByBeneficiaryId(
                                              beneficiaryId: value.trim());
                                        } else if (isSearchByBeneficiaryIdEnabled &&
                                            searchController.text
                                                    .trim()
                                                    .length <
                                                Constants.beneficiaryIdLength) {
                                          blocWrapper.clearEvent();
                                          context
                                              .read<
                                                  IndividualGlobalSearchSMCBloc>()
                                              .add(const searchHouseholdSMCBloc
                                                  .SearchHouseholdsSMCEvent.clear());
                                        } else if (isSearchByBeneficiaryIdEnabled &&
                                            !isBeneficiaryIdValidPattern(
                                                searchController.text.trim())) {
                                          blocWrapper.clearEvent();
                                          context
                                              .read<
                                                  IndividualGlobalSearchSMCBloc>()
                                              .add(const searchHouseholdSMCBloc
                                                  .SearchHouseholdsSMCEvent.clear());
                                        } else if (!isSearchByBeneficiaryIdEnabled &&
                                            (value.isEmpty ||
                                                value.trim().length > 2)) {
                                          triggerGlobalSearchEvent();
                                        }
                                      },
                                    ),
                                  ),
                                  if (!isSearchByBeneficiaryIdEnabled)
                                    RegistrationDeliverySingleton()
                                                    .searchHouseHoldFilter !=
                                                null &&
                                            RegistrationDeliverySingleton()
                                                .searchHouseHoldFilter!
                                                .isNotEmpty &&
                                            RegistrationDeliverySingleton()
                                                    .householdType !=
                                                HouseholdType.community
                                        ? Align(
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(spacer2),
                                              child: DigitButton(
                                                label: getFilterIconNLabel()[
                                                    'label'],
                                                size: DigitButtonSize.medium,
                                                type: DigitButtonType.tertiary,
                                                suffixIcon:
                                                    getFilterIconNLabel()[
                                                        'icon'],
                                                onPressed: () =>
                                                    showFilterDialog(),
                                              ),
                                            ),
                                          )
                                        : const Offstage(),
                                  Column(
                                    children: [
                                      Row(children: [
                                        locationState.latitude != null
                                            ? Padding(
                                                padding: const EdgeInsets.all(
                                                    spacer2),
                                                child: DigitSwitch(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  label: (RegistrationDeliverySingleton()
                                                              .householdType ==
                                                          HouseholdType
                                                              .community)
                                                      ? localizations.translate(
                                                          i18.searchBeneficiary
                                                              .communityProximityLabel,
                                                        )
                                                      : localizations.translate(
                                                          i18.searchBeneficiary
                                                              .proximityLabel,
                                                        ),
                                                  value: isProximityEnabled,
                                                  onChanged: (value) {
                                                    searchController.clear();
                                                    setState(() {
                                                      isProximityEnabled =
                                                          value;
                                                      isSearchByBeneficiaryIdEnabled =
                                                          false;
                                                      isChildAbsentEnabled =
                                                          false;
                                                      isHouseNonCompliant =
                                                          false;
                                                      lat = locationState
                                                          .latitude!;
                                                      long = locationState
                                                          .longitude!;
                                                    });

                                                    if (locationState
                                                            .hasPermissions &&
                                                        value &&
                                                        locationState
                                                                .latitude !=
                                                            null &&
                                                        locationState
                                                                .longitude !=
                                                            null &&
                                                        RegistrationDeliverySingleton()
                                                                .maxRadius !=
                                                            null &&
                                                        isProximityEnabled) {
                                                      triggerGlobalSearchEvent();
                                                    } else {
                                                      triggerGlobalSearchEvent();
                                                    }
                                                  },
                                                ),
                                              )
                                            : const Offstage()
                                      ]),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.all(spacer2),
                                            child: DigitSwitch(
                                              value:
                                                  isSearchByBeneficiaryIdEnabled,
                                              onChanged: (value) {
                                                customSearchHouseholdsBloc.add(
                                                  const SearchHouseholdsClearEvent(),
                                                );
                                                searchController.clear();
                                                context
                                                    .read<
                                                        IndividualGlobalSearchSMCBloc>()
                                                    .add(const searchHouseholdSMCBloc
                                                        .SearchHouseholdsSMCEvent.clear());
                                                setState(() {
                                                  isSearchByBeneficiaryIdEnabled =
                                                      value;
                                                  isProximityEnabled = false;
                                                  isChildAbsentEnabled = false;
                                                  isHouseNonCompliant = false;
                                                  searchController.clear();
                                                  blocWrapper.clearEvent();
                                                });
                                              },
                                            ),
                                          ),
                                          Text(
                                            localizations.translate(i18_local
                                                .individualDetails
                                                .beneficiarySearchTextLabel),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.all(spacer2),
                                            child: DigitSwitch(
                                              value: isChildAbsentEnabled,
                                              onChanged: (value) {
                                                customSearchHouseholdsBloc.add(
                                                  const SearchHouseholdsClearEvent(),
                                                );
                                                searchController.clear();
                                                context
                                                    .read<
                                                        IndividualGlobalSearchSMCBloc>()
                                                    .add(const searchHouseholdSMCBloc
                                                        .SearchHouseholdsSMCEvent.clear());
                                                setState(() {
                                                  isChildAbsentEnabled = value;
                                                  isProximityEnabled = false;
                                                  isSearchByBeneficiaryIdEnabled =
                                                      false;
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
                                            padding:
                                                const EdgeInsets.all(spacer2),
                                            child: DigitSwitch(
                                              value: isHouseNonCompliant,
                                              onChanged: (value) {
                                                customSearchHouseholdsBloc.add(
                                                  const SearchHouseholdsClearEvent(),
                                                );
                                                searchController.clear();
                                                context
                                                    .read<
                                                        IndividualGlobalSearchSMCBloc>()
                                                    .add(const searchHouseholdSMCBloc
                                                        .SearchHouseholdsSMCEvent.clear());
                                                setState(() {
                                                  isHouseNonCompliant = value;
                                                  isChildAbsentEnabled = false;
                                                  isProximityEnabled = false;
                                                  isSearchByBeneficiaryIdEnabled =
                                                      false;
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
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            spacer1),
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

                                                        triggerGlobalSearchEvent();
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
                          if (!isSearchByBeneficiaryIdEnabled &&
                              searchHouseholdsState.resultsNotFound &&
                              !searchHouseholdsState.loading)
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: spacer2, top: spacer2, right: spacer2),
                              child: InfoCard(
                                type: InfoType.info,
                                description: (RegistrationDeliverySingleton()
                                            .householdType ==
                                        HouseholdType.community)
                                    ? localizations.translate(
                                        i18.searchBeneficiary.clfInfoTitle)
                                    : localizations.translate(
                                        i18_local.searchBeneficiary
                                            .beneficiaryInfoDescription,
                                      ),
                                title: localizations.translate(
                                  i18.searchBeneficiary.beneficiaryInfoTitle,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  if (!isSearchByBeneficiaryIdEnabled &&
                      searchHouseholdsState.loading)
                    const SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  BlocBuilder<LocationBloc, LocationState>(
                    builder: (context, locationState) {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (ctx, index) {
                            HouseholdMemberWrapper i = searchHouseholdsState
                                .householdMembers
                                .elementAt(index);
                            registration_delivery.HouseholdMemberWrapper
                                householdMemberWrapper =
                                registration_delivery.HouseholdMemberWrapper(
                              household: i.household,
                              headOfHousehold: i.headOfHousehold,
                              members: i.members,
                              projectBeneficiaries: i.projectBeneficiaries,
                              distance: i.distance,
                              tasks: i.tasks,
                              sideEffects: i.sideEffects,
                              referrals: i.referrals,
                            );
                            final distance = calculateDistance(
                              Coordinate(
                                lat,
                                long,
                              ),
                              Coordinate(
                                householdMemberWrapper
                                    .household?.address?.latitude,
                                householdMemberWrapper
                                    .household?.address?.longitude,
                              ),
                            );

                            return Container(
                              margin: const EdgeInsets.only(bottom: spacer2),
                              child: CustomViewBeneficiaryCard(
                                distance: isProximityEnabled ? distance : null,
                                householdMember: householdMemberWrapper,
                                onOpenPressed: () async {
                                  final scannerBloc =
                                      context.read<DigitScannerBloc>();

                                  scannerBloc.add(
                                    const DigitScannerEvent.handleScanner(),
                                  );

                                  if ((householdMemberWrapper.tasks != null &&
                                          householdMemberWrapper
                                                  .tasks?.lastOrNull!.status ==
                                              Status.closeHousehold.toValue() &&
                                          (householdMemberWrapper.tasks ?? [])
                                              .isNotEmpty) ||
                                      (householdMemberWrapper
                                                  .projectBeneficiaries ??
                                              [])
                                          .isEmpty) {
                                    setState(() {
                                      selectedFilters = [];
                                    });
                                    customSearchHouseholdsBloc.add(
                                      const SearchHouseholdsClearEvent(),
                                    );
                                    await context.router.push(
                                      CustomBeneficiaryRegistrationWrapperRoute(
                                        initialState: BeneficiaryRegistrationState.editHousehold(
                                            householdModel: householdMemberWrapper
                                                .household!,
                                            individualModel:
                                                householdMemberWrapper.members!,
                                            registrationDate: DateTime.now(),
                                            projectBeneficiaryModel:
                                                (householdMemberWrapper.projectBeneficiaries ?? [])
                                                        .isNotEmpty
                                                    ? householdMemberWrapper
                                                        .projectBeneficiaries
                                                        ?.lastOrNull
                                                    : null,
                                            addressModel:
                                                (RegistrationDeliverySingleton()
                                                            .householdType ==
                                                        HouseholdType.community)
                                                    ? householdMemberWrapper
                                                        .household!.address!
                                                    : householdMemberWrapper
                                                        .headOfHousehold!
                                                        .address!
                                                        .lastOrNull!,
                                            headOfHousehold: householdMemberWrapper
                                                .headOfHousehold),
                                      ),
                                    );
                                  } else {
                                    await context.router.push(
                                      BeneficiaryWrapperRoute(
                                        wrapper: householdMemberWrapper,
                                      ),
                                    );
                                  }
                                  setState(() {
                                    isProximityEnabled = false;
                                  });
                                  searchController.clear();
                                  selectedFilters.clear();
                                  customSearchHouseholdsBloc.add(
                                    const SearchHouseholdsClearEvent(),
                                  );
                                },
                              ),
                            );
                          },
                          childCount:
                              searchHouseholdsState.householdMembers.length,
                        ),
                      );
                    },
                  ),
                  if (isSearchByBeneficiaryIdEnabled)
                    BlocConsumer<IndividualGlobalSearchSMCBloc,
                        searchHouseholdSMCBloc.SearchHouseholdsSMCState>(
                      listener: (context, searchSMCstate) {},
                      builder: (context, searchSMCstate) {
                        if (searchSMCstate.loading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          if (searchController.text.trim().length ==
                                  Constants.beneficiaryIdLength &&
                              searchSMCstate.householdMembers.isEmpty) {
                            return SliverList(
                                delegate:
                                    SliverChildBuilderDelegate((ctx, index) {
                              return DigitInfoCard(
                                description: localizations.translate(
                                  i18_local.searchBeneficiary
                                      .beneficiaryInfoDescription,
                                ),
                                title: localizations.translate(
                                  i18.searchBeneficiary.beneficiaryInfoTitle,
                                ),
                              );
                            }, childCount: 1));
                          }
                          return SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (ctx, index) {
                                final i =
                                    searchSMCstate.householdMembers[index];
                                return Container(
                                  margin:
                                      const EdgeInsets.only(bottom: kPadding),
                                  child: CustomViewBeneficiaryCard(
                                    householdMember: i,
                                    onOpenPressed: () async {
                                      final scannerBloc =
                                          context.read<DigitScannerBloc>();

                                      scannerBloc.add(
                                        const DigitScannerEvent.handleScanner(),
                                      );

                                      if ((i.tasks != null &&
                                              i.tasks?.last.status ==
                                                  Status.closeHousehold
                                                      .toValue() &&
                                              (i.tasks ?? []).isNotEmpty) ||
                                          (i.projectBeneficiaries ?? [])
                                              .isEmpty) {
                                        setState(() {
                                          selectedFilters = [];
                                        });
                                        blocWrapper.clearEvent();
                                        await context.router.push(
                                          CustomBeneficiaryRegistrationWrapperRoute(
                                            initialState: BeneficiaryRegistrationState.editHousehold(
                                                householdModel: i.household!,
                                                individualModel: i.members!,
                                                registrationDate:
                                                    DateTime.now(),
                                                projectBeneficiaryModel:
                                                    (i.projectBeneficiaries ??
                                                                [])
                                                            .isNotEmpty
                                                        ? i.projectBeneficiaries
                                                            ?.lastOrNull
                                                        : null,
                                                addressModel:
                                                    (RegistrationDeliverySingleton()
                                                                .householdType ==
                                                            HouseholdType
                                                                .community)
                                                        ? i.household!.address!
                                                        : i
                                                            .headOfHousehold!
                                                            .address!
                                                            .lastOrNull!,
                                                headOfHousehold:
                                                    i.headOfHousehold),
                                          ),
                                        );
                                      } else {
                                        await context.router.push(
                                            BeneficiaryWrapperRoute(
                                                wrapper: i));
                                      }
                                      setState(() {
                                        isProximityEnabled = false;
                                        isSearchByBeneficiaryIdEnabled = false;
                                      });
                                      searchController.clear();
                                      selectedFilters.clear();
                                      blocWrapper.clearEvent();
                                    },
                                  ),
                                );
                              },
                              childCount:
                                  searchSMCstate.householdMembers.length,
                            ),
                          );
                        }
                      },
                    ),
                  if (isChildAbsentEnabled)
                    BlocConsumer<IndividualGlobalSearchSMCBloc,
                        searchHouseholdSMCBloc.SearchHouseholdsSMCState>(
                      listener: (context, searchSMCstate) {},
                      builder: (context, searchSMCstate) {
                        if (searchSMCstate.loading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          if (isChildAbsentEnabled &&
                              searchSMCstate.householdMembers.isEmpty) {
                            return SliverList(
                                delegate:
                                    SliverChildBuilderDelegate((ctx, index) {
                              return DigitInfoCard(
                                description: localizations.translate(
                                  i18_local.searchBeneficiary
                                      .beneficiaryInfoDescription,
                                ),
                                title: localizations.translate(
                                  i18.searchBeneficiary.beneficiaryInfoTitle,
                                ),
                              );
                            }, childCount: 1));
                          }
                          return SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (ctx, index) {
                                final i =
                                    searchSMCstate.householdMembers[index];
                                return Container(
                                  margin:
                                      const EdgeInsets.only(bottom: kPadding),
                                  child: CustomViewBeneficiaryCard(
                                    householdMember: i,
                                    onOpenPressed: () async {
                                      final scannerBloc =
                                          context.read<DigitScannerBloc>();

                                      scannerBloc.add(
                                        const DigitScannerEvent.handleScanner(),
                                      );

                                      if ((i.tasks != null &&
                                              i.tasks?.last.status ==
                                                  Status.closeHousehold
                                                      .toValue() &&
                                              (i.tasks ?? []).isNotEmpty) ||
                                          (i.projectBeneficiaries ?? [])
                                              .isEmpty) {
                                        setState(() {
                                          selectedFilters = [];
                                        });
                                        blocWrapper.clearEvent();
                                        await context.router.push(
                                          CustomBeneficiaryRegistrationWrapperRoute(
                                            initialState: BeneficiaryRegistrationState.editHousehold(
                                                householdModel: i.household!,
                                                individualModel: i.members!,
                                                registrationDate:
                                                    DateTime.now(),
                                                projectBeneficiaryModel:
                                                    (i.projectBeneficiaries ??
                                                                [])
                                                            .isNotEmpty
                                                        ? i.projectBeneficiaries
                                                            ?.lastOrNull
                                                        : null,
                                                addressModel:
                                                    (RegistrationDeliverySingleton()
                                                                .householdType ==
                                                            HouseholdType
                                                                .community)
                                                        ? i.household!.address!
                                                        : i
                                                            .headOfHousehold!
                                                            .address!
                                                            .lastOrNull!,
                                                headOfHousehold:
                                                    i.headOfHousehold),
                                          ),
                                        );
                                      } else {
                                        await context.router.push(
                                            BeneficiaryWrapperRoute(
                                                wrapper: i));
                                      }
                                      setState(() {
                                        isProximityEnabled = false;
                                        isSearchByBeneficiaryIdEnabled = false;
                                        isChildAbsentEnabled = false;
                                      });
                                      searchController.clear();
                                      selectedFilters.clear();
                                      blocWrapper.clearEvent();
                                    },
                                  ),
                                );
                              },
                              childCount:
                                  searchSMCstate.householdMembers.length,
                            ),
                          );
                        }
                      },
                    ),
                  if (isHouseNonCompliant)
                    BlocConsumer<IndividualGlobalSearchSMCBloc,
                        searchHouseholdSMCBloc.SearchHouseholdsSMCState>(
                      listener: (context, searchSMCstate) {},
                      builder: (context, searchSMCstate) {
                        if (searchSMCstate.loading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          if (isHouseNonCompliant &&
                              searchSMCstate.householdMembers.isEmpty) {
                            return SliverList(
                                delegate:
                                    SliverChildBuilderDelegate((ctx, index) {
                              return DigitInfoCard(
                                description: localizations.translate(
                                  i18_local.searchBeneficiary
                                      .beneficiaryInfoDescription,
                                ),
                                title: localizations.translate(
                                  i18.searchBeneficiary.beneficiaryInfoTitle,
                                ),
                              );
                            }, childCount: 1));
                          }
                          return SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (ctx, index) {
                                final i =
                                    searchSMCstate.householdMembers[index];
                                return Container(
                                  margin:
                                      const EdgeInsets.only(bottom: kPadding),
                                  child: CustomViewBeneficiaryCard(
                                    householdMember: i,
                                    onOpenPressed: () async {
                                      final scannerBloc =
                                          context.read<DigitScannerBloc>();

                                      scannerBloc.add(
                                        const DigitScannerEvent.handleScanner(),
                                      );

                                      if ((i.tasks != null &&
                                              i.tasks?.last.status ==
                                                  Status.closeHousehold
                                                      .toValue() &&
                                              (i.tasks ?? []).isNotEmpty) ||
                                          (i.tasks != null &&
                                              i.tasks?.last.status ==
                                                  Status.administeredFailed
                                                      .toValue() &&
                                              (i.tasks ?? []).isNotEmpty) ||
                                          (i.projectBeneficiaries ?? [])
                                              .isEmpty) {
                                        setState(() {
                                          selectedFilters = [];
                                        });
                                        blocWrapper.clearEvent();
                                        await context.router.push(
                                          CustomBeneficiaryRegistrationWrapperRoute(
                                            initialState: BeneficiaryRegistrationState.editHousehold(
                                                householdModel: i.household!,
                                                individualModel: i.members!,
                                                registrationDate:
                                                    DateTime.now(),
                                                projectBeneficiaryModel:
                                                    (i.projectBeneficiaries ??
                                                                [])
                                                            .isNotEmpty
                                                        ? i.projectBeneficiaries
                                                            ?.lastOrNull
                                                        : null,
                                                addressModel:
                                                    (RegistrationDeliverySingleton()
                                                                .householdType ==
                                                            HouseholdType
                                                                .community)
                                                        ? i.household!.address!
                                                        : i
                                                            .headOfHousehold!
                                                            .address!
                                                            .lastOrNull!,
                                                headOfHousehold:
                                                    i.headOfHousehold),
                                          ),
                                        );
                                      } else {
                                        await context.router.push(
                                            BeneficiaryWrapperRoute(
                                                wrapper: i));
                                      }
                                      setState(() {
                                        isProximityEnabled = false;
                                        isSearchByBeneficiaryIdEnabled = false;
                                        isHouseNonCompliant = false;
                                        isChildAbsentEnabled = false;
                                      });
                                      searchController.clear();
                                      selectedFilters.clear();
                                      blocWrapper.clearEvent();
                                    },
                                  ),
                                );
                              },
                              childCount:
                                  searchSMCstate.householdMembers.length,
                            ),
                          );
                        }
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
            return BlocListener<UniqueIdBloc, UniqueIdState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  idCount: (availableIdCount, totalCount) {
                    if (availableIdCount != 0 &&
                        availableIdCount <
                            RegistrationDeliverySingleton()
                                .beneficiaryIdMinCount!) {
                      showLowIdsAlert(
                          context: context,
                          availableCount: availableIdCount,
                          localizations: localizations,
                          shouldProceedFurther: (bool proceed) {
                            if (proceed) {
                              context.router.push(
                                  CustomBeneficiaryRegistrationWrapperRoute(
                                initialState:
                                    BeneficiaryRegistrationCreateState(
                                  searchQuery:
                                      searchHouseholdsState.searchQuery,
                                ),
                              ));
                            }
                          });
                    } else if (availableIdCount >=
                        RegistrationDeliverySingleton()
                            .beneficiaryIdMinCount!) {
                      context.router
                          .push(CustomBeneficiaryRegistrationWrapperRoute(
                        initialState: BeneficiaryRegistrationCreateState(
                          searchQuery: searchHouseholdsState.searchQuery,
                        ),
                      ));
                    }
                    if (availableIdCount <= 0) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        showNoIdsAlert(
                            context: context,
                            showSkip: true,
                            localizations: localizations,
                            shouldProceedFurther: (bool skip) {});
                      });
                    }
                  },
                  ids: (ids) {
                    _isProgressDialogVisible = false;
                  },
                  fetching: (currentCount, totalCount) {
                    if (_isProgressDialogVisible == false) {
                      _progressDialog.showProgressDialog(
                        context: context,
                        localizations:
                            RegistrationDeliveryLocalization.of(context),
                        currentCount: currentCount,
                        totalCount: totalCount,
                        theme: Theme.of(context),
                      );
                      _isProgressDialogVisible = true;
                    } else {
                      // To update progress:
                      _progressDialog.updateProgressDialog(
                        currentCount: currentCount,
                        totalCount: totalCount,
                      );
                    }
                  },
                  failed: (String? error) {
                    _progressDialog.closeProgressDialog();
                    _isProgressDialogVisible = false;
                    if (error != null) {
                      Toast.showToast(context,
                          message: localizations.translate(
                            i18.beneficiaryDetails.failedBeneficiaryIds,
                          ),
                          type: ToastType.error);
                    }
                  },
                  limitExceeded: (String? error) {
                    _progressDialog.closeProgressDialog();
                    _isProgressDialogVisible = false;
                    if (error != null) {
                      showCustomPopup(
                          context: context,
                          builder: (ctx) {
                            return Popup(
                              type: PopUpType.alert,
                              onCrossTap: () {
                                Navigator.of(ctx).pop();
                              },
                              actions: [
                                DigitButton(
                                  capitalizeLetters: false,
                                  type: DigitButtonType.primary,
                                  size: DigitButtonSize.large,
                                  mainAxisSize: MainAxisSize.max,
                                  onPressed: () {
                                    Navigator.pop(ctx);
                                    context.read<UniqueIdBloc>().add(
                                          const UniqueIdEvent
                                              .fetchUniqueIdsFromServer(
                                              reFetch: true),
                                        );
                                  },
                                  label: localizations.translate(i18
                                      .beneficiaryDetails
                                      .beneficiaryIdsReFetch),
                                ),
                                DigitButton(
                                  capitalizeLetters: false,
                                  type: DigitButtonType.secondary,
                                  size: DigitButtonSize.large,
                                  mainAxisSize: MainAxisSize.max,
                                  onPressed: () {
                                    Navigator.pop(ctx);
                                  },
                                  label: localizations.translate(
                                    i18.common.corecommonclose,
                                  ),
                                ),
                              ],
                              title: localizations.translate(i18
                                  .beneficiaryDetails.beneficiaryIdsLimitError),
                            );
                          });
                    }
                  },
                  noInternet: () {
                    _progressDialog.closeProgressDialog();
                    _isProgressDialogVisible = false;
                    showCustomPopup(
                        context: context,
                        builder: (ctx) {
                          return Popup(
                            type: PopUpType.alert,
                            onCrossTap: () {
                              Navigator.of(ctx).pop();
                            },
                            actions: [
                              DigitButton(
                                capitalizeLetters: false,
                                type: DigitButtonType.primary,
                                size: DigitButtonSize.large,
                                mainAxisSize: MainAxisSize.max,
                                onPressed: () {
                                  Navigator.of(ctx).pop();

                                  context.read<UniqueIdBloc>().add(
                                        const UniqueIdEvent
                                            .fetchUniqueIdsFromServer(),
                                      );
                                },
                                label: localizations.translate(
                                  i18.common.coreCommonDataSyncRetry,
                                ),
                              ),
                              DigitButton(
                                capitalizeLetters: false,
                                type: DigitButtonType.secondary,
                                size: DigitButtonSize.large,
                                mainAxisSize: MainAxisSize.max,
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                label: localizations.translate(
                                  i18.common.corecommonclose,
                                ),
                              ),
                            ],
                            title: localizations
                                .translate(i18.common.coreCommonNoInternet),
                            description: localizations.translate(i18
                                .beneficiaryDetails
                                .noInternetBeneficiaryIdsText),
                          );
                        });
                  },
                );
              },
              child: DigitCard(
                margin: const EdgeInsets.only(top: spacer2),
                padding: const EdgeInsets.all(spacer4),
                children: [
                  DigitButton(
                    capitalizeLetters: false,
                    label: (RegistrationDeliverySingleton().householdType ==
                            HouseholdType.community)
                        ? localizations
                            .translate(i18.searchBeneficiary.clfAddActionLabel)
                        : localizations.translate(
                            i18.searchBeneficiary.beneficiaryAddActionLabel,
                          ),
                    mainAxisSize: MainAxisSize.max,
                    type: DigitButtonType.primary,
                    size: DigitButtonSize.large,
                    isDisabled: false,
                    onPressed: () {
                      Map<String, int> skuCounts = context
                          .getAllProductSkuCounts()
                          .map((key, value) => MapEntry(key, value));

                      String descriptionText = localizations.translate(i18_local
                          .beneficiaryDetails.insufficientStockMessage);

                      if (skuCounts.isEmpty) {
                        skuCounts = {
                          'Polio - nOPV, bOPV': 0,
                          'Measles - MRV': 0
                        };
                      }

                      skuCounts.forEach((productSku, productCount) {
                        print("Checking $productSku: count = $productCount");
                        if ((productCount == 0)) {
                          descriptionText +=
                              "\n  $productSku ${localizations.translate(i18_local.beneficiaryDetails.productSkuCountUnit)}";
                        }
                      });
                      bool hasAvailableStock = skuCounts.values
                          .any((productCount) => productCount > 0);

                      if (hasAvailableStock) {
                        FocusManager.instance.primaryFocus?.unfocus();

                        searchController.clear();
                        selectedFilters = [];
                        customSearchHouseholdsBloc.add(
                          const SearchHouseholdsClearEvent(),
                        );
                        fetchBeneficiaryIdCount();
                      } else {
                        showCustomPopup(
                          context: context,
                          builder: (popupContext) => Popup(
                            title: localizations.translate(i18_local
                                .beneficiaryDetails.insufficientStockHeading),
                            onOutsideTap: () {
                              Navigator.of(popupContext).pop(false);
                            },
                            description: descriptionText,
                            type: PopUpType.simple,
                            actions: [
                              DigitButton(
                                label: localizations.translate(
                                  i18_local.beneficiaryDetails.goToHome,
                                ),
                                onPressed: () {
                                  Navigator.of(
                                    popupContext,
                                    rootNavigator: true,
                                  ).pop();
                                  final parent =
                                      context.router.parent() as StackRouter;
                                  // Pop twice to navigate back to the previous screen
                                  parent.popUntilRouteWithName(HomeRoute.name);
                                },
                                type: DigitButtonType.primary,
                                size: DigitButtonSize.large,
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          }),
        ),
      ),
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

  showFilterDialog() async {
    var filters = await showDialog(
        context: context,
        builder: (ctx) => Popup(
                title: getFilterIconNLabel()['label'],
                titleIcon: Icon(
                  getFilterIconNLabel()['icon'],
                  color: DigitTheme.instance.colorScheme.primary,
                ),
                onCrossTap: () {
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).pop();
                },
                additionalWidgets: [
                  StatusFilter(
                    selectedFilters: selectedFilters,
                  ),
                ]));

    if (filters != null && filters.isNotEmpty) {
      setState(() {
        selectedFilters = [];
      });
      setState(() {
        selectedFilters.addAll(filters);
      });
      triggerGlobalSearchEvent();
    } else {
      setState(() {
        selectedFilters = [];
      });
      customSearchHouseholdsBloc.add(
        const SearchHouseholdsClearEvent(),
      );
      triggerGlobalSearchEvent();
    }
  }

  void searchByBeneficiaryId(
      {bool isPagination = false, String beneficiaryId = ""}) {
    final individualglobalsearchSMC =
        context.read<IndividualGlobalSearchSMCBloc>();
    individualglobalsearchSMC
        .add(searchHouseholdSMCBloc.IndividualGlobalSearchSMCEvent(
            globalSearchParams: GlobalSearchParametersSMC(
      isProximityEnabled: isProximityEnabled,
      latitude: lat,
      longitude: long,
      maxRadius: RegistrationDeliverySingleton().maxRadius,
      nameSearch: "",
      beneficiaryId: beneficiaryId,
      isChildAbsentEnabled: false,
      isHouseNonCompliant: isHouseNonCompliant,
      filter: selectedFilters,
      offset: isPagination
          ? blocWrapper.individualGlobalSearchBloc.state.offset
          : offset,
      limit: isPagination
          ? blocWrapper.individualGlobalSearchBloc.state.limit
          : limit,
      projectId: RegistrationDeliverySingleton().projectId!,
    )));
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

  void triggerGlobalSearchEvent({bool isPagination = false}) {
    if (!isPagination) {
      customSearchHouseholdsBloc.add(
        const SearchHouseholdsClearEvent(),
      );
    }

    if (searchController.text.trim().length < 3 && !isProximityEnabled) {
      customSearchHouseholdsBloc.add(
        const SearchHouseholdsClearEvent(),
      );
      return;
    } else {
      if (isProximityEnabled && searchController.text.trim().length < 3) {
        customSearchHouseholdsBloc.add(
          const SearchHouseholdsLoadingEvent(),
        );
        customSearchHouseholdsBloc
            .add(CustomSearchHouseholdsEvent.searchByProximity(
          latitude: lat,
          longititude: long,
          projectId: RegistrationDeliverySingleton().projectId!,
          maxRadius: RegistrationDeliverySingleton().maxRadius!,
          offset:
              isPagination ? customSearchHouseholdsBloc.state.offset : offset,
          limit: isPagination ? customSearchHouseholdsBloc.state.limit : limit,
        ));
      } else {
        customSearchHouseholdsBloc.add(
          const SearchHouseholdsLoadingEvent(),
        );
        customSearchHouseholdsBloc.add(
          CustomSearchHouseholdsEvent.searchByHouseholdHead(
            searchText: searchController.text.trim(),
            projectId: RegistrationDeliverySingleton().projectId!,
            latitude: lat,
            longitude: long,
            isProximityEnabled: isProximityEnabled,
            maxRadius: RegistrationDeliverySingleton().maxRadius,
            offset:
                isPagination ? customSearchHouseholdsBloc.state.offset : offset,
            limit:
                isPagination ? customSearchHouseholdsBloc.state.limit : limit,
          ),
        );
      }
    }
  }

  void searchAbsentChild({
    bool isPagination = false,
  }) {
    final individualglobalsearchSMC =
        context.read<IndividualGlobalSearchSMCBloc>();
    individualglobalsearchSMC
        .add(searchHouseholdSMCBloc.IndividualGlobalSearchSMCEvent(
            globalSearchParams: GlobalSearchParametersSMC(
      isProximityEnabled: isProximityEnabled,
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
      projectId: RegistrationDeliverySingleton().projectId!,
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
      isProximityEnabled: isProximityEnabled,
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
      projectId: RegistrationDeliverySingleton().projectId!,
    )));
  }

  void fetchBeneficiaryIdCount() {
    context.read<UniqueIdBloc>().add(const UniqueIdEvent.fetchIdCount());
  }
}
