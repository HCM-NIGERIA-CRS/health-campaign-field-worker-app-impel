import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_delivery/blocs/app_localization.dart';
import 'package:registration_delivery/blocs/household_overview/household_overview.dart';
import 'package:registration_delivery/models/entities/project_beneficiary.dart';
import 'package:registration_delivery/models/entities/side_effect.dart';
import 'package:registration_delivery/models/entities/status.dart';
import 'package:registration_delivery/models/entities/task.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:registration_delivery/utils/i18_key_constants.dart' as i18;
import '../../blocs/localization/app_localization.dart';

import '../../router/app_router.dart';
import '../../utils/app_enums.dart';
import '../../utils/registration_delivery/utils_smc.dart';
import '../../utils/utils.dart';
import '../action_card/action_card.dart';

import '../../utils/i18_key_constants.dart' as i18_local;

import '../../models/entities/additional_fields_type.dart'
    as additional_fields_local;

import '../../models/entities/status.dart' as local_status;

class CustomMemberCard extends StatelessWidget {
  final List<ProductVariantModel> variant;
  final String name;
  final String? gender;
  final int? years;
  final int? months;
  final bool isHead;
  final IndividualModel individual;
  final List<ProjectBeneficiaryModel>? projectBeneficiaries;
  final bool isDelivered;

  final VoidCallback setAsHeadAction;
  final VoidCallback editMemberAction;
  final VoidCallback deleteMemberAction;
  final RegistrationDeliveryLocalization localizations;
  final List<TaskModel>? tasks;
  final List<SideEffectModel>? sideEffects;
  final bool isNotEligibleSMC;
  final bool isBeneficiaryRefused;
  final bool isBeneficiaryIneligible;
  final bool isBeneficiaryReferred;
  final bool isBeneficiaryAbsent;
  final String? projectBeneficiaryClientReferenceId;

  const CustomMemberCard({
    super.key,
    required this.individual,
    required this.projectBeneficiaries,
    required this.name,
    this.gender,
    required this.years,
    this.isHead = false,
    this.months = 0,
    required this.localizations,
    required this.isDelivered,
    required this.setAsHeadAction,
    required this.editMemberAction,
    required this.deleteMemberAction,
    this.tasks,
    this.isNotEligibleSMC = false,
    this.projectBeneficiaryClientReferenceId,
    this.isBeneficiaryRefused = false,
    this.isBeneficiaryIneligible = false,
    this.isBeneficiaryReferred = false,
    this.isBeneficiaryAbsent = false,
    this.sideEffects,
    required this.variant,
  });

