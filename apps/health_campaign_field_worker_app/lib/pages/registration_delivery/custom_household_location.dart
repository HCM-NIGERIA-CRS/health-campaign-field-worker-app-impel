import 'package:auto_route/auto_route.dart';
import 'package:digit_components/widgets/atoms/digit_reactive_search_dropdown.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/address_type.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/models/RadioButtonModel.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/component_utils.dart';
import 'package:digit_ui_components/widgets/atoms/text_block.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/app_initialization/app_initialization.dart';
import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../widgets/custom_back_navigation.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';

import 'package:registration_delivery/utils/i18_key_constants.dart' as i18;
import '../../utils/i18_key_constants.dart' as i18_local;
import 'package:registration_delivery/utils/utils.dart';

import 'package:registration_delivery/widgets/localized.dart';
import 'package:registration_delivery/widgets/showcase/config/showcase_constants.dart';

import '../../blocs/registration_delivery/custom_beneficairy_registration.dart';

import '../../router/app_router.dart';

import '../../utils/utils.dart' as local_utils;
import 'package:registration_delivery/utils/i18_key_constants.dart'
    as i18_registration_delivery;

import 'package:digit_components/widgets/atoms/digit_dropdown.dart' as dropdown;

import 'caregiver_consent.dart';

@RoutePage()
class CustomHouseholdLocationPage extends LocalizedStatefulWidget {
  const CustomHouseholdLocationPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<CustomHouseholdLocationPage> createState() =>
      CustomHouseholdLocationPageState();
}

