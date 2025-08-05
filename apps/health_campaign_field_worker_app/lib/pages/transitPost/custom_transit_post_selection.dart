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

@RoutePage()
class CustomTransitPostSelectionPage extends LocalizedStatefulWidget {
  const CustomTransitPostSelectionPage({super.key});

  @override
  LocalizedState<CustomTransitPostSelectionPage> createState() =>
      CustomTransitPostSelectionPageState();
}

class CustomTransitPostSelectionPageState
    extends LocalizedState<CustomTransitPostSelectionPage> {
  static const _transitPostType = 'transitPostType';
  static const _transitPostName = 'transitPostName';
  static const _latKey = 'latKey';
  static const _lngKey = 'lngKey';
  static const _accuracyKey = 'accuracy';
  static const _administrationAreaKey = 'administrationArea';

  @override
  void initState() {
    super.initState();
    context.read<TransitPostBloc>().add(const TransitPostDeliveryCountEvent());
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
    return BlocBuilder<TransitPostBloc, TransitPostState>(
        builder: (context, transitPostState) {
      return Scaffold(
        body: transitPostState.loading
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
                              i18.transitPost.scanResourceLabel,
                            ),
                            isDisabled: !form.valid,
                            onPressed: () async {
                              form.markAllAsTouched();
                              if (!form.valid) return;

                              final transitPostType =
                                  form.control(_transitPostType).value;
                              final transitPostName =
                                  form.control(_transitPostName).value;
                              final lat = form.control(_latKey).value;
                              final lng = form.control(_lngKey).value;
                              final accuracy = form.control(_accuracyKey).value;

                              context
                                  .read<TransitPostBloc>()
                                  .add(TransitPostSelectionEvent(
                                    longitude: lng,
                                    latitude: lat,
                                    locationAccuracy: accuracy,
                                    transitPostName: transitPostName,
                                    transitPostType: transitPostType,
                                  ));

                              final bloc = context.read<DigitScannerBloc>();
                              final state = bloc.state.barCodes;

                              if (state.isNotEmpty) {
                                await showCustomPopup(
                                    context: context,
                                    builder: (popUpContext) => Popup(
                                          title: localizations.translate(
                                            i18.transitPost.alertPopupTitle,
                                          ),
                                          type: PopUpType.alert,
                                          description: localizations.translate(
                                            i18.transitPost
                                                .alertPopupDescription,
                                          ),
                                          actions: [
                                            DigitButton(
                                              label: localizations.translate(
                                                i18.common.coreCommonOk,
                                              ),
                                              onPressed: () {
                                                Navigator.of(popUpContext)
                                                    .pop();
                                              },
                                              type: DigitButtonType.primary,
                                              size: DigitButtonSize.large,
                                            )
                                          ],
                                        ));
                              }

                              await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const DigitScannerPage(
                                    quantity: 1,
                                    isGS1code: true,
                                    singleValue: true,
                                  ),
                                  settings:
                                      const RouteSettings(name: '/qr-scanner'),
                                ),
                              );
                              if (context.mounted) {
                                final bloc = context.read<DigitScannerBloc>();
                                final state = bloc.state.barCodes;
                                if (state.isNotEmpty) {
                                  context.router.push(
                                      const TransitPostRecordVaccinationRoute());
                                }
                              }
                            },
                            type: DigitButtonType.primary,
                            size: DigitButtonSize.large,
                            mainAxisSize: MainAxisSize.max,
                            prefixIcon: Icons.document_scanner_sharp,
                          )
                        ],
                      ),
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DeliveryWidget(
                              count: transitPostState.totalCount ?? 0,
                              description: localizations.translate(
                                  i18.transitPost.totalDeliveriesDescription),
                              width: MediaQuery.of(context).size.width * 0.5,
                            ),
                            DeliveryWidget(
                              count: transitPostState.curCount ?? 0,
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
                                    i18_registration_delivery.householdLocation
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
                                        (form.control(_accuracyKey).value ??
                                                0.0)
                                            .toString(),
                                    onChange: (value) {
                                      form.control(_accuracyKey).value = value;
                                    },
                                  ),
                                ),
                              ),
                              ReactiveWrapperField(
                                formControlName: _transitPostType,
                                validationMessages: {
                                  "required": (_) => localizations
                                      .translate(i18.common.coreCommonRequired)
                                },
                                builder: (field) => LabeledField(
                                  label: localizations.translate(
                                    i18.transitPost.typeSelectionLabel,
                                  ),
                                  isRequired: true,
                                  child: DigitDropdown(
                                    selectedOption: DropdownItem(
                                        name: localizations.translate(form
                                                .control(_transitPostType)
                                                .value ??
                                            ''),
                                        code: form
                                                .control(_transitPostType)
                                                .value ??
                                            ''),
                                    items: TransitPostSingleton()
                                            .transitPostType
                                            ?.map((transitPostType) =>
                                                DropdownItem(
                                                    name:
                                                        localizations.translate(
                                                            transitPostType),
                                                    code: transitPostType))
                                            .toList() ??
                                        [],
                                    onSelect: (value) {
                                      setState(() {
                                        form.control(_transitPostType).value =
                                            value.code;
                                      });
                                    },
                                    errorMessage: field.errorText,
                                  ),
                                ),
                              ),
                              ReactiveWrapperField(
                                formControlName: _transitPostName,
                                validationMessages: {
                                  "required": (_) => localizations
                                      .translate(i18.common.coreCommonRequired)
                                },
                                builder: (field) => LabeledField(
                                  label: localizations.translate(
                                    i18.transitPost.nameLabel,
                                  ),
                                  isRequired: true,
                                  child: DigitTextFormInput(
                                    onChange: (value) {
                                      setState(() {
                                        form.control(_transitPostName).value =
                                            value;
                                      });
                                    },
                                    errorMessage: field.errorText,
                                    initialValue:
                                        form.control(_transitPostName).value,
                                  ),
                                ),
                              )
                            ]),
                      ],
                    )),
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
      _transitPostType: FormControl<String>(
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
