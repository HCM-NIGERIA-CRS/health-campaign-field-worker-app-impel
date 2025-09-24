import 'package:auto_route/auto_route.dart';
import 'package:digit_scanner/digit_scanner.dart';
import 'package:digit_scanner/pages/qr_scanner.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/utils/component_utils.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/utils/utils.dart';
import 'package:registration_delivery/widgets/showcase/config/showcase_constants.dart';

import 'package:transit_post/blocs/transit_post.dart';
import 'package:transit_post/router/transit_post_router.gm.dart';
import 'package:transit_post/utils/i18_key_constants.dart' as i18;
import 'package:transit_post/utils/utils.dart';
import 'package:transit_post/widgets/back_navigation_help_header.dart';
import 'package:transit_post/widgets/localized.dart';
import 'package:transit_post/widgets/total_delivery.dart';
import 'package:registration_delivery/utils/i18_key_constants.dart'
    as i18_registration_delivery;
import '../../blocs/transit_post/fixed_post.dart';
import '../../models/entities/user_action_enums.dart';
import '../../utils/i18_key_constants.dart' as i18_local;

import '../../router/app_router.dart';
import '../../widgets/custom_pop_route.dart';
import '../campaign_delivery_select.dart';

@RoutePage()
class CustomFixedPostSelectionPage extends LocalizedStatefulWidget {
  const CustomFixedPostSelectionPage({super.key});

  @override
  LocalizedState<CustomFixedPostSelectionPage> createState() =>
      CustomFixedPostSelectionPageState();
}

