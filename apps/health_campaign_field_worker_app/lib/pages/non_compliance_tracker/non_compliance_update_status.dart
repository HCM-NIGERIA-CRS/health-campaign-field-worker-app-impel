import 'dart:collection';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:digit_data_model/utils/utils.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/models/DropdownModels.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/utils/component_utils.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/atoms/digit_dropdown_input.dart';
import 'package:digit_ui_components/widgets/atoms/labelled_fields.dart';
import 'package:digit_ui_components/widgets/atoms/reactive_fields.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart';
import 'package:registration_delivery/models/entities/task.dart';
import 'package:registration_delivery/utils/i18_key_constants.dart' as i18;
import 'package:registration_delivery/utils/utils.dart';

import '../../blocs/non_compliance/non_compliance_tracking.dart';
import '../../router/app_router.dart';
import '../../utils/constants.dart';
import '../../widgets/custom_back_navigation.dart';
import '../../widgets/localized.dart';
import '../../utils/i18_key_constants.dart' as i18_local;

@RoutePage()
class NonComplianceUpdateStatusPage extends LocalizedStatefulWidget {
  final HouseholdMemberWrapper householdMember;
  const NonComplianceUpdateStatusPage({
    super.key,
    required this.householdMember,
  });

  @override
  State<NonComplianceUpdateStatusPage> createState() =>
      _NonComplianceUpdateStatusPageState();
}

