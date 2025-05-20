import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data/local_store/sql_store/tables/individual.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_delivery/registration_delivery.dart';

import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:registration_delivery/utils/i18_key_constants.dart' as i18;
import 'package:registration_delivery/widgets/localized.dart';
import '../../../blocs/registration_delivery/custom_search_household.dart';
import '../../../models/entities/identifier_types.dart';
import '../../../utils/i18_key_constants.dart' as i18_local;
import 'package:registration_delivery/blocs/search_households/search_households.dart'
    as registration_delivery;
import 'package:collection/collection.dart';

import '../../../utils/app_enums.dart';
import '../../../widgets/digit_ui_component/custom_panel_card.dart';

@RoutePage()
class CustomHouseholdAcknowledgementPage extends LocalizedStatefulWidget {
  final bool? enableViewHousehold;
  final EligibilityAssessmentType eligibilityAssessmentType;
  final bool? isAddChild;

  const CustomHouseholdAcknowledgementPage({
    super.key,
    super.appLocalizations,
    this.enableViewHousehold,
    this.isAddChild,
    required this.eligibilityAssessmentType,
  });

  @override
  State<CustomHouseholdAcknowledgementPage> createState() =>
      CustomHouseholdAcknowledgementPageState();
}

class CustomHouseholdAcknowledgementPageState
    extends LocalizedState<CustomHouseholdAcknowledgementPage> {
  Map<String, String>? subtitleMap({
    required bool isAddChild,
    required registration_delivery.HouseholdMemberWrapper? householdMember,
  }) {
    if (!isAddChild) return null;

    final beneficiary = householdMember?.members?.lastOrNull;
    final beneficiaryId = beneficiary?.identifiers
        ?.lastWhereOrNull(
          (e) =>
              e.identifierType == IdentifierTypes.uniqueBeneficiaryID.toValue(),
        )
        ?.identifierId;

    final name = beneficiary?.name?.givenName;

    if (beneficiaryId == null || name == null) return null;

    return {
      'id': name,
      'value': beneficiaryId,
    };
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
          builder: (context, householdState) {
            String beneficiaryId = householdState
                    .selectedIndividual?.identifiers
                    ?.lastWhereOrNull((e) =>
                        e.identifierType ==
                        IdentifierTypes.uniqueBeneficiaryID.toValue())
                    ?.identifierId ??
                "";
            String name =
                householdState.selectedIndividual?.name?.givenName ?? "";
            return Padding(
              padding: const EdgeInsets.all(spacer2),
              child: CustomPanelCard(
                type: PanelType.success,
                description: localizations.translate(
                  i18.acknowledgementSuccess.acknowledgementDescriptionText,
                ),
                subTitle: subtitleMap(
                  isAddChild: widget.isAddChild ?? false,
                  householdMember: householdState.householdMemberWrapper,
                ),
                title: localizations.translate(
                  i18.acknowledgementSuccess.acknowledgementLabelText,
                ),
                actions: [
                  DigitButton(
                      label: (widget?.isAddChild ?? false)
                          ? localizations.translate(
                              i18_local.householdDetails.treatNextChildAction,
                            )
                          : localizations.translate(
                              i18.householdDetails.viewHouseHoldDetailsAction,
                            ),
                      isDisabled: !(widget.enableViewHousehold ?? false),
                      onPressed: () {
                        final wrapper = context
                            .read<HouseholdOverviewBloc>()
                            .state
                            .householdMemberWrapper;

                        context.router.popAndPush(
                          BeneficiaryWrapperRoute(wrapper: wrapper),
                        );
                      },
                      type: DigitButtonType.primary,
                      size: DigitButtonSize.large),
                  if (widget?.isAddChild ?? true)
                    DigitButton(
                        label: localizations.translate(
                            i18.acknowledgementSuccess.actionLabelText),
                        onPressed: () {
                          context
                              .read<CustomSearchHouseholdsBloc>()
                              .add(const CustomSearchHouseholdsEvent.clear());
                          final parent = context.router.parent() as StackRouter;
                          // Pop twice to navigate back to the previous screen
                          parent.popUntilRoot();
                        },
                        type: DigitButtonType.secondary,
                        size: DigitButtonSize.large),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