  Widget statusWidget(BuildContext context) {
    bool isBeneficiaryReferredSMC =
        checkBeneficiaryReferredSMC(tasks, context.selectedCycle);

    bool isBeneficiaryInEligibleSMC =
        checkBeneficiaryInEligibleSMC(tasks, context.selectedCycle);

    final theme = Theme.of(context);
    if (isHead && !isDelivered) {
      return Align(
        alignment: Alignment.centerLeft,
        child: DigitIconButton(
          icon: Icons.info_rounded,
          iconSize: 20,
          iconText: localizations.translate(Status.notVisited.toValue()),
          iconTextColor: theme.colorScheme.error,
          iconColor: theme.colorScheme.error,
        ),
      );
    }
    if ((isDelivered ||
        isBeneficiaryReferredSMC ||
        isBeneficiaryInEligibleSMC)) {
      return Column(
        children: [
          if (isDelivered ||
              isBeneficiaryReferredSMC ||
              isBeneficiaryInEligibleSMC)
            Align(
              alignment: Alignment.centerLeft,
              child: DigitIconButton(
                icon: Icons.check_circle,
                iconText: localizations.translate(
                  isBeneficiaryInEligibleSMC
                      ? i18.householdOverView
                          .householdOverViewNotEligibleIconLabel
                      : isBeneficiaryReferredSMC
                          ? i18.householdOverView
                              .householdOverViewBeneficiaryReferredLabel
                          : i18.householdOverView
                              .householdOverViewDeliveredIconLabel,
                ),
                iconSize: 20,
                iconTextColor:
                    (isBeneficiaryReferredSMC || isBeneficiaryInEligibleSMC)
                        ? DigitTheme.instance.colorScheme.error
                        : DigitTheme.instance.colorScheme.onSurfaceVariant,
                iconColor:
                    (isBeneficiaryReferredSMC || isBeneficiaryInEligibleSMC)
                        ? DigitTheme.instance.colorScheme.error
                        : DigitTheme.instance.colorScheme.onSurfaceVariant,
              ),
            ),
        ],
      );
    } else if (isNotEligibleSMC || isBeneficiaryIneligible) {
      return Column(
        children: [
          if (isHead || isNotEligibleSMC || isBeneficiaryIneligible)
            Align(
              alignment: Alignment.centerLeft,
              child: DigitIconButton(
                icon: Icons.info_rounded,
                iconSize: 20,
                iconText: localizations.translate(
                    (isNotEligibleSMC || isBeneficiaryIneligible)
                        ? i18.householdOverView
                            .householdOverViewNotEligibleIconLabel
                        : ""),
                iconTextColor: theme.colorScheme.error,
                iconColor: theme.colorScheme.error,
              ),
            ),
        ],
      );
    } else if (isBeneficiaryAbsent) {
      return Align(
          alignment: Alignment.centerLeft,
          child: DigitIconButton(
            icon: Icons.info_rounded,
            iconSize: 20,
            iconText: localizations
                .translate(local_status.Status.beneficiaryAbsent.toValue()),
            iconTextColor: theme.colorScheme.error,
            iconColor: theme.colorScheme.error,
          ));
    } else if (isBeneficiaryRefused) {
      return Align(
          alignment: Alignment.centerLeft,
          child: DigitIconButton(
            icon: Icons.info_rounded,
            iconSize: 20,
            iconText:
                localizations.translate(Status.beneficiaryRefused.toValue()),
            iconTextColor: theme.colorScheme.error,
            iconColor: theme.colorScheme.error,
          ));
    } else if (!isDelivered) {
      return Align(
        alignment: Alignment.centerLeft,
        child: DigitIconButton(
          icon: Icons.info_rounded,
          iconSize: 20,
          iconText: localizations.translate(Status.notVisited.toValue()),
          iconTextColor: theme.colorScheme.error,
          iconColor: theme.colorScheme.error,
        ),
      );
    } else {
      return Container();
    }
  }