class CustomFixedPostSelectionPageState
    extends LocalizedState<CustomFixedPostSelectionPage> {
  static const _transitPostName = 'transitPostName';
  static const _latKey = 'latKey';
  static const _lngKey = 'lngKey';
  static const _accuracyKey = 'accuracy';
  static const _administrationAreaKey = 'administrationArea';

  @override
  void initState() {
    super.initState();
    context.read<FixedPostBloc>().add(
        FixedPostDeliveryCountEvent(action: UserActionEnums.fixed.toValue()));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Show the dialog after the first frame is built
      DigitComponentsUtils.showDialog(
        context,
        localizations.translate(i18.common.locationCapturing),
        DialogType.inProgress,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FixedPostBloc, FixedPostState>(
        builder: (context, fixedPostState) {
      return GlobalBackHandler(
        child: Scaffold(
          body: fixedPostState.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ReactiveFormBuilder(
                  form: () => buildFormGroup(),
                  builder: (_, form, __) => BlocListener<LocationBloc,
                          LocationState>(
                      listener: (context, locationState) {
                        if (locationState.accuracy != null) {
                          //Hide the dialog after 1 seconds
                          Future.delayed(const Duration(seconds: 1), () {
                            DigitComponentsUtils.hideDialog(context);
                          });
                        }

                        final lat = locationState.latitude;
                        final lng = locationState.longitude;
                        final accuracy = locationState.accuracy;

                        form.control(_latKey).value ??= lat;
                        form.control(_lngKey).value ??= lng;
                        form.control(_accuracyKey).value ??= accuracy;
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
                        header: const BackNavigationHelpHeaderWidget(),
                        enableFixedDigitButton: true,
                        footer: DigitCard(
                          margin: const EdgeInsets.only(top: spacer2),
                          children: [
                            DigitButton(
                              label: localizations.translate(
                                i18_local.common.coreCommonNext,
                              ),
                              isDisabled: !form.valid,
                              onPressed: () async {
                                form.markAllAsTouched();
                                if (!form.valid) return;

                                final transitPostName =
                                    form.control(_transitPostName).value;
                                final lat = form.control(_latKey).value;
                                final lng = form.control(_lngKey).value;
                                final accuracy =
                                    form.control(_accuracyKey).value;

                                context
                                    .read<FixedPostBloc>()
                                    .add(FixedPostSelectionEvent(
                                      longitude: lng,
                                      latitude: lat,
                                      locationAccuracy: accuracy,
                                      fixedPostName: transitPostName,
                                      fixedPostType: "",
                                    ));

                                if (context.mounted) {
                                  context.router.push(
                                      CustomFixedPostRecordVaccinationRoute(
                                          postType:
                                              UserActionEnums.fixed.toValue()));
                                }
                              },
                              type: DigitButtonType.primary,
                              size: DigitButtonSize.large,
                              mainAxisSize: MainAxisSize.max,
                            )
                          ],
                        ),
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              DeliveryWidget(
                                count: fixedPostState.totalCount ?? 0,
                                description: localizations.translate(
                                    i18.transitPost.totalDeliveriesDescription),
                                width: MediaQuery.of(context).size.width * 0.5,
                              ),
                              DeliveryWidget(
                                count: fixedPostState.curCount ?? 0,
                                description: localizations.translate(
                                    i18.transitPost.todayDeliveriesDescription),
                                width: MediaQuery.of(context).size.width * 0.5,
                              )
                            ],
                          ),
                          DigitCard(
                              margin: const EdgeInsets.all(spacer2),
                              children: [
                                ReactiveWrapperField(
                                  formControlName: _administrationAreaKey,
                                  validationMessages: {
                                    'required': (_) => localizations.translate(
                                          i18_registration_delivery
                                              .householdLocation
                                              .administrationAreaRequiredValidation,
                                        ),
                                  },
                                  builder: (field) => LabeledField(
                                    isRequired: true,
                                    label: localizations.translate(
                                      i18_registration_delivery
                                          .householdLocation
                                          .administrationAreaFormLabel,
                                    ),
                                    child: DigitTextFormInput(
                                      readOnly: true,
                                      errorMessage: field.errorText,
                                      initialValue: form
                                          .control(_administrationAreaKey)
                                          .value,
                                      onChange: (value) {
                                        form
                                            .control(_administrationAreaKey)
                                            .value = value;
                                      },
                                    ),
                                  ),
                                ),
                                ReactiveWrapperField(
                                  formControlName: _accuracyKey,
                                  validationMessages: {
                                    'required': (_) => localizations.translate(
                                          i18_registration_delivery
                                              .householdLocation
                                              .gpsAccuracyLabel,
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
                                          (form.control(_accuracyKey).value ??
                                                  0.0)
                                              .toString(),
                                      onChange: (value) {
                                        form.control(_accuracyKey).value =
                                            value;
                                      },
                                    ),
                                  ),
                                ),
                                ReactiveWrapperField(
                                  formControlName: _transitPostName,
                                  validationMessages: {
                                    "required": (_) => localizations.translate(
                                        i18.common.coreCommonRequired)
                                  },
                                  builder: (field) => LabeledField(
                                    label: localizations.translate(
                                      i18_local
                                          .transitFixedPost.fixedPostnameLabel,
                                    ),
                                    isRequired: true,
                                    child: DigitDropdown(
                                      selectedOption: DropdownItem(
                                          name: localizations.translate(form
                                                  .control(_transitPostName)
                                                  .value ??
                                              ''),
                                          code: form
                                                  .control(_transitPostName)
                                                  .value ??
                                              ''),
                                      items: TransitPostSingleton()
                                              .transitPostType
                                              ?.map((transitPostType) =>
                                                  DropdownItem(
                                                      name: localizations
                                                          .translate(
                                                              transitPostType),
                                                      code: transitPostType))
                                              .toList() ??
                                          [],
                                      onSelect: (value) {
                                        setState(() {
                                          form.control(_transitPostName).value =
                                              value.code;
                                        });
                                      },
                                      errorMessage: field.errorText,
                                    ),
                                  ),
                                ),
                              ]),
                        ],
                      )),
                ),
        ),
      );
    });
  }

  FormGroup buildFormGroup() {
    return fb.group(<String, Object>{
      _administrationAreaKey: FormControl<String>(
        value: localizations
            .translate(RegistrationDeliverySingleton().boundary!.code ?? ''),
        validators: [Validators.required],
      ),
      _transitPostName: FormControl<String>(
        validators: [Validators.required],
      ),
      _latKey: FormControl<double>(),
      _lngKey: FormControl<double>(),
      _accuracyKey: FormControl<double>(),
    });
  }
}
