import 'package:collection/collection.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:registration_delivery/blocs/app_localization.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart';
import 'package:registration_delivery/blocs/unique_id/unique_id.dart';
import 'package:registration_delivery/widgets/beneficiary/id_count_alert.dart';
// import 'package:digit_components/utils/date_utils.dart' as digits;
import '../../utils/date_utils.dart' as digits;
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_ui_components/theme/ComponentTheme/checkbox_theme.dart';
import '../../utils/app_enums.dart';
import '../../widgets/custom_back_navigation.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:digit_components/widgets/atoms/digit_dropdown.dart' as dropdown;
// import 'package:health_campaign_field_worker_app/widgets/header/custom_back_button.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/utils/constants.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';

import 'package:registration_delivery/blocs/household_overview/household_overview.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:registration_delivery/utils/i18_key_constants.dart' as i18;
import '../../utils/i18_key_constants.dart' as i18_local;
import 'package:registration_delivery/utils/utils.dart';
// import 'package:registration_delivery/widgets/back_navigation_help_header.dart';
import 'package:registration_delivery/widgets/localized.dart';
import 'package:registration_delivery/widgets/showcase/config/showcase_constants.dart';

import '../../blocs/registration_delivery/custom_beneficairy_registration.dart';
import '../../router/app_router.dart';
import '../../utils/utils.dart' as local_utils;
import '../../utils/constants.dart' as local_constants;
import '../../widgets/date/custom_digit_dob_picker.dart';
import 'custom_beneficiary_acknowledgement.dart';
import '../../utils/i18_key_constants.dart' as i18_local;

@RoutePage()
class CustomIndividualDetailsPage extends LocalizedStatefulWidget {
  final bool isHeadOfHousehold;

  const CustomIndividualDetailsPage({
    super.key,
    super.appLocalizations,
    this.isHeadOfHousehold = false,
  });

  @override
  State<CustomIndividualDetailsPage> createState() =>
      CustomIndividualDetailsPageState();
}

