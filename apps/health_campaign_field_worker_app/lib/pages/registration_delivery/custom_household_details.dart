import 'package:auto_route/auto_route.dart';
import 'package:digit_components/widgets/atoms/digit_integer_form_picker.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/atoms/text_block.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_campaign_field_worker_app/widgets/custom_back_navigation.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/blocs/household_overview/household_overview.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart';
import 'package:registration_delivery/models/entities/additional_fields_type.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';

import 'package:registration_delivery/models/entities/household.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:registration_delivery/utils/constants.dart';
import 'package:registration_delivery/utils/i18_key_constants.dart' as i18;
import 'package:registration_delivery/utils/utils.dart';
import '../../utils/i18_key_constants.dart' as i18_local;
import 'package:registration_delivery/widgets/back_navigation_help_header.dart';
import 'package:registration_delivery/widgets/localized.dart';
import 'package:registration_delivery/widgets/showcase/config/showcase_constants.dart';
import 'package:registration_delivery/widgets/showcase/showcase_button.dart';

import '../../blocs/registration_delivery/custom_beneficairy_registration.dart';
import '../../router/app_router.dart';
import '../../utils/registration_delivery/registration_delivery_utils.dart';
import 'custom_beneficiary_acknowledgement.dart';
import '../../utils/constants.dart' as local_constants;

@RoutePage()
class CustomHouseHoldDetailsPage extends LocalizedStatefulWidget {
  final bool? isConsent;
  const CustomHouseHoldDetailsPage({
    super.key,
    super.appLocalizations,
    this.isConsent,
  });

  @override
  State<CustomHouseHoldDetailsPage> createState() =>
      CustomHouseHoldDetailsPageState();
}

