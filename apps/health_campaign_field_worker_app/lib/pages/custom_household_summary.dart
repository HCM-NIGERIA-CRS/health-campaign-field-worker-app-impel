import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';

import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:registration_delivery/widgets/back_navigation_help_header.dart';

import 'package:registration_delivery/widgets/localized.dart';
import 'package:registration_delivery/utils/i18_key_constants.dart' as i18;
import 'package:registration_delivery/blocs/search_households/search_bloc_common_wrapper.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart';
import 'package:registration_delivery/utils/constants.dart';
import 'package:registration_delivery/utils/utils.dart';

import '../../blocs/registration_delivery/custom_beneficairy_registration.dart';
import '../../router/app_router.dart';
import '../blocs/compliance/consent_household.dart';
import '../utils/extensions/extensions.dart';
import 'registration_delivery/custom_beneficiary_acknowledgement.dart';
import '../../utils/i18_key_constants.dart' as i18_local;

@RoutePage()
class CustomHouseholdSummaryPage extends LocalizedStatefulWidget {
  final String? householdNumber;
  final String? headName;
  final String? reasonNonCompliance;
  final double latitude;
  final double longitude;
  final double locationAccuracy;
  const CustomHouseholdSummaryPage({
    required this.householdNumber,
    required this.headName,
    required this.reasonNonCompliance,
    required this.latitude,
    required this.longitude,
    required this.locationAccuracy,
    super.key,
    super.appLocalizations,
  });

  @override
  State<CustomHouseholdSummaryPage> createState() =>
      CustomHouseholdSummaryPageState();
}