  Widget actionButton(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    final doseStatus = checkStatusSMC(tasks, context.selectedCycle);
    bool smcAssessmentPendingStatus =
        assessmentSMCPending(tasks, context.selectedCycle);

    bool isBeneficiaryReferredSMC =
        checkBeneficiaryReferredSMC(tasks, context.selectedCycle);

    bool isBeneficiaryInEligibleSMC =
        checkBeneficiaryInEligibleSMC(tasks, context.selectedCycle);

    if ((isNotEligibleSMC || isBeneficiaryIneligible) && !doseStatus) {
      return const Offstage();
    }
    // todo add a condition to check if already delivered
    if (isHead) {
      return DigitElevatedButton(
        child: Center(
          child: Text(
            localizations.translate(i18_local
                .householdOverView.householdOverViewAdministerHeadText),
            style: textTheme.headingM.copyWith(color: Colors.white),
          ),
        ),
        onPressed: () async {
          final bloc = context.read<HouseholdOverviewBloc>();
          bloc.add(
            HouseholdOverviewEvent.selectedIndividual(
              individualModel: individual,
            ),
          );

          context.router.push(
            CustomBeneficiaryDetailsHeadRoute(
              isHead: true,
              individualSelected: individual,
              eligibilityAssessmentType: EligibilityAssessmentType.smc,
            ),
          );
        },
      );
    }
    if (isNotEligibleSMC) {
      return const Offstage();
    }
    return Column(
      children: [
        if (smcAssessmentPendingStatus &&
            !isBeneficiaryReferredSMC &&
            !isBeneficiaryInEligibleSMC)
          DigitElevatedButton(
            child: Center(
              child: Text(
                localizations.translate(
                  isBeneficiaryAbsent
                      ? i18_local
                          .householdOverView.householdOverViewRevisitAbsentText
                      : i18_local.householdOverView
                          .householdOverViewSMCAssessmentActionText,
                ),
                style: textTheme.headingM.copyWith(color: Colors.white),
              ),
            ),
            onPressed: () async {
              final bloc = context.read<HouseholdOverviewBloc>();
              bloc.add(
                HouseholdOverviewEvent.selectedIndividual(
                  individualModel: individual,
                ),
              );

              context.router.push(
                CustomBeneficiaryDetailsRoute(
                  individualSelected: individual,
                  eligibilityAssessmentType: EligibilityAssessmentType.smc,
                ),
              );
            },
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final beneficiaryType = context.beneficiaryType;
    final textTheme = theme.digitTextTheme(context);

    return Container(
      decoration: BoxDecoration(
        color: DigitTheme.instance.colorScheme.background,
        border: Border.all(
          color: DigitTheme.instance.colorScheme.outline,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      margin: DigitTheme.instance.containerMargin,
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (individual.identifiers != null)
                    if (individual.identifiers!
                            .lastWhereOrNull(
                              (e) =>
                                  e.identifierType ==
                                  IdentifierTypes.uniqueBeneficiaryID.toValue(),
                            )
                            ?.identifierId !=
                        null)
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(spacer1),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: theme.colorTheme.text.disabled,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(spacer2),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(spacer1),
                                child: Text(
                                  formatBeneficiaryId(individual.identifiers
                                          ?.lastWhereOrNull(
                                            (e) =>
                                                e.identifierType ==
                                                IdentifierTypes
                                                    .uniqueBeneficiaryID
                                                    .toValue(),
                                          )
                                          ?.identifierId) ??
                                      localizations
                                          .translate(i18.common.noResultsFound),
                                  style: textTheme.headingXS.copyWith(
                                      color: theme.colorTheme.primary.primary2),
                                ),
                              ),
                            ),
                          )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: kPadding,
                            top: kPadding,
                          ),
                          child: Text(
                            name,
                            style: theme.textTheme.headlineMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ((tasks ?? [])
                              .where(
                                (element) =>
                                    element.status ==
                                    Status.administeredSuccess.toValue(),
                              )
                              .lastOrNull ==
                          null &&
                      !isDelivered &&
                      !isBeneficiaryIneligible &&
                      !isBeneficiaryReferred &&
                      !isBeneficiaryAbsent)
                  ? Positioned(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: DigitIconButton(
                          onPressed: () => DigitActionDialog.show(
                            context,
                            widget: ActionCard(
                              items: [
                                ActionCardModel(
                                  icon: Icons.edit,
                                  label: localizations.translate(
                                    i18.memberCard.editIndividualDetails,
                                  ),
                                  action: editMemberAction,
                                ),
                              ],
                            ),
                          ),
                          iconText: localizations.translate(
                            i18.memberCard.editDetails,
                          ),
                          icon: Icons.edit,
                        ),
                      ),
                    )
                  : const Offstage(),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.8,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: DigitTheme.instance.containerMargin,
                  child: Text(
                    gender != null
                        ? localizations
                            .translate('CORE_COMMON_${gender?.toUpperCase()}')
                        : ' - ',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                Expanded(
                  child: Text(
                    " | $years ${localizations.translate(i18.memberCard.deliverDetailsYearText)} $months ${localizations.translate(i18.memberCard.deliverDetailsMonthsText)}",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: kPadding / 2,
            ),
            child: Offstage(
              offstage: beneficiaryType != BeneficiaryType.individual,
              child: statusWidget(context),
            ),
          ),
          Offstage(
            offstage: beneficiaryType != BeneficiaryType.individual,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  actionButton(context),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