class CustomHouseHoldDetailsPageState
    extends LocalizedState<CustomHouseHoldDetailsPage> {
  static const _dateOfRegistrationKey = 'dateOfRegistration';
  static const _memberCountKey = 'memberCount';
  static const _childrenAbsentCountKey = 'childrenAbsentCount';
  static const _childrenCountKey = 'childrenCount';
  static const _childrenAFPCountKey = 'childrenAFPCount';
  static const _guineaWormDiseaseCountKey = 'guineaWormDiseaseCount';
  bool isNoConsent = false;

  // Define controllers
  final TextEditingController _pregnantWomenController =
      TextEditingController();
  final TextEditingController _childrenController = TextEditingController();
  final TextEditingController _memberController = TextEditingController();

  submitWithNoChildren(HouseholdModel? householdModel,
      AddressModel? addressModel, childCount) async {
    final submit = await showDialog(
      context: context,
      builder: (ctx) => Popup(
        title: localizations.translate(
          i18.deliverIntervention.dialogTitle,
        ),
        description: localizations.translate(
          i18.deliverIntervention.dialogContent,
        ),
        actions: [
          DigitButton(
              label: localizations.translate(
                i18.common.coreCommonSubmit,
              ),
              onPressed: () {
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pop(true);
              },
              type: DigitButtonType.primary,
              size: DigitButtonSize.large),
          DigitButton(
              label: localizations.translate(
                i18.common.coreCommonCancel,
              ),
              onPressed: () => Navigator.of(
                    context,
                    rootNavigator: true,
                  ).pop(false),
              type: DigitButtonType.secondary,
              size: DigitButtonSize.large)
        ],
      ),
    );
    if (submit == true) {
      final bloc = context.read<CustomBeneficiaryRegistrationBloc>();
      final router = context.router;
      var household = householdModel;

      household ??= HouseholdModel(
        tenantId: RegistrationDeliverySingleton().tenantId,
        clientReferenceId:
            householdModel?.clientReferenceId ?? IdGen.i.identifier,
        rowVersion: 1,
        clientAuditDetails: ClientAuditDetails(
          createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
          createdTime: context.millisecondsSinceEpoch(),
          lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
          lastModifiedTime: context.millisecondsSinceEpoch(),
        ),
        auditDetails: AuditDetails(
          createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
          createdTime: context.millisecondsSinceEpoch(),
          lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
          lastModifiedTime: context.millisecondsSinceEpoch(),
        ),
      );

      household = household.copyWith(
          rowVersion: 1,
          tenantId: RegistrationDeliverySingleton().tenantId,
          clientReferenceId:
              householdModel?.clientReferenceId ?? IdGen.i.identifier,
          memberCount: 1,
          clientAuditDetails: ClientAuditDetails(
            createdBy:
                RegistrationDeliverySingleton().loggedInUserUuid.toString(),
            createdTime: context.millisecondsSinceEpoch(),
            lastModifiedBy:
                RegistrationDeliverySingleton().loggedInUserUuid.toString(),
            lastModifiedTime: context.millisecondsSinceEpoch(),
          ),
          auditDetails: AuditDetails(
            createdBy:
                RegistrationDeliverySingleton().loggedInUserUuid.toString(),
            createdTime: context.millisecondsSinceEpoch(),
            lastModifiedBy:
                RegistrationDeliverySingleton().loggedInUserUuid.toString(),
            lastModifiedTime: context.millisecondsSinceEpoch(),
          ),
          address: addressModel,
          additionalFields: HouseholdAdditionalFields(version: 1, fields: [
            const AdditionalField(
              "caregiver_consent_registration",
              true,
            ),
            AdditionalField(
              "child_count",
              childCount.toString(),
            ),
          ]));

      bloc.add(
        BeneficiaryRegistrationCreateHouseholdEvent(
          household: household,
          registrationDate: DateTime.now(),
          boundary: RegistrationDeliverySingleton().boundary!,
        ),
      );
      router.popUntil(
          (route) => route.settings.name == SearchBeneficiaryRoute.name);
      context.router.push(CustomBeneficiaryAcknowledgementRoute(
          enableViewHousehold: true,
          acknowledgementType: AcknowledgementType.addHousehold));
    }
  }

  @override
  void dispose() {
    _pregnantWomenController.dispose();
    _childrenController.dispose();
    _memberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<CustomBeneficiaryRegistrationBloc>();
    final router = context.router;
    final textTheme = theme.digitTextTheme(context);
    final bool isCommunity = RegistrationDeliverySingleton().householdType ==
        HouseholdType.community;

    Future<String> generateHouseholdId() async {
      final userId = RegistrationDeliverySingleton().loggedInUserUuid;

      final boundaryBloc = context.read<BoundaryBloc>().state;
      final code = boundaryBloc.boundaryList.first.code;
      final bname = boundaryBloc.boundaryList.first.name;

      final locality = (code == null || bname == null)
          ? null
          : LocalityModel(code: code, name: bname);

      final localityCode = locality!.code;

      final ids = await UniqueIdGeneration().generateUniqueId(
        localityCode: localityCode,
        loggedInUserId: userId!,
        returnCombinedIds: false,
      );

      return ids.first;
    }

    return Scaffold(
      body: ReactiveFormBuilder(
        form: () => buildForm(bloc.state),
        builder: (context, form, child) {
          if (isCommunity) {
            _memberController.text =
                form.control(_memberCountKey).value.toString();
          }
          int children = form.control(_childrenCountKey).value as int;
          return BlocConsumer<CustomBeneficiaryRegistrationBloc,
              BeneficiaryRegistrationState>(
            listener: (context, state) {
              if (state is BeneficiaryRegistrationPersistedState &&
                  state.isEdit) {
                final overviewBloc = context.read<HouseholdOverviewBloc>();

                overviewBloc.add(
                  HouseholdOverviewReloadEvent(
                    projectId:
                        RegistrationDeliverySingleton().projectId.toString(),
                    projectBeneficiaryType:
                        RegistrationDeliverySingleton().beneficiaryType ??
                            BeneficiaryType.household,
                  ),
                );
                HouseholdMemberWrapper memberWrapper =
                    overviewBloc.state.householdMemberWrapper;
                final route = router.parent() as StackRouter;
                route.popUntilRouteWithName(SearchBeneficiaryRoute.name);
                route.push(BeneficiaryWrapperRoute(wrapper: memberWrapper));
              }
            },
            builder: (context, registrationState) {
              return ScrollableContent(
                header: const Column(children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: spacer2),
                    child: CustomBackNavigationHelpHeaderWidget(
                      showHelp: false,
                    ),
                  ),
                ]),
                enableFixedDigitButton: true,
                footer: DigitCard(
                    margin: const EdgeInsets.only(top: spacer2),
                    children: [
                      DigitButton(
                        label: registrationState.mapOrNull(
                              editHousehold: (value) => localizations
                                  .translate(i18.common.coreCommonSave),
                            ) ??
                            localizations
                                .translate(i18.householdDetails.actionLabel),
                        type: DigitButtonType.primary,
                        size: DigitButtonSize.large,
                        mainAxisSize: MainAxisSize.max,
                        onPressed: () async {
                          form.markAllAsTouched();
                          if (!form.valid) return;

                          final memberCount =
                              form.control(_memberCountKey).value as int;

                          final children =
                              form.control(_childrenCountKey).value as int;
                          final childrenAbsent = form
                              .control(_childrenAbsentCountKey)
                              .value as int;
                          final childrenAFP =
                              form.control(_childrenAFPCountKey).value as int;
                          final guineaWormCount = form
                              .control(_guineaWormDiseaseCountKey)
                              .value as int;

                          final dateOfRegistration = form
                              .control(_dateOfRegistrationKey)
                              .value as DateTime;

                          registrationState.maybeWhen(
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
                              if (children <= 0) {
                                await submitWithNoChildren(
                                    householdModel, addressModel, children);
                                return;
                              }

                              var household = householdModel;

                              household ??= HouseholdModel(
                                tenantId:
                                    RegistrationDeliverySingleton().tenantId,
                                clientReferenceId:
                                    householdModel?.clientReferenceId ??
                                        IdGen.i.identifier,
                                rowVersion: 1,
                                clientAuditDetails: ClientAuditDetails(
                                  createdBy: RegistrationDeliverySingleton()
                                      .loggedInUserUuid!,
                                  createdTime: context.millisecondsSinceEpoch(),
                                  lastModifiedBy:
                                      RegistrationDeliverySingleton()
                                          .loggedInUserUuid,
                                  lastModifiedTime:
                                      context.millisecondsSinceEpoch(),
                                ),
                                auditDetails: AuditDetails(
                                  createdBy: RegistrationDeliverySingleton()
                                      .loggedInUserUuid!,
                                  createdTime: context.millisecondsSinceEpoch(),
                                  lastModifiedBy:
                                      RegistrationDeliverySingleton()
                                          .loggedInUserUuid,
                                  lastModifiedTime:
                                      context.millisecondsSinceEpoch(),
                                ),
                              );

                              household = household.copyWith(
                                  rowVersion: 1,
                                  tenantId:
                                      RegistrationDeliverySingleton().tenantId,
                                  clientReferenceId:
                                      householdModel?.clientReferenceId ??
                                          IdGen.i.identifier,
                                  memberCount: memberCount,
                                  clientAuditDetails: ClientAuditDetails(
                                    createdBy: RegistrationDeliverySingleton()
                                        .loggedInUserUuid
                                        .toString(),
                                    createdTime:
                                        context.millisecondsSinceEpoch(),
                                    lastModifiedBy:
                                        RegistrationDeliverySingleton()
                                            .loggedInUserUuid
                                            .toString(),
                                    lastModifiedTime:
                                        context.millisecondsSinceEpoch(),
                                  ),
                                  auditDetails: AuditDetails(
                                    createdBy: RegistrationDeliverySingleton()
                                        .loggedInUserUuid
                                        .toString(),
                                    createdTime:
                                        context.millisecondsSinceEpoch(),
                                    lastModifiedBy:
                                        RegistrationDeliverySingleton()
                                            .loggedInUserUuid
                                            .toString(),
                                    lastModifiedTime:
                                        context.millisecondsSinceEpoch(),
                                  ),
                                  address: addressModel,
                                  additionalFields: HouseholdAdditionalFields(
                                      version: 1,
                                      fields: [
                                        //[TODO: Use pregnant women form value based on project config
                                        ...?householdModel
                                            ?.additionalFields?.fields
                                            .where((e) =>
                                                e.key !=
                                                    AdditionalFieldsType
                                                        .children
                                                        .toValue() &&
                                                e.key !=
                                                    local_constants.Constants
                                                        .headConsent &&
                                                e.key !=
                                                    local_constants.Constants
                                                        .childrenAFP &&
                                                e.key !=
                                                    local_constants.Constants
                                                        .childrenAbsent &&
                                                e.key !=
                                                    local_constants
                                                        .Constants.guineaWorm),
                                        AdditionalField(
                                          AdditionalFieldsType.children
                                              .toValue(),
                                          children,
                                        ),
                                        AdditionalField(
                                          local_constants.Constants.childrenAFP,
                                          childrenAFP,
                                        ),
                                        AdditionalField(
                                          local_constants
                                              .Constants.childrenAbsent,
                                          childrenAbsent,
                                        ),
                                        AdditionalField(
                                          local_constants.Constants.guineaWorm,
                                          guineaWormCount,
                                        ),
                                        const AdditionalField(
                                          local_constants.Constants.headConsent,
                                          "true",
                                        ),
                                      ]));

                              bloc.add(
                                BeneficiaryRegistrationSaveHouseholdDetailsEvent(
                                  household: household,
                                  registrationDate: dateOfRegistration,
                                ),
                              );
                              context.router.push(
                                CustomIndividualDetailsRoute(
                                    isHeadOfHousehold: true),
                              );
                            },
                            editHousehold: (
                              addressModel,
                              householdModel,
                              individuals,
                              registrationDate,
                              projectBeneficiaryModel,
                              loading,
                              isHeadOfHousehold,
                            ) async {
                              var household = householdModel.copyWith(
                                  memberCount: memberCount,
                                  address: addressModel,
                                  clientAuditDetails: (householdModel
                                                  .clientAuditDetails
                                                  ?.createdBy !=
                                              null &&
                                          householdModel.clientAuditDetails
                                                  ?.createdTime !=
                                              null)
                                      ? ClientAuditDetails(
                                          createdBy: householdModel
                                              .clientAuditDetails!.createdBy,
                                          createdTime: householdModel
                                              .clientAuditDetails!.createdTime,
                                          lastModifiedBy:
                                              RegistrationDeliverySingleton()
                                                  .loggedInUserUuid,
                                          lastModifiedTime: DateTime.now()
                                              .millisecondsSinceEpoch,
                                        )
                                      : null,
                                  rowVersion: householdModel.rowVersion,
                                  additionalFields: HouseholdAdditionalFields(
                                      version: householdModel
                                              .additionalFields?.version ??
                                          1,
                                      fields: [
                                        //[TODO: Use pregnant women form value based on project config
                                        ...?householdModel
                                            .additionalFields?.fields
                                            .where((e) =>
                                                e
                                                        .key !=
                                                    AdditionalFieldsType
                                                        .children
                                                        .toValue() &&
                                                e.key !=
                                                    local_constants.Constants
                                                        .childrenAFP &&
                                                e.key !=
                                                    local_constants.Constants
                                                        .childrenAbsent &&
                                                e.key !=
                                                    local_constants
                                                        .Constants.guineaWorm),

                                        AdditionalField(
                                          AdditionalFieldsType.children
                                              .toValue(),
                                          children,
                                        ),
                                        AdditionalField(
                                          local_constants.Constants.childrenAFP,
                                          childrenAFP,
                                        ),
                                        AdditionalField(
                                          local_constants
                                              .Constants.childrenAbsent,
                                          childrenAbsent,
                                        ),
                                        AdditionalField(
                                          local_constants.Constants.guineaWorm,
                                          guineaWormCount,
                                        ),
                                      ]));

                              bloc.add(
                                BeneficiaryRegistrationUpdateHouseholdDetailsEvent(
                                  household: household.copyWith(
                                    clientAuditDetails: (addressModel
                                                    .clientAuditDetails
                                                    ?.createdBy !=
                                                null &&
                                            addressModel.clientAuditDetails
                                                    ?.createdTime !=
                                                null)
                                        ? ClientAuditDetails(
                                            createdBy: addressModel
                                                .clientAuditDetails!.createdBy,
                                            createdTime: addressModel
                                                .clientAuditDetails!
                                                .createdTime,
                                            lastModifiedBy:
                                                RegistrationDeliverySingleton()
                                                    .loggedInUserUuid,
                                            lastModifiedTime: context
                                                .millisecondsSinceEpoch(),
                                          )
                                        : null,
                                  ),
                                  addressModel: addressModel.copyWith(
                                    clientAuditDetails: (addressModel
                                                    .clientAuditDetails
                                                    ?.createdBy !=
                                                null &&
                                            addressModel.clientAuditDetails
                                                    ?.createdTime !=
                                                null)
                                        ? ClientAuditDetails(
                                            createdBy: addressModel
                                                .clientAuditDetails!.createdBy,
                                            createdTime: addressModel
                                                .clientAuditDetails!
                                                .createdTime,
                                            lastModifiedBy:
                                                RegistrationDeliverySingleton()
                                                    .loggedInUserUuid,
                                            lastModifiedTime: context
                                                .millisecondsSinceEpoch(),
                                          )
                                        : null,
                                  ),
                                ),
                              );
                              await context.router.root.push(
                                CustomBeneficiaryRegistrationWrapperRoute(
                                  initialState:
                                      BeneficiaryRegistrationEditIndividualState(
                                          individualModel: individuals.first,
                                          householdModel: household,
                                          addressModel: addressModel,
                                          projectBeneficiaryModel:
                                              projectBeneficiaryModel),
                                  children: [
                                    CustomIndividualDetailsRoute(
                                      isHeadOfHousehold: true,
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ]),
                slivers: [
                  SliverToBoxAdapter(
                    child: DigitCard(
                        margin: const EdgeInsets.all(spacer2),
                        children: [
                          DigitTextBlock(
                            padding: EdgeInsets.zero,
                            heading: (isCommunity)
                                ? localizations.translate(
                                    i18.householdDetails.clfDetailsLabel,
                                  )
                                : localizations.translate(
                                    i18.householdDetails.householdDetailsLabel,
                                  ),
                            headingStyle: textTheme.headingXl
                                .copyWith(color: theme.colorTheme.text.primary),
                          ),
                          householdDetailsShowcaseData.dateOfRegistration
                              .buildWith(
                            child: ReactiveWrapperField(
                              formControlName: _dateOfRegistrationKey,
                              builder: (field) => LabeledField(
                                label: localizations.translate(
                                  i18.householdDetails.dateOfRegistrationLabel,
                                ),
                                child: AbsorbPointer(
                                  absorbing: true,
                                  child: DigitDateFormInput(
                                    readOnly: false,
                                    confirmText: localizations.translate(
                                      i18.common.coreCommonOk,
                                    ),
                                    cancelText: localizations.translate(
                                      i18.common.coreCommonCancel,
                                    ),
                                    initialValue: DateFormat(
                                            Constants().dateMonthYearFormat)
                                        .format(form
                                            .control(_dateOfRegistrationKey)
                                            .value)
                                        .toString(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          householdDetailsShowcaseData
                              .numberOfChildrenBelow5InHousehold
                              .buildWith(
                            child: DigitIntegerFormPicker(
                              minimum: 1,
                              maximum: 20,
                              form: form,
                              formControlName: _childrenCountKey,
                              onChange: () {
                                final childUnder5 =
                                    form.control(_childrenCountKey).value;

                                final absent =
                                    form.control(_childrenAbsentCountKey).value;
                                if (absent > childUnder5) {
                                  form.control(_childrenAbsentCountKey).value =
                                      childUnder5;
                                }
                              },
                              label: localizations.translate(
                                i18.householdDetails
                                    .noOfChildrenBelow5YearsLabel,
                              ),
                              incrementer: true,
                            ),
                          ),
                          DigitIntegerFormPicker(
                            minimum: 0,
                            maximum: 20,
                            form: form,
                            formControlName: _childrenAbsentCountKey,
                            onChange: () {
                              final absent =
                                  form.control(_childrenAbsentCountKey).value;
                              final childUnder5 =
                                  form.control(_childrenCountKey).value;
                              if (absent > childUnder5) {
                                form.control(_childrenAbsentCountKey).value =
                                    childUnder5;
                              }
                            },
                            label: localizations.translate(
                              i18_local
                                  .householdDetails.noOfChildrenAbsentLabel,
                            ),
                            incrementer: true,
                          ),
                          DigitIntegerFormPicker(
                            minimum: 0,
                            maximum: 20,
                            form: form,
                            formControlName: _childrenAFPCountKey,
                            onChange: () {
                              form.control(_childrenAFPCountKey).value;
                            },
                            label: localizations.translate(
                              i18_local.householdDetails.noOfChildrenAFPLabel,
                            ),
                            incrementer: true,
                          ),
                          DigitIntegerFormPicker(
                            minimum: 0,
                            maximum: 20,
                            form: form,
                            formControlName: _guineaWormDiseaseCountKey,
                            onChange: () {
                              form.control(_guineaWormDiseaseCountKey).value;
                            },
                            label: localizations.translate(
                              i18_local.householdDetails.guineaWormCountLabel,
                            ),
                            incrementer: true,
                          ),
                        ]),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  FormGroup buildForm(BeneficiaryRegistrationState state) {
    final household = state.mapOrNull(editHousehold: (value) {
      return value.householdModel;
    }, create: (value) {
      return value.householdModel;
    });

    final registrationDate = state.mapOrNull(
      editHousehold: (value) {
        return value.registrationDate;
      },
      create: (value) => DateTime.now(),
    );

    return fb.group(<String, Object>{
      _dateOfRegistrationKey:
          FormControl<DateTime>(value: registrationDate, validators: []),
      _childrenCountKey: FormControl<int>(
        value: household?.additionalFields?.fields
                    .where(
                        (h) => h.key == AdditionalFieldsType.children.toValue())
                    .firstOrNull
                    ?.value !=
                null
            ? int.tryParse(household?.additionalFields?.fields
                    .where(
                        (h) => h.key == AdditionalFieldsType.children.toValue())
                    .firstOrNull
                    ?.value
                    .toString() ??
                '0')
            : 0,
        validators: [Validators.max<int>(20), Validators.min<int>(1)],
      ),
      _childrenAbsentCountKey: FormControl<int>(
        value: 0,
        validators: [Validators.max<int>(20)],
      ),
      _childrenAFPCountKey: FormControl<int>(
        value: 0,
        validators: [Validators.max<int>(20)],
      ),
      _guineaWormDiseaseCountKey: FormControl<int>(
        value: 0,
        validators: [Validators.max<int>(20)],
      ),
      _memberCountKey: FormControl<int>(
        value: household?.memberCount ?? 1,
      ),
    });
  }
}