class CustomHouseholdLocationPageState
    extends LocalizedState<CustomHouseholdLocationPage> {
  static const _administrationAreaKey = 'administrationArea';
  static const _addressLine1Key = 'addressLine1';
  static const _addressLine2Key = 'addressLine2';
  static const _landmarkKey = 'landmark';
  static const _postalCodeKey = 'postalCode';
  static const _latKey = 'lat';
  static const _lngKey = 'lng';
  static const _accuracyKey = 'accuracy';
  static const maxLength = 64;
  static const _buildingNameKey = 'buildingName';
  static const _householdNumberKey = 'householdNumber';
  static const _consent = 'consent';
  static const _householdHeadNameKey = 'householdHeadName';
  static const _reasonNonComplianceKey = 'reasonNonCompliance';

  bool isConsent = true;

  @override
  void initState() {
    final regState = context.read<CustomBeneficiaryRegistrationBloc>().state;
    context.read<LocationBloc>().add(const LoadLocationEvent());
    regState.maybeMap(
        orElse: () => false,
        editHousehold: (value) => false,
        create: (value) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // Show the dialog after the first frame is built
            DigitComponentsUtils.showDialog(
              context,
              localizations.translate(i18.common.locationCapturing),
              DialogType.inProgress,
            );
          });
          return true;
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    final bloc = context.read<CustomBeneficiaryRegistrationBloc>();
    final router = context.router;
    final bool isCommunity = RegistrationDeliverySingleton().householdType ==
        HouseholdType.community;

    return Scaffold(
      body: BlocBuilder<CustomBeneficiaryRegistrationBloc,
          BeneficiaryRegistrationState>(builder: (context, registrationState) {
        return ReactiveFormBuilder(
          form: () => buildForm(bloc.state),
          builder: (_, form, __) => BlocListener<LocationBloc, LocationState>(
            listener: (context, locationState) {
              registrationState.maybeMap(
                  orElse: () => false,
                  create: (value) {
                    if (locationState.accuracy != null) {
                      //Hide the dialog after 1 seconds
                      Future.delayed(const Duration(seconds: 1), () {
                        DigitComponentsUtils.hideDialog(context);
                      });
                    }
                  });
              if (locationState.accuracy != null) {
                final lat = locationState.latitude;
                final lng = locationState.longitude;
                final accuracy = locationState.accuracy;

                form.control(_latKey).value ??= lat;
                form.control(_lngKey).value ??= lng;
                form.control(_accuracyKey).value ??= accuracy;
              }
            },
            listenWhen: (previous, current) {
              final lat = form.control(_latKey).value;
              final lng = form.control(_lngKey).value;
              final accuracy = form.control(_accuracyKey).value;

              return lat != null || lng != null || accuracy != null
                  ? false
                  : true;
            },
            child: ScrollableContent(
              enableFixedDigitButton: true,
              header: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: spacer2),
                    child: CustomBackNavigationHelpHeaderWidget(
                      showHelp: false,
                    ),
                  ),
                ],
              ),
              footer: DigitCard(
                  margin: const EdgeInsets.only(top: spacer2),
                  children: [
                    BlocBuilder<LocationBloc, LocationState>(
                      builder: (context, locationState) {
                        return DigitButton(
                          label: localizations.translate(
                            i18.householdLocation.actionLabel,
                          ),
                          type: DigitButtonType.primary,
                          size: DigitButtonSize.large,
                          mainAxisSize: MainAxisSize.max,
                          onPressed: () {
                            form.markAllAsTouched();
                            if (!form.valid) return;

                            final addressLine1 =
                                form.control(_addressLine1Key).value as String?;
                            final addressLine2 =
                                form.control(_addressLine2Key).value as String?;
                            final landmark =
                                form.control(_landmarkKey).value as String?;
                            final postalCode =
                                form.control(_postalCodeKey).value as String?;

                            final householdNumberCaptured = form
                                .control(_householdNumberKey)
                                .value as String?;

                            final householdHeadName = form
                                .control(_householdHeadNameKey)
                                .value as String?;

                            final reasonForNonCompliance = form
                                .control(_reasonNonComplianceKey)
                                .value as String?;

                            if (!isConsent &&
                                (reasonForNonCompliance == null ||
                                    (reasonForNonCompliance?.isEmpty ??
                                        true))) {
                              DigitToast.show(context,
                                  options: DigitToastOptions(
                                      localizations.translate(i18_local
                                          .beneficiaryDetails
                                          .reasonForNonComplianceNeeded),
                                      true,
                                      theme));
                              return;
                            }

                            if (!isConsent &&
                                (householdHeadName == null ||
                                    (householdHeadName?.isEmpty ?? true))) {
                              DigitToast.show(context,
                                  options: DigitToastOptions(
                                      localizations.translate(i18_local
                                          .beneficiaryDetails
                                          .houseHeadNameNeeded),
                                      true,
                                      theme));
                              return;
                            }

                            registrationState.maybeWhen(
                              orElse: () {
                                return;
                              },
                              create: (
                                address,
                                householdModel,
                                individualModel,
                                projectBeneficiaryModel,
                                registrationDate,
                                searchQuery,
                                loading,
                                isHeadOfHousehold,
                              ) {
                                if (!isConsent) {
                                  context.router
                                      .push(CustomHouseholdSummaryRoute(
                                    householdNumber: householdNumberCaptured,
                                    headName: householdHeadName,
                                    reasonNonCompliance: reasonForNonCompliance,
                                  ));
                                } else {
                                  var addressModel = AddressModel(
                                    addressLine1: addressLine1 != null &&
                                            addressLine1.trim().isNotEmpty
                                        ? addressLine1
                                        : null,
                                    addressLine2: addressLine2 != null &&
                                            addressLine2.trim().isNotEmpty
                                        ? addressLine2
                                        : null,
                                    landmark: landmark != null &&
                                            landmark.trim().isNotEmpty
                                        ? landmark
                                        : null,
                                    pincode: postalCode != null &&
                                            postalCode.trim().isNotEmpty
                                        ? postalCode
                                        : null,
                                    type: AddressType.correspondence,
                                    latitude: form.control(_latKey).value ??
                                        locationState.latitude,
                                    longitude: form.control(_lngKey).value ??
                                        locationState.longitude,
                                    locationAccuracy:
                                        form.control(_accuracyKey).value ??
                                            locationState.accuracy,
                                    locality: LocalityModel(
                                      code: RegistrationDeliverySingleton()
                                          .boundary!
                                          .code!,
                                      name: RegistrationDeliverySingleton()
                                          .boundary!
                                          .name,
                                    ),
                                    tenantId: RegistrationDeliverySingleton()
                                        .tenantId,
                                    rowVersion: 1,
                                    buildingName:
                                        (RegistrationDeliverySingleton()
                                                    .householdType ==
                                                HouseholdType.community)
                                            ? form
                                                .control(_buildingNameKey)
                                                .value
                                            : null,
                                    auditDetails: AuditDetails(
                                      createdBy: RegistrationDeliverySingleton()
                                          .loggedInUserUuid!,
                                      createdTime:
                                          ContextUtilityExtensions(context)
                                              .millisecondsSinceEpoch(),
                                    ),
                                    clientAuditDetails: ClientAuditDetails(
                                      createdBy: RegistrationDeliverySingleton()
                                          .loggedInUserUuid!,
                                      createdTime:
                                          ContextUtilityExtensions(context)
                                              .millisecondsSinceEpoch(),
                                      lastModifiedBy:
                                          RegistrationDeliverySingleton()
                                              .loggedInUserUuid,
                                      lastModifiedTime:
                                          ContextUtilityExtensions(context)
                                              .millisecondsSinceEpoch(),
                                    ),
                                  );

                                  bloc.add(
                                    BeneficiaryRegistrationSaveAddressEvent(
                                      addressModel,
                                    ),
                                  );
                                  router.push(CustomHouseHoldDetailsRoute());
                                }
                              },
                              editHousehold: (
                                address,
                                householdModel,
                                individuals,
                                registrationDate,
                                projectBeneficiaryModel,
                                loading,
                                headOfHousehold,
                              ) {
                                var addressModel = address.copyWith(
                                  addressLine1: addressLine1 != null &&
                                          addressLine1.trim().isNotEmpty
                                      ? addressLine1
                                      : null,
                                  addressLine2: addressLine2 != null &&
                                          addressLine2.trim().isNotEmpty
                                      ? addressLine2
                                      : null,
                                  landmark: landmark != null &&
                                          landmark.trim().isNotEmpty
                                      ? landmark
                                      : null,
                                  locality: address.locality,
                                  pincode: postalCode != null &&
                                          postalCode.trim().isNotEmpty
                                      ? postalCode
                                      : null,
                                  type: AddressType.correspondence,
                                  latitude: form.control(_latKey).value,
                                  longitude: form.control(_lngKey).value,
                                  buildingName: (RegistrationDeliverySingleton()
                                              .householdType ==
                                          HouseholdType.community)
                                      ? form.control(_buildingNameKey).value
                                      : null,
                                  locationAccuracy:
                                      form.control(_accuracyKey).value,
                                );
                                // TODO [Linking of Voucher for Household based project  need to be handled]

                                bloc.add(
                                  BeneficiaryRegistrationSaveAddressEvent(
                                    addressModel,
                                  ),
                                );
                                router.push(CustomHouseHoldDetailsRoute());
                              },
                              addMember: (
                                address,
                                householdModel,
                                loading,
                              ) {
                                var addressModel = address.copyWith(
                                  addressLine1: addressLine1 != null &&
                                          addressLine1.trim().isNotEmpty
                                      ? addressLine1
                                      : null,
                                  addressLine2: addressLine2 != null &&
                                          addressLine2.trim().isNotEmpty
                                      ? addressLine2
                                      : null,
                                  landmark: landmark != null &&
                                          landmark.trim().isNotEmpty
                                      ? landmark
                                      : null,
                                  locality: address.locality,
                                  pincode: postalCode != null &&
                                          postalCode.trim().isNotEmpty
                                      ? postalCode
                                      : null,
                                  type: AddressType.correspondence,
                                  latitude: form.control(_latKey).value,
                                  longitude: form.control(_lngKey).value,
                                  buildingName: (RegistrationDeliverySingleton()
                                              .householdType ==
                                          HouseholdType.community)
                                      ? form.control(_buildingNameKey).value
                                      : null,
                                  locationAccuracy:
                                      form.control(_accuracyKey).value,
                                );
                                // TODO [Linking of Voucher for Household based project  need to be handled]

                                bloc.add(
                                  BeneficiaryRegistrationSaveAddressEvent(
                                    addressModel,
                                  ),
                                );
                                router.push(CustomHouseHoldDetailsRoute());
                              },
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
                                  i18.householdLocation.clfLocationLabelText)
                              : localizations.translate(
                                  i18.householdLocation
                                      .householdLocationLabelText,
                                ),
                          headingStyle: textTheme.headingXl
                              .copyWith(color: theme.colorTheme.text.primary),
                        ),
                        householdLocationShowcaseData.administrativeArea
                            .buildWith(
                          child: ReactiveWrapperField(
                            formControlName: _administrationAreaKey,
                            validationMessages: {
                              'required': (_) => localizations.translate(
                                    i18.householdLocation
                                        .administrationAreaRequiredValidation,
                                  ),
                            },
                            builder: (field) => LabeledField(
                              isRequired: true,
                              label: localizations.translate(
                                i18.householdLocation
                                    .administrationAreaFormLabel,
                              ),
                              child: DigitTextFormInput(
                                readOnly: true,
                                errorMessage: field.errorText,
                                initialValue:
                                    form.control(_administrationAreaKey).value,
                                onChange: (value) {
                                  form.control(_administrationAreaKey).value =
                                      value;
                                },
                              ),
                            ),
                          ),
                        ),
                        ReactiveWrapperField(
                          formControlName: _accuracyKey,
                          validationMessages: {
                            'required': (_) => localizations.translate(
                                  i18_registration_delivery
                                      .householdLocation.gpsAccuracyLabel,
                                ),
                          },
                          builder: (field) => LabeledField(
                            isRequired: true,
                            label: localizations.translate(
                              i18_registration_delivery
                                  .householdLocation.gpsAccuracyLabel,
                            ),
                            child: DigitTextFormInput(
                              readOnly: true,
                              errorMessage: field.errorText,
                              initialValue:
                                  (form.control(_accuracyKey).value ?? 0.0)
                                      .toString(),
                              onChange: (value) {
                                form.control(_accuracyKey).value = value;
                              },
                            ),
                          ),
                        ),
                        ReactiveWrapperField(
                          formControlName: _householdNumberKey,
                          validationMessages: {
                            'required': (object) => localizations.translate(
                                  '${i18_local.householdDetails.householdNumberLabel}_IS_REQUIRED',
                                ),
                            'maxLength': (object) => localizations
                                .translate(i18.common.maxCharsRequired)
                                .replaceAll('{}', maxLength.toString()),
                          },
                          builder: (field) => LabeledField(
                            label: localizations.translate(
                              i18_local.householdDetails.householdNumberLabel,
                            ),
                            child: DigitTextFormInput(
                              initialValue:
                                  form.control(_householdNumberKey).value,
                              onChange: (value) {
                                form.control(_householdNumberKey).value = value;
                              },
                              errorMessage: field.errorText,
                            ),
                          ),
                        ),
                        ReactiveWrapperField<String>(
                            formControlName: _consent,
                            validationMessages: {
                              'required': (_) => localizations.translate(
                                    i18.common.corecommonRequired,
                                  ),
                            },
                            showErrors: (control) =>
                                control.invalid && control.touched,
                            // Ensures error is shown if invalid and touched
                            builder: (field) {
                              return LabeledField(
                                isRequired: true,
                                label: localizations.translate(
                                  i18_local
                                      .householdDetails.householdConsentAction,
                                ),
                                child: RadioList(
                                    onChanged: (val) {
                                      form.control(_consent).markAsTouched();
                                      form.control(_consent).value = val.code;
                                      if (val.code ==
                                          CaregiverConsentEnum.yes.toString()) {
                                        setState(() {
                                          isConsent = true;

                                          form
                                              .control(_reasonNonComplianceKey)
                                              .clearValidators();
                                          form
                                              .control(_householdHeadNameKey)
                                              .clearValidators();
                                        });
                                      } else if (val.code ==
                                          CaregiverConsentEnum.no.toString()) {
                                        setState(() {
                                          isConsent = false;
                                          form
                                              .control(_householdHeadNameKey)
                                              .setValidators([
                                            Validators.required,
                                            Validators.delegate((validator) =>
                                                CustomValidator.sizeLessThan2(
                                                    validator)),
                                          ]);
                                          form
                                              .control(_reasonNonComplianceKey)
                                              .setValidators([
                                            Validators.required,
                                            Validators.delegate((validator) =>
                                                CustomValidator.sizeLessThan2(
                                                    validator)),
                                          ]);
                                        });
                                      }
                                    },
                                    groupValue:
                                        form.control(_consent).value ?? "",
                                    errorMessage: field.errorText,
                                    radioDigitButtons: [
                                      RadioButtonModel(
                                          code: CaregiverConsentEnum.yes
                                              .toString(),
                                          name: localizations.translate(
                                              i18_local
                                                  .householdDetails.submitYes)),
                                      RadioButtonModel(
                                          code: CaregiverConsentEnum.no
                                              .toString(),
                                          name: localizations.translate(
                                            i18_local.householdDetails.submitNo,
                                          )),
                                    ]),
                              );
                            }),
                        Offstage(
                          offstage: isConsent,
                          child: ReactiveWrapperField(
                            formControlName: _householdHeadNameKey,
                            validationMessages: {
                              'required': (object) => localizations.translate(
                                    '${i18_local.individualDetails.nameLabelText}_IS_REQUIRED',
                                  ),
                              'maxLength': (object) => localizations
                                  .translate(i18.common.maxCharsRequired)
                                  .replaceAll('{}', maxLength.toString()),
                            },
                            builder: (field) => LabeledField(
                              isRequired: !isConsent,
                              label: localizations.translate(
                                i18_local.individualDetails.nameLabelText,
                              ),
                              child: DigitTextFormInput(
                                initialValue:
                                    form.control(_householdHeadNameKey).value,
                                onChange: (value) {
                                  form.control(_householdHeadNameKey).value =
                                      value;
                                },
                                errorMessage: field.errorText,
                              ),
                            ),
                          ),
                        ),
                        Offstage(
                          offstage: isConsent,
                          child: BlocBuilder<AppInitializationBloc,
                              AppInitializationState>(
                            builder: (context, state) {
                              if (state is! AppInitialized) {
                                return const Offstage();
                              }

                              final nonComplianceReasons =
                                  state.appConfiguration.nonComplianceReasons ??
                                      <NonComplianceReasons>[];

                              return DigitReactiveSearchDropdown<String>(
                                label: localizations.translate(
                                  i18_local.caregiverConsent
                                      .reasonForNonComplianceLabel,
                                ),
                                form: form,
                                enabled: true,
                                isRequired: !isConsent,
                                menuItems: nonComplianceReasons.map((e) {
                                  return e.code;
                                }).toList(),
                                formControlName: _reasonNonComplianceKey,
                                valueMapper: (value) => localizations.translate(
                                  value,
                                ),
                                emptyText: localizations
                                    .translate(i18.common.noMatchFound),
                                validationMessage: localizations.translate(
                                  i18.common.corecommonRequired,
                                ),
                              );
                            },
                          ),
                        ),
                        if (RegistrationDeliverySingleton().householdType ==
                            HouseholdType.community)
                          householdLocationShowcaseData.buildingName.buildWith(
                              child: ReactiveWrapperField(
                                  formControlName: _buildingNameKey,
                                  validationMessages: {
                                    'required': (_) => localizations.translate(
                                          i18.common.corecommonRequired,
                                        ),
                                    'sizeLessThan2': (_) =>
                                        localizations.translate(
                                            i18.common.min3CharsRequired),
                                    'maxLength': (object) => localizations
                                        .translate(i18.common.maxCharsRequired)
                                        .replaceAll('{}', maxLength.toString()),
                                  },
                                  builder: (field) => LabeledField(
                                      label: localizations.translate(i18
                                          .householdLocation.buildingNameLabel),
                                      isRequired: true,
                                      child: DigitTextFormInput(
                                        errorMessage: field.errorText,
                                        onChange: (value) {
                                          form.control(_buildingNameKey).value =
                                              value;
                                        },
                                        initialValue: form
                                            .control(_buildingNameKey)
                                            .value,
                                      )))),
                      ]),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  FormGroup buildForm(BeneficiaryRegistrationState state) {
    final addressModel = state.mapOrNull(
      create: (value) => value.addressModel,
      editHousehold: (value) => value.addressModel,
    );

    final searchQuery = state.mapOrNull<String>(
      create: (value) {
        return value.searchQuery;
      },
    );

    return fb.group(<String, Object>{
      _administrationAreaKey: FormControl<String>(
        value: localizations
            .translate(RegistrationDeliverySingleton().boundary!.code ?? ''),
        validators: [Validators.required],
      ),
      _addressLine1Key:
          FormControl<String>(value: addressModel?.addressLine1, validators: [
        Validators.delegate(
            (validator) => CustomValidator.requiredMin(validator)),
        Validators.maxLength(64),
      ]),
      _addressLine2Key: FormControl<String>(
        value: addressModel?.addressLine2,
        validators: [
          Validators.delegate(
              (validator) => CustomValidator.requiredMin(validator)),
          Validators.maxLength(64),
        ],
      ),
      _landmarkKey:
          FormControl<String>(value: addressModel?.landmark, validators: [
        Validators.delegate(
            (validator) => CustomValidator.requiredMin(validator)),
        Validators.maxLength(64),
        Validators.delegate((validator) =>
            local_utils.CustomValidator.onlyAlphabetsAndDigits(validator)),
      ]),
      _postalCodeKey:
          FormControl<String>(value: addressModel?.pincode, validators: [
        Validators.delegate(
            (validator) => CustomValidator.requiredMin(validator)),
        Validators.maxLength(6),
      ]),
      _latKey: FormControl<double>(value: addressModel?.latitude),
      _lngKey: FormControl<double>(
        value: addressModel?.longitude,
      ),
      _accuracyKey: FormControl<double>(
        value: addressModel?.locationAccuracy,
      ),
      _householdNumberKey: FormControl<String>(validators: [
        Validators.delegate(
            (validator) => CustomValidator.requiredMin(validator)),
        Validators.maxLength(200),
      ]),
      _consent: FormControl<String>(
        value: CaregiverConsentEnum.yes.toString(),
        validators: [
          Validators.required,
        ],
      ),
      _householdHeadNameKey: FormControl<String>(
        value: null,
      ),
      _reasonNonComplianceKey: FormControl<String>(
        value: null,
      ),
      if (RegistrationDeliverySingleton().householdType ==
          HouseholdType.community)
        _buildingNameKey: FormControl<String>(
          validators: [
            Validators.required,
            Validators.delegate(
                (validator) => CustomValidator.sizeLessThan2(validator)),
            Validators.maxLength(64),
          ],
          value: addressModel?.buildingName ?? searchQuery?.trim(),
        ),
    });
  }
}