class CustomHouseholdSummaryPageState
    extends LocalizedState<CustomHouseholdSummaryPage> {
  final clickedStatus = ValueNotifier<bool>(false);

  String getLocalizedMessage(String code) {
    return localizations.translate(code);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return PopScope(
      child: Scaffold(
          body: BlocConsumer<CustomBeneficiaryRegistrationBloc,
              BeneficiaryRegistrationState>(
        listener: (context, householdState) {
          final router = context.router;
          householdState.mapOrNull(
            persisted: (value) {
              if (value.navigateToRoot) {
                (router.parent() as StackRouter).maybePop();
              } else {
                router.popUntil((route) =>
                    route.settings.name == SearchBeneficiaryRoute.name);
                context.read<SearchBlocWrapper>().searchHouseholdsBloc.add(
                      SearchHouseholdsEvent.searchByHousehold(
                        householdModel: value.householdModel,
                        projectId: RegistrationDeliverySingleton().projectId!,
                        isProximityEnabled: false,
                      ),
                    );
                router.push(CustomBeneficiaryAcknowledgementRoute(
                  enableViewHousehold: true,
                  acknowledgementType: AcknowledgementType.addHousehold,
                ));
              }
            },
          );
        },
        builder: (context, householdState) {
          return ScrollableContent(
              enableFixedDigitButton: true,
              header: const Column(children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: spacer2),
                  child: BackNavigationHelpHeaderWidget(
                    showHelp: false,
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
                          label: localizations
                              .translate(i18.common.coreCommonSubmit),
                          type: DigitButtonType.primary,
                          size: DigitButtonSize.large,
                          mainAxisSize: MainAxisSize.max,
                          isDisabled: isClicked ? true : false,
                          onPressed: () async {
                            final submit = await showCustomPopup(
                              context: context,
                              builder: (popupContext) => Popup(
                                title: localizations.translate(
                                  i18.deliverIntervention.dialogTitle,
                                ),
                                onOutsideTap: () {
                                  Navigator.of(popupContext).pop(false);
                                },
                                description: localizations.translate(
                                  i18.deliverIntervention.dialogContent,
                                ),
                                type: PopUpType.simple,
                                actions: [
                                  DigitButton(
                                    label: localizations.translate(
                                      i18.common.coreCommonSubmit,
                                    ),
                                    onPressed: () {
                                      Navigator.of(
                                        popupContext,
                                        rootNavigator: true,
                                      ).pop(true);
                                    },
                                    type: DigitButtonType.primary,
                                    size: DigitButtonSize.large,
                                  ),
                                  DigitButton(
                                    label: localizations.translate(
                                      i18.common.coreCommonCancel,
                                    ),
                                    onPressed: () {
                                      Navigator.of(
                                        popupContext,
                                        rootNavigator: true,
                                      ).pop(false);
                                    },
                                    type: DigitButtonType.secondary,
                                    size: DigitButtonSize.large,
                                  ),
                                ],
                              ),
                            ) as bool;

                            if (submit ?? false) {
                              if (context.mounted) {
                                final consentBloc =
                                    context.read<ConsentHouseholdBloc>();

                                final boundary =
                                    RegistrationDeliverySingleton().boundary;
                                final tenantId =
                                    RegistrationDeliverySingleton().tenantId;
                                final projectId =
                                    RegistrationDeliverySingleton().projectId;
                                final beneficiaryType =
                                    (RegistrationDeliverySingleton()
                                                .beneficiaryType ??
                                            context.beneficiaryType)
                                        .toValue();

                                consentBloc
                                    .add(ConsentHouseholdEvent.handleSubmit(
                                  boundary!.code,
                                  boundary!.name,
                                  context.loggedInUserUuid,
                                  tenantId,
                                  projectId,
                                  "",
                                  widget.householdNumber,
                                  beneficiaryType,
                                  widget.headName,
                                  widget.reasonNonCompliance,
                                  false,
                                  latitude: widget.latitude,
                                  longitude: widget.longitude,
                                  locationAccuracy: widget.locationAccuracy,
                                ));
                                Future.delayed(
                                        const Duration(milliseconds: 700))
                                    .then((value) {
                                  context.router.push(
                                      CustomBeneficiaryAcknowledgementRoute(
                                    enableViewHousehold: false,
                                    acknowledgementType:
                                        AcknowledgementType.addHousehold,
                                  ));
                                });
                              }
                            }
                          },
                        );
                      },
                    ),
                  ]),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      DigitCard(
                          margin: const EdgeInsets.all(spacer2),
                          children: [
                            LabelValueSummary(
                                padding: EdgeInsets.zero,
                                heading: localizations.translate(i18_local
                                    .caregiverConsent
                                    .householdSummaryComplianceLabel),
                                headingStyle: textTheme.headingL.copyWith(
                                  color: theme.colorTheme.primary.primary2,
                                ),
                                items: [
                                  LabelValueItem(
                                      label: localizations.translate(i18_local
                                          .householdDetails
                                          .householdNumberLabel),
                                      value: widget.householdNumber ??
                                          localizations.translate(
                                              i18.common.coreCommonNA),
                                      labelFlex: 5,
                                      padding: const EdgeInsets.only(
                                          bottom: spacer2)),
                                  LabelValueItem(
                                      label: localizations.translate(
                                          i18.householdLocation.villageLabel),
                                      value: localizations.translate(
                                          RegistrationDeliverySingleton()
                                                  .boundary
                                                  ?.code ??
                                              i18.common.coreCommonNA),
                                      isInline: true,
                                      labelFlex: 5,
                                      padding: const EdgeInsets.only(
                                          bottom: spacer2)),
                                  LabelValueItem(
                                      label: localizations.translate(
                                          i18.individualDetails.nameLabelText),
                                      value: widget.headName ??
                                          localizations.translate(
                                              i18.common.coreCommonNA),
                                      labelFlex: 5,
                                      padding: const EdgeInsets.only(
                                          bottom: spacer2)),
                                  LabelValueItem(
                                      label: localizations.translate(i18_local
                                          .caregiverConsent
                                          .reasonForNonComplianceLabel),
                                      value: localizations.translate(
                                          widget.reasonNonCompliance ??
                                              i18.common.coreCommonNA),
                                      labelFlex: 5,
                                      padding: const EdgeInsets.only(
                                          bottom: spacer2))
                                ]),
                          ]),
                    ],
                  ),
                )
              ]);
        },
      )),
    );
  }
}