class _NonComplianceUpdateStatusPageState
    extends LocalizedState<NonComplianceUpdateStatusPage> {
  static const _status = 'status';
  static const _intervenedBy = 'intervenedBy';

  FormGroup buildForm() => fb.group(<String, Object>{
        _status: FormControl<DropdownItem>(
          validators: [Validators.required],
        ),
        _intervenedBy: FormControl<DropdownItem>(
          validators: [Validators.required],
        ),
      });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    List<TaskModel> tasks = widget.householdMember.tasks ?? [];
    String? taskClientReferenceId = tasks.firstOrNull?.clientReferenceId;

    return BlocBuilder<NonComplianceTrackingBloc, NonComplianceTrackingState>(
      builder: (context, state) {
        return ReactiveFormBuilder(
            form: buildForm,
            builder: (context, form, child) {
              return Scaffold(
                body: Column(children: [
                  const CustomBackNavigationHelpHeaderWidget(
                    showHelp: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(spacer2),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        localizations.translate(
                            i18_local.common.nonComplianceUpdateStatusLabel),
                        style: textTheme.headingXl.copyWith(
                          color: theme.colorTheme.text.primary,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(spacer2),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: spacer2),
                          child: ReactiveWrapperField(
                            formControlName: _status,
                            validationMessages: {
                              "required": (control) {
                                return localizations.translate(
                                  i18.common.corecommonRequired,
                                );
                              }
                            },
                            builder: (field) => LabeledField(
                              label: localizations.translate(_status),
                              isRequired: true,
                              child: DigitDropdown<String>(
                                onTap: () {},
                                isDisabled: false,
                                sentenceCaseEnabled: false,
                                items: Constants.statusOptions
                                    .map((e) => DropdownItem(code: e, name: e))
                                    .toList(),
                                onSelect: (value) {
                                  form.control(_status).value = value;
                                },
                                onChange: (value) {},
                                emptyItemText: localizations
                                    .translate(i18.common.noMatchFound),
                                errorMessage: form.control(_status).hasErrors
                                    ? localizations.translate(
                                        i18.common.corecommonRequired,
                                      )
                                    : null,
                                selectedOption: form.control(_status).value,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: spacer2),
                          child: ReactiveWrapperField(
                            formControlName: _intervenedBy,
                            validationMessages: {
                              "required": (control) {
                                return localizations.translate(
                                  i18.common.corecommonRequired,
                                );
                              }
                            },
                            builder: (field) => LabeledField(
                              label: localizations.translate(_intervenedBy),
                              isRequired: true,
                              child: DigitDropdown<String>(
                                onTap: () {},
                                isDisabled: false,
                                sentenceCaseEnabled: false,
                                items: Constants.intervenedByOptions
                                    .map((e) => DropdownItem(code: e, name: e))
                                    .toList(),
                                onSelect: (value) {
                                  form.control(_intervenedBy).value = value;
                                },
                                onChange: (value) {},
                                emptyItemText: localizations
                                    .translate(i18.common.noMatchFound),
                                errorMessage:
                                    form.control(_intervenedBy).hasErrors
                                        ? localizations.translate(
                                            i18.common.corecommonRequired,
                                          )
                                        : null,
                                selectedOption:
                                    form.control(_intervenedBy).value,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
                bottomNavigationBar: DigitCard(
                  margin: const EdgeInsets.only(top: spacer2),
                  padding: const EdgeInsets.all(spacer2),
                  children: [
                    BlocBuilder<LocationBloc, LocationState>(
                      builder: (context, locationState) {
                        double? latitude = locationState.latitude;
                        double? longitude = locationState.longitude;
                        double? locationAccuracy = locationState.accuracy;
                        return DigitButton(
                          capitalizeLetters: false,
                          label: localizations
                              .translate(i18.common.coreCommonSubmit),
                          mainAxisSize: MainAxisSize.max,
                          type: DigitButtonType.primary,
                          size: DigitButtonSize.large,
                          isDisabled: false,
                          onPressed: () {
                            if (!form.valid) return;
                            if (taskClientReferenceId == null) return;
                            var clientReferenceId = IdGen.i.identifier;
                            var startTime =
                                DateTime.now().millisecondsSinceEpoch;
                            if (latitude == null ||
                                longitude == null ||
                                locationAccuracy == null) {
                              if (context.mounted) {
                                DigitComponentsUtils.showDialog(
                                  context,
                                  localizations
                                      .translate(i18.common.locationCapturing),
                                  DialogType.inProgress,
                                );
                              }
                              return;
                            }
                            String? status = form.control(_status).value?.name;
                            String? intervenedBy =
                                form.control(_intervenedBy).value?.name;
                            UserActionModel? preNonComplianceUserAction;
                            if (state is NonComplianceTrackingSearchState) {
                              preNonComplianceUserAction =
                                  state.nonComplianceUserAction;
                            }
                            List<AdditionalField> additionalFields = [
                              if (status != null)
                                AdditionalField(Constants.status, status),
                              if (intervenedBy != null)
                                AdditionalField(
                                    Constants.intervenedBy, intervenedBy),
                            ];
                            UserActionModel nonComplianceUserAction =
                                preNonComplianceUserAction?.copyWith(
                                        additionalFields:
                                            UserActionAdditionalFields(
                                      version: 1,
                                      fields: additionalFields,
                                    )) ??
                                    UserActionModel(
                                        latitude: latitude,
                                        longitude: longitude,
                                        locationAccuracy: locationAccuracy,
                                        clientReferenceId: clientReferenceId,
                                        isSync: true,
                                        timestamp: startTime,
                                        tenantId:
                                            RegistrationDeliverySingleton()
                                                .tenantId,
                                        projectId:
                                            RegistrationDeliverySingleton()
                                                .projectId!,
                                        boundaryCode:
                                            RegistrationDeliverySingleton()
                                                    .boundary
                                                    ?.code! ??
                                                "",
                                        action: "NON_COMPLIANCE",
                                        beneficiaryTag: taskClientReferenceId,
                                        additionalFields:
                                            UserActionAdditionalFields(
                                          version: 1,
                                          fields: additionalFields,
                                        ));

                            context
                                .read<NonComplianceTrackingBloc>()
                                .add(NonComplianceTrackingEvent.create(
                                  nonComplianceUserAction:
                                      nonComplianceUserAction,
                                ));
                            context.router.popUntilRoot();
                          },
                        );
                      },
                    ),
                  ],
                ),
              );
            });
      },
    );
  }
}