class CustomIndividualDetailsPageState
    extends LocalizedState<CustomIndividualDetailsPage> {
  static const _individualNameKey = 'individualName';
  static const _dobKey = 'dob';
  static const _genderKey = 'gender';
  static const _mobileNumberKey = 'mobileNumber';

  bool isDuplicateTag = false;
  static const maxLength = 200;
  final clickedStatus = ValueNotifier<bool>(false);
  DateTime now = DateTime.now();
  String? generatedUniqueId;

  bool _isProgressDialogVisible = false;
  final ProgressDialog _progressDialog = ProgressDialog();

  @override
  void dispose() {
    _progressDialog.dispose();
    super.dispose();
  }

  bool isEditIndividual = false;
  bool isAddIndividual = false;
  bool isCreate = false;
  // info capture add memberIndividual which can be passed to eligibility
  IndividualModel? individualCaptured;

  final beneficiaryType = RegistrationDeliverySingleton().beneficiaryType!;
  Set<String>? beneficiaryId;

  late final SearchHouseholdsBloc searchHouseholdsBloc;

  @override
  void initState() {
    if (RegistrationDeliverySingleton()
        .idTypeOptions!
        .contains(IdentifierTypes.uniqueBeneficiaryID.toValue())) {
      context.read<UniqueIdBloc>().add(const UniqueIdEvent.fetchIdCount());
    }
    final bloc = context.read<CustomBeneficiaryRegistrationBloc>();

    // info fetching the beneficiary id
    bloc.state.maybeMap(
      create: (value) {
        fetchUniqueBeneficiaryId();
      },
      addMember: (value) {
        fetchUniqueBeneficiaryId();
      },
      editHousehold: (value) {},
      editIndividual: (value) {
        fetchUniqueBeneficiaryId();
      },
      orElse: () {},
    );
    searchHouseholdsBloc = context.read<SearchHouseholdsBloc>();

    super.initState();
  }

  onSubmit(bool isCreate, bool isAddIndividual) {
    final bloc = context.read<CustomBeneficiaryRegistrationBloc>();

    if (context.mounted) {
      if (isCreate) {
        bloc.add(
          BeneficiaryRegistrationCreateEvent(
              projectId: RegistrationDeliverySingleton().projectId!,
              userUuid: RegistrationDeliverySingleton().loggedInUserUuid!,
              boundary: RegistrationDeliverySingleton().boundary!,
              tag: null,
              navigateToSummary: false),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CustomBeneficiaryRegistrationBloc>();
    final router = context.router;
    final theme = Theme.of(context);
    DateTime before150Years = DateTime(now.year - 150, now.month, now.day);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      body: ReactiveFormBuilder(
          form: () => buildForm(bloc.state),
          builder: (context, form, child) =>
              BlocListener<UniqueIdBloc, UniqueIdState>(
                listener: (context, uniqueIdState) {
                  uniqueIdState.maybeWhen(
                      orElse: () {},
                      idCount: (availableCount, totalCount) {
                        if (availableCount > 0) {
                          context
                              .read<UniqueIdBloc>()
                              .add(const UniqueIdEvent.fetchAUniqueId());
                        }
                      },
                      aUniqueId: (uniqueId) {
                        generatedUniqueId = uniqueId.id;
                      });
                },
                child:
                    BlocConsumer<SearchHouseholdsBloc, SearchHouseholdsState>(
                  listener: (context, searchHouseholdsState) {
                    if (isCreate) {
                      HouseholdMemberWrapper? householdMemberWrapper =
                          searchHouseholdsState.householdMembers.lastOrNull;

                      if (householdMemberWrapper != null) {
                        router.push(CustomBeneficiaryAcknowledgementRoute(
                          enableViewHousehold: true,
                          acknowledgementType: AcknowledgementType.addHousehold,
                        ));
                      }
                    } else if (isAddIndividual) {
                      HouseholdMemberWrapper? householdMemberWrapper =
                          searchHouseholdsState.householdMembers.lastOrNull;

                      if (householdMemberWrapper != null) {
                        if (individualCaptured != null) {
                          // assumption add individual here is used for creating child,
                          //if invalid age send to overview no checklist
                          // if (verifyIfChildAgeValid(
                          //     context, individualCaptured!)) {
                          //   router.push(
                          //     BeneficiaryWrapperRoute(
                          //       wrapper: householdMemberWrapper,
                          //       children: [
                          //         CustomBeneficiaryDetailsRoute(
                          //           individualSelected: individualCaptured,
                          //           eligibilityAssessmentType:
                          //               EligibilityAssessmentType.smc,
                          //         )
                          //       ],
                          //     ),
                          //   );
                          // } else {
                          //   router.push(
                          //     BeneficiaryWrapperRoute(
                          //       wrapper: householdMemberWrapper,
                          //     ),
                          //   );
                          // }

                          final overviewBloc =
                              context.read<HouseholdOverviewBloc>();

                          overviewBloc.add(
                            HouseholdOverviewReloadEvent(
                              projectId: RegistrationDeliverySingleton()
                                  .projectId
                                  .toString(),
                              projectBeneficiaryType:
                                  RegistrationDeliverySingleton()
                                          .beneficiaryType ??
                                      BeneficiaryType.household,
                            ),
                          );
                          overviewBloc.stream
                              .firstWhere((element) =>
                                  element.loading == false &&
                                  element.householdMemberWrapper.household !=
                                      null)
                              .then((value) {
                            HouseholdMemberWrapper memberWrapper =
                                overviewBloc.state.householdMemberWrapper;
                            final route = router.parent() as StackRouter;
                            route.popUntilRouteWithName(
                                SearchBeneficiaryRoute.name);
                            route.push(BeneficiaryWrapperRoute(
                                wrapper: memberWrapper));
                          });
                        } else {
                          (router.parent() as StackRouter).maybePop();
                          router.popUntil((route) =>
                              route.settings.name ==
                              SearchBeneficiaryRoute.name);
                          router.push(CustomBeneficiaryAcknowledgementRoute(
                            enableViewHousehold: true,
                            acknowledgementType: AcknowledgementType.addMember,
                          ));
                        }
                      }
                    } else if (isEditIndividual) {
                      HouseholdMemberWrapper? householdMemberWrapper =
                          searchHouseholdsState.householdMembers.lastOrNull;

                      if (householdMemberWrapper != null) {
                        if (individualCaptured != null) {
                          final overviewBloc =
                              context.read<HouseholdOverviewBloc>();

                          overviewBloc.add(
                            HouseholdOverviewReloadEvent(
                              projectId: RegistrationDeliverySingleton()
                                  .projectId
                                  .toString(),
                              projectBeneficiaryType:
                                  RegistrationDeliverySingleton()
                                          .beneficiaryType ??
                                      BeneficiaryType.household,
                            ),
                          );
                          overviewBloc.stream
                              .firstWhere((element) =>
                                  element.loading == false &&
                                  element.householdMemberWrapper.household !=
                                      null)
                              .then((value) {
                            HouseholdMemberWrapper memberWrapper =
                                overviewBloc.state.householdMemberWrapper;
                            final route = router.parent() as StackRouter;
                            route.popUntilRouteWithName(
                                SearchBeneficiaryRoute.name);
                            route.push(BeneficiaryWrapperRoute(
                                wrapper: memberWrapper));
                          });
                        } else {
                          (router.parent() as StackRouter).maybePop();
                          router.popUntil((route) =>
                              route.settings.name ==
                              SearchBeneficiaryRoute.name);
                          router.push(CustomBeneficiaryAcknowledgementRoute(
                            enableViewHousehold: true,
                            acknowledgementType: AcknowledgementType.addMember,
                          ));
                        }
                      }
                    }
                  },
                  builder: (context, searchHouseholdsState) {
                    return BlocConsumer<CustomBeneficiaryRegistrationBloc,
                        BeneficiaryRegistrationState>(
                      listener: (context, state) {
                        state.mapOrNull(persisted: (value) async {
                          searchHouseholdsBloc
                              .add(const SearchHouseholdsEvent.clear());
                          searchHouseholdsBloc.add(
                            SearchHouseholdsEvent.searchByHousehold(
                              householdModel: value.householdModel,
                              projectId:
                                  RegistrationDeliverySingleton().projectId!,
                              isProximityEnabled: false,
                              maxRadius:
                                  RegistrationDeliverySingleton().maxRadius,
                            ),
                          );

                          final reloadState =
                              context.read<HouseholdOverviewBloc>();

                          reloadState.add(
                            HouseholdOverviewReloadEvent(
                              projectId:
                                  RegistrationDeliverySingleton().projectId!,
                              projectBeneficiaryType:
                                  RegistrationDeliverySingleton()
                                      .beneficiaryType!,
                            ),
                          );

                          if (individualCaptured != null) {
                            reloadState.add(
                              HouseholdOverviewEvent.selectedIndividual(
                                individualModel: individualCaptured!,
                              ),
                            );
                          }

                          // final router = context.router;
                          // if (value.navigateToRoot) {
                          //   final overviewBloc =
                          //       context.read<HouseholdOverviewBloc>();

                          //   overviewBloc.add(
                          //     HouseholdOverviewReloadEvent(
                          //       projectId: RegistrationDeliverySingleton()
                          //           .projectId
                          //           .toString(),
                          //       projectBeneficiaryType:
                          //           RegistrationDeliverySingleton()
                          //                   .beneficiaryType ??
                          //               BeneficiaryType.household,
                          //     ),
                          //   );

                          //   await overviewBloc.stream.firstWhere((element) =>
                          //       element.loading == false &&
                          //       element.householdMemberWrapper.household !=
                          //           null);
                          //   registration_delivery.HouseholdMemberWrapper
                          //       memberWrapper =
                          //       overviewBloc.state.householdMemberWrapper;
                          //   final route = router.parent() as StackRouter;
                          //   route.popUntilRouteWithName(
                          //       SearchBeneficiaryRoute.name);
                          //   route.push(BeneficiaryWrapperRoute(
                          //       wrapper: memberWrapper));
                          // }
                        });
                      },
                      builder: (context, state) {
                        return ScrollableContent(
                          enableFixedDigitButton: true,
                          header: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: spacer2),
                              child: CustomBackNavigationHelpHeaderWidget(
                                showHelp: false,
                                handleback: () {
                                  if (isEditIndividual) {
                                    final parent =
                                        context.router.parent() as StackRouter;
                                    parent.maybePop();
                                  } else {
                                    searchHouseholdsBloc.add(
                                        const SearchHouseholdsEvent.clear());
                                    context.router.maybePop();
                                  }
                                },
                              ),
                            ),
                          ]),
                          footer: DigitCard(
                              margin: const EdgeInsets.only(top: spacer2),
                              children: [
                                ValueListenableBuilder(
                                  valueListenable: clickedStatus,
                                  builder: (context, bool isClicked, _) {
                                    return DigitButton(
                                      label: state.mapOrNull(
                                            editIndividual: (value) =>
                                                localizations.translate(
                                                    i18.common.coreCommonSave),
                                          ) ??
                                          localizations.translate(
                                              i18.common.coreCommonSubmit),
                                      type: DigitButtonType.primary,
                                      size: DigitButtonSize.large,
                                      mainAxisSize: MainAxisSize.max,
                                      onPressed: () async {
                                        final age =
                                            form.control(_dobKey).value == null
                                                ? DigitDOBAgeConvertor(
                                                    years: 0,
                                                    months: 0,
                                                    days: 0)
                                                : DigitDateUtils.calculateAge(
                                                    form.control(_dobKey).value
                                                        as DateTime,
                                                  );
                                        if ((age.years == 0 &&
                                                age.months == 0) ||
                                            age.years >= 150 &&
                                                age.months > 0) {
                                          form
                                              .control(_dobKey)
                                              .setErrors({'': true});
                                        }

                                        if (age.years < 18 &&
                                            widget.isHeadOfHousehold) {
                                          await DigitToast.show(
                                            context,
                                            options: DigitToastOptions(
                                              localizations.translate(i18_local
                                                  .individualDetails
                                                  .headAgeValidError),
                                              true,
                                              theme,
                                            ),
                                          );

                                          return;
                                        }

                                        final submit = await showDialog(
                                          context: context,
                                          builder: (ctx) => Popup(
                                            title: localizations.translate(
                                              i18.deliverIntervention
                                                  .dialogTitle,
                                            ),
                                            description:
                                                localizations.translate(
                                              i18.deliverIntervention
                                                  .dialogContent,
                                            ),
                                            actions: [
                                              DigitButton(
                                                  label:
                                                      localizations.translate(
                                                    i18.common.coreCommonSubmit,
                                                  ),
                                                  onPressed: () {
                                                    clickedStatus.value = true;
                                                    Navigator.of(
                                                      context,
                                                      rootNavigator: true,
                                                    ).pop(true);
                                                  },
                                                  type: DigitButtonType.primary,
                                                  size: DigitButtonSize.large),
                                              DigitButton(
                                                  label:
                                                      localizations.translate(
                                                    i18.common.coreCommonCancel,
                                                  ),
                                                  onPressed: () => Navigator.of(
                                                        context,
                                                        rootNavigator: true,
                                                      ).pop(false),
                                                  type:
                                                      DigitButtonType.secondary,
                                                  size: DigitButtonSize.large)
                                            ],
                                          ),
                                        );

                                        if (submit ?? false) {
                                          final userId =
                                              RegistrationDeliverySingleton()
                                                  .loggedInUserUuid;
                                          final projectId =
                                              RegistrationDeliverySingleton()
                                                  .projectId;
                                          form.markAllAsTouched();
                                          if (!form.valid) return;
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();

                                          isEditIndividual = false;
                                          isAddIndividual = false;
                                          state.maybeWhen(
                                            orElse: () {
                                              return;
                                            },
                                            create: (
                                              addressModel,
                                              householdModel,
                                              individualModel,
                                              projectBeneficiaryModel,
                                              registrationDate,
                                              searchQuery,
                                              loading,
                                              isHeadOfHousehold,
                                            ) async {
                                              isCreate = true;

                                              final individual =
                                                  _getIndividualModel(
                                                context,
                                                form: form,
                                                oldIndividual: null,
                                                generatedUniqueId:
                                                    generatedUniqueId,
                                              );

                                              final boundary =
                                                  RegistrationDeliverySingleton()
                                                      .boundary;

                                              bloc.add(
                                                BeneficiaryRegistrationSaveIndividualDetailsEvent(
                                                  model: individual,
                                                  isHeadOfHousehold:
                                                      widget.isHeadOfHousehold,
                                                ),
                                              );
                                              final scannerBloc = context
                                                  .read<DigitScannerBloc>();
                                              scannerBloc.add(
                                                const DigitScannerEvent
                                                    .handleScanner(),
                                              );

                                              if (scannerBloc.state.duplicate) {
                                                Toast.showToast(context,
                                                    message:
                                                        localizations.translate(
                                                      i18.deliverIntervention
                                                          .resourceAlreadyScanned,
                                                    ),
                                                    type: ToastType.error);
                                              } else {
                                                clickedStatus.value = true;
                                                final scannerBloc = context
                                                    .read<DigitScannerBloc>();
                                                scannerBloc.add(
                                                  const DigitScannerEvent
                                                      .handleScanner(),
                                                );
                                                bloc.add(
                                                  BeneficiaryRegistrationSummaryEvent(
                                                    projectId: projectId!,
                                                    userUuid: userId!,
                                                    boundary: boundary!,
                                                    tag: scannerBloc.state
                                                            .qrCodes.isNotEmpty
                                                        ? scannerBloc
                                                            .state.qrCodes.first
                                                        : null,
                                                  ),
                                                );
                                                onSubmit(
                                                  isCreate,
                                                  isAddIndividual,
                                                );
                                              }
                                            },
                                            editIndividual: (
                                              householdModel,
                                              individualModel,
                                              addressModel,
                                              projectBeneficiaryModel,
                                              loading,
                                            ) async {
                                              isEditIndividual = true;
                                              final scannerBloc = context
                                                  .read<DigitScannerBloc>();
                                              scannerBloc.add(
                                                const DigitScannerEvent
                                                    .handleScanner(),
                                              );
                                              final individual =
                                                  _getIndividualModel(
                                                context,
                                                form: form,
                                                oldIndividual: individualModel,
                                                generatedUniqueId:
                                                    generatedUniqueId,
                                              );
                                              final tag = scannerBloc
                                                      .state.qrCodes.isNotEmpty
                                                  ? scannerBloc
                                                      .state.qrCodes.first
                                                  : null;

                                              if (tag != null &&
                                                  tag !=
                                                      projectBeneficiaryModel
                                                          ?.tag &&
                                                  scannerBloc.state.duplicate) {
                                                Toast.showToast(context,
                                                    message:
                                                        localizations.translate(
                                                      i18.deliverIntervention
                                                          .resourceAlreadyScanned,
                                                    ),
                                                    type: ToastType.error);
                                              } else {
                                                bloc.add(
                                                  BeneficiaryRegistrationUpdateIndividualDetailsEvent(
                                                    addressModel: addressModel,
                                                    householdModel:
                                                        householdModel,
                                                    model: individual.copyWith(
                                                      clientAuditDetails: (individual
                                                                      .clientAuditDetails
                                                                      ?.createdBy !=
                                                                  null &&
                                                              individual
                                                                      .clientAuditDetails
                                                                      ?.createdTime !=
                                                                  null)
                                                          ? ClientAuditDetails(
                                                              createdBy: individual
                                                                  .clientAuditDetails!
                                                                  .createdBy,
                                                              createdTime: individual
                                                                  .clientAuditDetails!
                                                                  .createdTime,
                                                              lastModifiedBy:
                                                                  RegistrationDeliverySingleton()
                                                                      .loggedInUserUuid,
                                                              lastModifiedTime:
                                                                  ContextUtilityExtensions(
                                                                          context)
                                                                      .millisecondsSinceEpoch(),
                                                            )
                                                          : null,
                                                    ),
                                                    tag: scannerBloc.state
                                                            .qrCodes.isNotEmpty
                                                        ? scannerBloc
                                                            .state.qrCodes.first
                                                        : null,
                                                  ),
                                                );
                                                onSubmit(
                                                  false,
                                                  isAddIndividual,
                                                );
                                                context.router.maybePop();
                                              }
                                            },
                                            addMember: (
                                              addressModel,
                                              householdModel,
                                              loading,
                                            ) async {
                                              isAddIndividual = true;
                                              final individual =
                                                  _getIndividualModel(
                                                context,
                                                form: form,
                                                generatedUniqueId:
                                                    generatedUniqueId,
                                              );

                                              if (context.mounted) {
                                                final scannerBloc = context
                                                    .read<DigitScannerBloc>();
                                                scannerBloc.add(
                                                  const DigitScannerEvent
                                                      .handleScanner(),
                                                );
                                                if (scannerBloc
                                                    .state.duplicate) {
                                                  Toast.showToast(
                                                    context,
                                                    message:
                                                        localizations.translate(
                                                      i18.deliverIntervention
                                                          .resourceAlreadyScanned,
                                                    ),
                                                    type: ToastType.error,
                                                  );
                                                } else {
                                                  individualCaptured =
                                                      individual;
                                                  bloc.add(
                                                    BeneficiaryRegistrationAddMemberEvent(
                                                      beneficiaryType:
                                                          RegistrationDeliverySingleton()
                                                              .beneficiaryType!,
                                                      householdModel:
                                                          householdModel,
                                                      individualModel:
                                                          individual,
                                                      addressModel:
                                                          addressModel,
                                                      userUuid:
                                                          RegistrationDeliverySingleton()
                                                              .loggedInUserUuid!,
                                                      projectId:
                                                          RegistrationDeliverySingleton()
                                                              .projectId!,
                                                      tag: scannerBloc
                                                              .state
                                                              .qrCodes
                                                              .isNotEmpty
                                                          ? scannerBloc.state
                                                              .qrCodes.first
                                                          : null,
                                                    ),
                                                  );
                                                  onSubmit(
                                                    false,
                                                    isAddIndividual,
                                                  );
                                                }
                                              }
                                            },
                                          );
                                        }
                                      },
                                    );
                                  },
                                ),
                              ]),
                          slivers: [
                            SliverToBoxAdapter(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  if (RegistrationDeliverySingleton()
                                      .idTypeOptions!
                                      .contains(IdentifierTypes
                                          .uniqueBeneficiaryID
                                          .toValue()))
                                    displayUniqueIdCount(theme, form),
                                  DigitCard(
                                      margin: const EdgeInsets.all(spacer2),
                                      children: [
                                        Text(
                                          localizations.translate(
                                            widget.isHeadOfHousehold
                                                ? i18_local.individualDetails
                                                    .individualsDetailsHeadingLabelText
                                                : i18_local.individualDetails
                                                    .individualsRegistrationHeadingLabelText,
                                          ),
                                          style: textTheme.headingXl.copyWith(
                                            color:
                                                theme.colorTheme.text.primary,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            individualDetailsShowcaseData
                                                .nameOfIndividual
                                                .buildWith(
                                              child: ReactiveWrapperField(
                                                formControlName:
                                                    _individualNameKey,
                                                validationMessages: {
                                                  'required': (object) =>
                                                      localizations.translate(
                                                        '${i18.individualDetails.nameLabelText}_IS_REQUIRED',
                                                      ),
                                                  'mobileNumber': (object) =>
                                                      localizations.translate(
                                                          i18_local
                                                              .individualDetails
                                                              .mobileNumberLengthValidationMessage),
                                                  'maxLength': (object) =>
                                                      localizations
                                                          .translate(i18.common
                                                              .maxCharsRequired)
                                                          .replaceAll(
                                                              '{}',
                                                              maxLength
                                                                  .toString()),
                                                },
                                                builder: (field) =>
                                                    LabeledField(
                                                  label:
                                                      localizations.translate(
                                                    i18.individualDetails
                                                        .nameLabelText,
                                                  ),
                                                  isRequired: true,
                                                  child: DigitTextFormInput(
                                                    initialValue: form
                                                        .control(
                                                            _individualNameKey)
                                                        .value,
                                                    onChange: (value) {
                                                      form
                                                          .control(
                                                              _individualNameKey)
                                                          .value = value;
                                                    },
                                                    errorMessage:
                                                        field.errorText,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            if (widget.isHeadOfHousehold)
                                              const SizedBox(
                                                height: spacer2,
                                              ),
                                            Offstage(
                                              offstage:
                                                  !widget.isHeadOfHousehold,
                                              child: DigitCheckbox(
                                                capitalizeFirstLetter: false,
                                                label: (RegistrationDeliverySingleton()
                                                            .householdType ==
                                                        HouseholdType.community)
                                                    ? localizations.translate(i18
                                                        .individualDetails
                                                        .clfCheckboxLabelText)
                                                    : localizations.translate(
                                                        i18.individualDetails
                                                            .checkboxLabelText,
                                                      ),
                                                value: widget.isHeadOfHousehold,
                                                readOnly:
                                                    widget.isHeadOfHousehold,
                                                checkboxThemeData:
                                                    DigitCheckboxThemeData(
                                                        disabledIconColor: theme
                                                            .colorTheme
                                                            .primary
                                                            .primary1),
                                                onChanged: (_) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                        individualDetailsShowcaseData
                                            .dateOfBirth
                                            .buildWith(
                                          child: CustomDigitDobPicker(
                                            datePickerFormControl: _dobKey,
                                            datePickerLabel:
                                                localizations.translate(
                                              i18.individualDetails
                                                  .dobLabelText,
                                            ),
                                            ageFieldLabel:
                                                localizations.translate(
                                              i18.individualDetails
                                                  .ageLabelText,
                                            ),
                                            yearsHintLabel:
                                                localizations.translate(
                                              i18.individualDetails
                                                  .yearsHintText,
                                            ),
                                            separatorLabel:
                                                localizations.translate(
                                              i18.individualDetails
                                                  .separatorLabelText,
                                            ),
                                            yearsAndMonthsErrMsg:
                                                localizations.translate(
                                              i18.individualDetails
                                                  .yearsAndMonthsErrorText,
                                            ),
                                            initialDate: before150Years,
                                            onChangeOfFormControl:
                                                (formControl) {
                                              // Handle changes to the control's value here
                                              DateTime? value =
                                                  formControl.value;
                                              if (value == null) return;
                                              digits.DigitDOBAge age =
                                                  digits.DigitDateUtils
                                                      .calculateAge(value);
                                              if ((age.years == 0 &&
                                                      age.months == 0) ||
                                                  age.months > 11 ||
                                                  (age.years >= 150 &&
                                                      age.months >= 0)) {
                                                formControl
                                                    .setErrors({'': true});
                                              } else {
                                                formControl.removeError('');
                                              }
                                            },
                                            cancelText: localizations.translate(
                                                i18.common.coreCommonCancel),
                                            confirmText:
                                                localizations.translate(
                                                    i18.common.coreCommonOk),
                                            monthsHintLabel: 'Month',
                                          ),
                                        ),
                                        dropdown.DigitDropdown<String>(
                                          label: localizations.translate(
                                            i18.individualDetails
                                                .genderLabelText,
                                          ),
                                          valueMapper: (value) =>
                                              localizations.translate(value),
                                          initialValue:
                                              form.control(_genderKey).value,
                                          menuItems:
                                              RegistrationDeliverySingleton()
                                                  .genderOptions!
                                                  .map((e) => e)
                                                  .toList(),
                                          formControlName: _genderKey,
                                          isRequired: true,
                                          validationMessages: {
                                            'required': (_) =>
                                                localizations.translate(
                                                  i18.common.corecommonRequired,
                                                ),
                                          },
                                          onChanged: (value) {
                                            if (value != null &&
                                                value.isNotEmpty) {
                                              form.control(_genderKey).value =
                                                  value;
                                            } else {
                                              form.control(_genderKey).value =
                                                  null;
                                              form
                                                  .control(_genderKey)
                                                  .setErrors({'': true});
                                            }
                                          },
                                        ),
                                        individualDetailsShowcaseData.mobile
                                            .buildWith(
                                          child: Offstage(
                                            offstage: !widget.isHeadOfHousehold,
                                            child: ReactiveWrapperField(
                                              formControlName: _mobileNumberKey,
                                              validationMessages: {
                                                'minLength': (object) =>
                                                    localizations.translate(
                                                        i18_local
                                                            .individualDetails
                                                            .mobileNumberLengthValidationMessage),
                                                'maxLength': (object) =>
                                                    localizations
                                                        .translate(i18_local
                                                            .individualDetails
                                                            .mobileNumberLengthValidationMessage)
                                                        .replaceAll('{}', '11'),
                                              },
                                              builder: (field) => LabeledField(
                                                label: localizations.translate(
                                                  i18.individualDetails
                                                      .mobileNumberLabelText,
                                                ),
                                                isRequired: false,
                                                child: DigitTextFormInput(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  maxLength: 11,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                  initialValue: form
                                                      .control(_mobileNumberKey)
                                                      .value,
                                                  onChange: (value) {
                                                    form
                                                        .control(
                                                            _mobileNumberKey)
                                                        .value = value;
                                                  },
                                                  errorMessage: field.errorText,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ])),
                          ],
                        );
                      },
                    );
                  },
                ),
              )),
    );
  }

  bool verifyIfChildAgeValid(BuildContext context, IndividualModel individual) {
    if (individual.dateOfBirth == null) {
      return false;
    }

    final dob = digits.DigitDateUtils.getFormattedDateToDateTime(
        individual.dateOfBirth ?? "");

    final individualAge = digits.DigitDateUtils.calculateAge(
      dob!,
    );

    final ageInMonths = digits.DigitDateUtils.getAgeMonths(individualAge);
    // set default from constants if config has null
    final validMinAge =
        context.selectedProject.additionalDetails?.projectType?.validMinAge ??
            local_constants.Constants.validMinAge;
    final validMaxAge =
        context.selectedProject.additionalDetails?.projectType?.validMaxAge ??
            local_constants.Constants.validMaxAge;

    return validMinAge <= ageInMonths && ageInMonths <= validMaxAge;
  }

  IndividualModel _getIndividualModel(
    BuildContext context, {
    required FormGroup form,
    IndividualModel? oldIndividual,
    String? generatedUniqueId,
  }) {
    final dob = form.control(_dobKey).value as DateTime?;
    String? dobString;
    if (dob != null) {
      dobString = DateFormat(Constants().dateFormat).format(dob);
    }

    var individual = oldIndividual;
    individual ??= IndividualModel(
      clientReferenceId: IdGen.i.identifier,
      tenantId: RegistrationDeliverySingleton().tenantId,
      rowVersion: 1,
      auditDetails: AuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: ContextUtilityExtensions(context).millisecondsSinceEpoch(),
        lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
        lastModifiedTime:
            ContextUtilityExtensions(context).millisecondsSinceEpoch(),
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: ContextUtilityExtensions(context).millisecondsSinceEpoch(),
        lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
        lastModifiedTime:
            ContextUtilityExtensions(context).millisecondsSinceEpoch(),
      ),
    );

    var name = individual.name;
    name ??= NameModel(
      individualClientReferenceId: individual.clientReferenceId,
      tenantId: RegistrationDeliverySingleton().tenantId,
      rowVersion: 1,
      auditDetails: AuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: ContextUtilityExtensions(context).millisecondsSinceEpoch(),
        lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
        lastModifiedTime:
            ContextUtilityExtensions(context).millisecondsSinceEpoch(),
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: ContextUtilityExtensions(context).millisecondsSinceEpoch(),
        lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
        lastModifiedTime:
            ContextUtilityExtensions(context).millisecondsSinceEpoch(),
      ),
    );

    var identifier = (individual.identifiers?.isNotEmpty ?? false)
        ? individual.identifiers!.first
        : null;

    identifier ??= IdentifierModel(
      clientReferenceId: IdGen.i.identifier,
      tenantId: RegistrationDeliverySingleton().tenantId,
      individualClientReferenceId: individual.clientReferenceId,
      rowVersion: 1,
      auditDetails: AuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: ContextUtilityExtensions(context).millisecondsSinceEpoch(),
        lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
        lastModifiedTime:
            ContextUtilityExtensions(context).millisecondsSinceEpoch(),
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: ContextUtilityExtensions(context).millisecondsSinceEpoch(),
        lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
        lastModifiedTime:
            ContextUtilityExtensions(context).millisecondsSinceEpoch(),
      ),
    );

    List<IdentifierModel>? identifiers = individual.identifiers;
    if (isEditIndividual == false) {
      identifiers?.add(IdentifierModel(
        clientReferenceId: individual.clientReferenceId,
        identifierId: generatedUniqueId,
        identifierType: IdentifierTypes.uniqueBeneficiaryID.toValue(),
        clientAuditDetails: individual.clientAuditDetails,
        auditDetails: individual.auditDetails,
      ));
    }

    String? individualName = form.control(_individualNameKey).value as String?;
    individual = individual.copyWith(
      name: name.copyWith(
        givenName: individualName?.trim(),
      ),
      gender: form.control(_genderKey).value == null
          ? null
          : Gender.values
              .byName(form.control(_genderKey).value.toString().toLowerCase()),
      mobileNumber: form.control(_mobileNumberKey).value,
      dateOfBirth: dobString,
      identifiers: isEditIndividual && identifier.identifierId != null
          ? identifiers
          : [
              identifier.copyWith(
                identifierId: generatedUniqueId,
                identifierType: IdentifierTypes.uniqueBeneficiaryID.toValue(),
              ),
            ],
    );
    //Info add uniqueBeneficiaryId as identifier in individualModel
    individual =
        setUniqueIdAsIdentifier(individual, context, generatedUniqueId);

    return individual;
  }

  IndividualModel setUniqueIdAsIdentifier(IndividualModel individual,
      BuildContext context, String? generatedUniqueId) {
    final updatedIdentifiers = individual?.identifiers;
    final uniqueId = generatedUniqueId;

    if (updatedIdentifiers != null &&
        updatedIdentifiers.isNotEmpty &&
        uniqueId!.isNotEmpty) {
      final uniqueIdIdentifierPresent = updatedIdentifiers.any((identifier) =>
          identifier.identifierType ==
          IdentifierTypes.uniqueBeneficiaryID.toValue());

      if (!uniqueIdIdentifierPresent) {
        updatedIdentifiers.add(IdentifierModel(
          clientReferenceId: individual.clientReferenceId,
          tenantId: RegistrationDeliverySingleton().tenantId,
          rowVersion: 1,
          auditDetails: AuditDetails(
            createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
            createdTime:
                ContextUtilityExtensions(context).millisecondsSinceEpoch(),
            lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
            lastModifiedTime:
                ContextUtilityExtensions(context).millisecondsSinceEpoch(),
          ),
          clientAuditDetails: ClientAuditDetails(
            createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
            createdTime:
                ContextUtilityExtensions(context).millisecondsSinceEpoch(),
            lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
            lastModifiedTime:
                ContextUtilityExtensions(context).millisecondsSinceEpoch(),
          ),
          identifierId: uniqueId,
          identifierType: IdentifierTypes.uniqueBeneficiaryID.toValue(),
        ));
        individual = individual.copyWith(identifiers: updatedIdentifiers);
      }
    } else if (updatedIdentifiers == null && uniqueId!.isNotEmpty) {
      individual = individual.copyWith(identifiers: [
        IdentifierModel(
          clientReferenceId: individual.clientReferenceId,
          tenantId: RegistrationDeliverySingleton().tenantId,
          rowVersion: 1,
          auditDetails: AuditDetails(
            createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
            createdTime:
                ContextUtilityExtensions(context).millisecondsSinceEpoch(),
            lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
            lastModifiedTime:
                ContextUtilityExtensions(context).millisecondsSinceEpoch(),
          ),
          clientAuditDetails: ClientAuditDetails(
            createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
            createdTime:
                ContextUtilityExtensions(context).millisecondsSinceEpoch(),
            lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
            lastModifiedTime:
                ContextUtilityExtensions(context).millisecondsSinceEpoch(),
          ),
          identifierId: uniqueId,
          identifierType: IdentifierTypes.uniqueBeneficiaryID.toValue(),
        ),
      ]);
    }
    return individual;
  }

  FormGroup buildForm(BeneficiaryRegistrationState state) {
    final individual = state.mapOrNull<IndividualModel>(
      editIndividual: (value) {
        if (value.projectBeneficiaryModel?.tag != null) {
          context.read<DigitScannerBloc>().add(DigitScannerScanEvent(
              barCode: [], qrCode: [value.projectBeneficiaryModel!.tag!]));
        }

        return value.individualModel;
      },
      create: (value) {
        return value.individualModel;
      },
      summary: (value) {
        return value.individualModel;
      },
    );

    final searchQuery = state.mapOrNull<String>(
      create: (value) {
        return value.searchQuery;
      },
    );

    return fb.group(<String, Object>{
      _individualNameKey: FormControl<String>(
        validators: [
          Validators.required,
          Validators.delegate(
              (validator) => CustomValidator.requiredMin(validator)),
          Validators.maxLength(200),
          Validators.delegate((validator) =>
              local_utils.CustomValidator.onlyAlphabets(validator)),
        ],
        value: individual?.name?.givenName ??
            ((RegistrationDeliverySingleton().householdType ==
                    HouseholdType.community)
                ? null
                : searchQuery?.trim()),
      ),
      _dobKey: FormControl<DateTime>(
        value: individual?.dateOfBirth != null
            ? DateFormat(Constants().dateFormat).parse(
                individual!.dateOfBirth!,
              )
            : null,
      ),
      _genderKey: FormControl<String>(
          value: getGenderOptions(individual),
          validators: [Validators.required]),
      _mobileNumberKey:
          FormControl<String>(value: individual?.mobileNumber, validators: [
        Validators.delegate((validator) =>
            local_utils.CustomValidator.validMobileNumber(validator)),
        Validators.minLength(11),
        Validators.maxLength(11),
      ]),
    });
  }

  String? getGenderOptions(IndividualModel? individual) {
    final options = RegistrationDeliverySingleton().genderOptions;

    return options?.map((e) => e).firstWhereOrNull(
          (element) => element.toLowerCase() == individual?.gender?.name,
        );
  }

  getInitialDateValue(FormGroup form) {
    var date = form.control(_dobKey).value != null
        ? DateFormat(Constants().dateTimeExtFormat)
            .format(form.control(_dobKey).value)
        : null;

    return date;
  }

  void fetchUniqueBeneficiaryId() async {
    context.read<UniqueIdBloc>().add(const UniqueIdEvent.fetchIdCount());
  }

  displayUniqueIdCount(ThemeData theme, FormGroup form) {
    int? idCount;
    return BlocListener<UniqueIdBloc, UniqueIdState>(
      listener: (context, state) {
        state.maybeWhen(
            orElse: () {},
            idCount: (availableIdCount, totalCount) {
              idCount = availableIdCount;
              if (availableIdCount != 0 &&
                  availableIdCount <
                      RegistrationDeliverySingleton().beneficiaryIdMinCount!) {
                showLowIdsAlert(
                    context: context,
                    localizations: localizations,
                    availableCount: availableIdCount,
                    shouldProceedFurther: (bool proceed) {});
              } else if (availableIdCount <= 0) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showNoIdsAlert(
                      context: context,
                      showSkip: false,
                      localizations: localizations,
                      shouldProceedFurther: (bool skip) {});
                });
              }
            },
            ids: (ids) {
              _isProgressDialogVisible = false;
            },
            aUniqueId: (uniqueId) {},
            fetching: (currentCount, totalCount) {
              if (_isProgressDialogVisible == false) {
                _progressDialog.showProgressDialog(
                  context: context,
                  localizations: RegistrationDeliveryLocalization.of(context),
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
                            label: localizations.translate(
                                i18.beneficiaryDetails.beneficiaryIdsReFetch),
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
                        title: localizations.translate(
                            i18.beneficiaryDetails.beneficiaryIdsLimitError),
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
                      description: localizations.translate(
                          i18.beneficiaryDetails.noInternetBeneficiaryIdsText),
                    );
                  });
            });
      },
      child: BlocBuilder<UniqueIdBloc, UniqueIdState>(
        builder: (context, state) {
          if (state is! LoadingState && state is FetchedIdCountState ||
              idCount != null) {
            state.maybeWhen(
              orElse: () {},
              idCount: (availableIdCount, totalCount) {
                idCount = availableIdCount;
              },
            );
          }
          return idCount != null
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: theme.colorTheme.text.disabled,
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(spacer2)),
                    color: theme.colorTheme.primary.primaryBg,
                  ),
                  margin: const EdgeInsets.only(left: spacer2),
                  padding: const EdgeInsets.all(spacer2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        localizations.translate(
                            i18.beneficiaryDetails.availableBeneficiaryIdsText),
                        style: theme
                            .digitTextTheme(context)
                            .bodyXS
                            .copyWith(color: theme.colorTheme.text.primary),
                      ),
                      Text(
                        " $idCount",
                        style: theme.digitTextTheme(context).headingXS.copyWith(
                            color: idCount! <
                                    RegistrationDeliverySingleton()
                                        .beneficiaryIdMinCount!
                                ? theme.colorTheme.alert.error
                                : theme.colorTheme.primary.primary2),
                      ),
                    ],
                  ),
                )
              : const Offstage();
        },
      ),
    );
  }

  void getIdNumberIfExists(BeneficiaryRegistrationState state, FormGroup form) {
    final individual = state.mapOrNull<IndividualModel>(
      editIndividual: (value) {
        if (value.projectBeneficiaryModel?.tag != null) {
          context.read<DigitScannerBloc>().add(DigitScannerScanEvent(
              barCode: [], qrCode: [value.projectBeneficiaryModel!.tag!]));
        }

        return value.individualModel;
      },
      create: (value) {
        return value.individualModel;
      },
      summary: (value) {
        return value.individualModel;
      },
    );
    if (individual != null) {
      var existingId = individual.identifiers?.lastWhereOrNull((id) =>
          id.identifierType == IdentifierTypes.uniqueBeneficiaryID.toValue());

      if (existingId != null) {}
    }
  }
}
