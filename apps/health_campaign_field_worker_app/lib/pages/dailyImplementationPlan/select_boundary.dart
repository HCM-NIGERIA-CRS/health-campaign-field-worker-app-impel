import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/input_wrapper.dart';
import 'package:digit_ui_components/widgets/atoms/text_block.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../router/app_router.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/utils/utils.dart';
import '../../blocs/registration_delivery/custom_beneficairy_registration.dart';
import '../../utils/i18_key_constants.dart' as i18;
import 'package:inventory_management/widgets/localized.dart';
import 'package:inventory_management/utils/utils.dart';
import '../../widgets/custom_back_navigation.dart';

@RoutePage()
class SelectBoundaryPage extends LocalizedStatefulWidget {
  const SelectBoundaryPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<SelectBoundaryPage> createState() => SelectBoundaryPageState();
}

class SelectBoundaryPageState extends LocalizedState<SelectBoundaryPage> {
  static const _dateOfEntryKey = 'dateOfReceipt';
  static const _administrativeUnitKey = 'administrativeUnit';
  static const _wfpSupervisorKey = 'wfpSupervisor';
  static const _settlementKey = 'settlement';

  bool deliveryTeamSelected = false;
  String? selectedFacilityId;
  TextEditingController controller1 = TextEditingController();

  FormGroup buildForm(bool isDistributor) => fb.group(<String, Object>{
        _dateOfEntryKey: FormControl<DateTime>(value: DateTime.now()),
        _administrativeUnitKey: FormControl<String>(
          value: localizations
              .translate(InventorySingleton().boundary!.code ?? ''),
        ),
        _wfpSupervisorKey: FormControl<String>(
          validators: isDistributor ? [] : [Validators.required],
        ),
        _settlementKey: FormControl<String>(
          validators: isDistributor ? [] : [Validators.required],
        ),
      });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      body: BlocBuilder<CustomBeneficiaryRegistrationBloc,
          BeneficiaryRegistrationState>(builder: (context, registrationState) {
        return ReactiveFormBuilder(
          form: () => buildForm(true),
          builder: (_, form, __) => ScrollableContent(
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
            slivers: [
              SliverToBoxAdapter(
                child:
                    DigitCard(margin: const EdgeInsets.all(spacer2), children: [
                  DigitTextBlock(
                    padding: EdgeInsets.zero,
                    heading: localizations.translate(
                        i18.dailyImplementationFlow.selectBoundaryLabel),
                    headingStyle: textTheme.headingXl
                        .copyWith(color: theme.colorTheme.text.primary),
                  ),
                  ReactiveWrapperField(
                      formControlName: _dateOfEntryKey,
                      builder: (field) {
                        return InputField(
                          type: InputType.date,
                          label: localizations.translate(
                            i18.dailyImplementationFlow.dateOfEntry,
                          ),
                          confirmText: localizations.translate(
                            i18.common.coreCommonOk,
                          ),
                          cancelText: localizations.translate(
                            i18.common.coreCommonCancel,
                          ),
                          initialValue: DateFormat('dd MMM yyyy')
                              .format(field.control.value),
                          readOnly: true,
                        );
                      }),
                  ReactiveWrapperField(
                      formControlName: _administrativeUnitKey,
                      builder: (field) {
                        return InputField(
                          isRequired: true,
                          type: InputType.text,
                          label:
                              '${localizations.translate(i18.dailyImplementationFlow.administrativeUnitLabel)} ',
                          initialValue: field.control.value,
                          readOnly: true,
                        );
                      }),
                  ReactiveWrapperField(
                      formControlName: _wfpSupervisorKey,
                      builder: (field) {
                        return InputField(
                          isRequired: true,
                          type: InputType.text,
                          label:
                              '${localizations.translate(i18.dailyImplementationFlow.wfpSupervisorLabel)} ',
                          initialValue: field.control.value,
                          readOnly: true,
                        );
                      }),
                  ReactiveWrapperField(
                    formControlName: _settlementKey,
                    validationMessages: {
                      'required': (object) =>
                          '${i18.dailyImplementationFlow.boundaryLabel}_IS_REQUIRED',
                    },
                    showErrors: (control) => control.invalid && control.touched,
                    builder: (field) {
                      return LabeledField(
                        label: localizations.translate(
                          i18.dailyImplementationFlow.boundaryLabel,
                        ),
                        isRequired: true,
                        child: MultiSelectDropDown(
                          selectionType: SelectionType.nestedSelect,
                          errorMessage: field.errorText,
                          emptyItemText: localizations.translate(
                            i18.common.noMatchFound,
                          ),
                          options: [],
                          onOptionSelected: (value) {
                            setState(() {});
                          },
                        ),
                      );
                    },
                  ),
                ]),
              ),
            ],
          ),
        );
      }),
    );
  }
}
