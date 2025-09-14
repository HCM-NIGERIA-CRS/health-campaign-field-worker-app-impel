import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:digit_ui_components/widgets/atoms/table_cell.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_delivery/models/entities/project_beneficiary.dart';

import 'package:registration_delivery/blocs/search_households/search_households.dart';
import 'package:registration_delivery/models/entities/status.dart';
import 'package:registration_delivery/models/entities/task.dart';
import 'package:registration_delivery/utils/i18_key_constants.dart' as i18;
import '../../blocs/non_compliance/non_compliance_tracking.dart';
import '../../utils/extensions/extensions.dart';
import 'package:registration_delivery/utils/utils.dart';
import 'package:registration_delivery/widgets/beneficiary/beneficiary_card.dart';
import 'package:registration_delivery/widgets/localized.dart';
import '../../utils/i18_key_constants.dart' as i18_local;
import '../../utils/registration_delivery/utils_smc.dart';
import '../../utils/registration_delivery/utils_smc.dart' as util_local;
import '../../utils/utils.dart';
import '../../models/entities/status.dart' as local_status;

class NonComplianceBeneficiaryCard extends LocalizedStatefulWidget {
  final String? status;
  final HouseholdMemberWrapper householdMember;
  final VoidCallback onOpenPressed;
  final Coordinate? currentLocation;

  const NonComplianceBeneficiaryCard({
    super.key,
    super.appLocalizations,
    this.status,
    required this.householdMember,
    required this.onOpenPressed,
    this.currentLocation,
  });

  @override
  State<NonComplianceBeneficiaryCard> createState() =>
      NonComplianceBeneficiaryCardState();
}

class NonComplianceBeneficiaryCardState
    extends LocalizedState<NonComplianceBeneficiaryCard> {
  late HouseholdMemberWrapper householdMember;

  @override
  void initState() {
    householdMember = widget.householdMember;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NonComplianceBeneficiaryCard oldWidget) {
    householdMember = widget.householdMember;
    super.didUpdateWidget(oldWidget);
  }

  bool _isCardExpanded = false;

  bool get isCardExpanded => _isCardExpanded;

  set isCardExpanded(bool value) => setState(() => _isCardExpanded = value);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final distance = widget.currentLocation == null
        ? null
        : calculateDistance(
            widget.currentLocation,
            Coordinate(
              householdMember.household?.address?.latitude,
              householdMember.household?.address?.longitude,
            ),
          );

    final headerList = [
      DigitTableColumn(
        header:
            localizations.translate(i18.beneficiaryDetails.beneficiaryHeader),
        cellValue: 'beneficiary',
        isFrozen: true,
      ),
      DigitTableColumn(
        header:
            localizations.translate(i18.beneficiaryDetails.beneficiaryIdHeader),
        cellValue: 'beneficiaryId',
      ),
      DigitTableColumn(
        header: localizations.translate(i18.beneficiaryDetails.deliveryHeader),
        cellValue: 'delivery',
      ),
      DigitTableColumn(
        header: localizations.translate(i18.individualDetails.ageLabelText),
        cellValue: 'age',
      ),
      DigitTableColumn(
        header: localizations.translate(i18.common.coreCommonGender),
        cellValue: 'gender',
      ),
    ];
    final filteredHeaderList =
        RegistrationDeliverySingleton().beneficiaryType !=
                BeneficiaryType.individual
            ? headerList
                .where((element) => element.cellValue != 'delivery')
                .toList()
            : headerList;
    final currentCycle =
        RegistrationDeliverySingleton().projectType?.cycles?.firstWhereOrNull(
              (e) =>
                  (e.startDate) < DateTime.now().millisecondsSinceEpoch &&
                  (e.endDate) > DateTime.now().millisecondsSinceEpoch,
              // Return null when no matching cycle is found
            );

    final tableData = householdMember.members?.map(
      (e) {
        final projectBeneficiary =
            householdMember.projectBeneficiaries?.where((element) {
          if (RegistrationDeliverySingleton().beneficiaryType ==
              BeneficiaryType.individual) {
            return element.beneficiaryClientReferenceId == e.clientReferenceId;
          } else {
            return element.beneficiaryClientReferenceId ==
                householdMember.household!.clientReferenceId;
          }
        }).toList();

        final taskData = (projectBeneficiary ?? []).isNotEmpty &&
                householdMember.tasks != null
            ? householdMember.tasks
                ?.where((element) =>
                    element.projectBeneficiaryClientReferenceId ==
                    projectBeneficiary?.first.clientReferenceId)
                .toList()
            : null;
        final referralData = (projectBeneficiary ?? []).isNotEmpty
            ? householdMember.referrals
                ?.where((element) =>
                    element.projectBeneficiaryClientReferenceId ==
                    projectBeneficiary?.first.clientReferenceId)
                .toList()
            : null;
        final sideEffects = taskData != null && taskData.isNotEmpty
            ? householdMember.sideEffects
                ?.where((element) =>
                    element.taskClientReferenceId ==
                    taskData.last.clientReferenceId)
                .toList()
            : null;

        final ageInYears = DigitDateUtils.calculateAge(
          e.dateOfBirth != null
              ? DigitDateUtils.getFormattedDateToDateTime(
                    e.dateOfBirth!,
                  ) ??
                  DateTime.now()
              : DateTime.now(),
        ).years;
        final ageInMonths = DigitDateUtils.calculateAge(
          e.dateOfBirth != null
              ? DigitDateUtils.getFormattedDateToDateTime(
                    e.dateOfBirth!,
                  ) ??
                  DateTime.now()
              : DateTime.now(),
        ).months;

        final isNotEligible = !checkEligibilityForAgeAndSideEffect(
          DigitDOBAgeConvertor(
            years: ageInYears,
            months: ageInMonths,
          ),
          RegistrationDeliverySingleton().projectType,
          (taskData ?? []).isNotEmpty ? taskData?.last : null,
          sideEffects,
        );

        final isBeneficiaryRefused = checkIfBeneficiaryRefused(taskData);
        final isBeneficiaryAbsent = checkIfBeneficiaryAbsent(taskData);
        final isBeneficiaryIneligible =
            checkBeneficiaryInEligibleSMC(taskData, context.selectedCycle);
        final isBeneficiaryReferred =
            checkBeneficiaryReferredSMC(taskData, context.selectedCycle);
        final isHead = householdMember.headOfHousehold?.clientReferenceId ==
            e.clientReferenceId;

        final isStatusReset = util_local.checkStatusSMC(taskData, currentCycle);

        final rowTableData = [
          DigitTableData(
            [
              e.name?.givenName ?? '--',
              (e.name?.familyName?.trim().isNotEmpty ?? false)
                  ? e.name?.familyName
                  : null,
            ].whereNotNull().join(' '),
            cellKey: 'beneficiary',
          ),
          DigitTableData(
            e.identifiers!
                    .lastWhereOrNull(
                      (ind) =>
                          ind.identifierType ==
                          IdentifierTypes.uniqueBeneficiaryID.toValue(),
                    )
                    ?.identifierId ??
                '--',
            cellKey: 'beneficiaryId',
          ),
          DigitTableData(
            "",
            cellKey: 'delivery',
            widget: Text(
              isHead
                  ? localizations.translate(
                      i18_local.householdOverView
                          .householdOverViewHouseholderHeadLabel,
                    )
                  : getTableCellText(
                      CustomStatusKeys(
                        isNotEligible,
                        isBeneficiaryRefused,
                        isBeneficiaryReferred,
                        isBeneficiaryIneligible,
                        isBeneficiaryAbsent,
                        isStatusReset,
                      ),
                      taskData,
                    ),
              style: TextStyle(
                color: isHead
                    ? theme.colorScheme.surfaceTint
                    : getTableCellTextColor(
                        isNotEligible: isNotEligible,
                        taskdata: taskData,
                        isBeneficiaryRefused: isBeneficiaryRefused ||
                            isBeneficiaryReferred ||
                            isBeneficiaryAbsent,
                        isBeneficiaryIneligible: isBeneficiaryIneligible,
                        isStatusReset: isStatusReset,
                        theme: theme,
                      ),
              ),
            ),
          ),
          DigitTableData(
            e.dateOfBirth == null
                ? '--'
                : '${DigitDateUtils.calculateAge(
                    DigitDateUtils.getFormattedDateToDateTime(
                          e.dateOfBirth!,
                        ) ??
                        DateTime.now(),
                  ).years} ${localizations.translate(i18.searchBeneficiary.yearsAbbr)} ${DigitDateUtils.calculateAge(
                    DigitDateUtils.getFormattedDateToDateTime(
                          e.dateOfBirth!,
                        ) ??
                        DateTime.now(),
                  ).months} ${localizations.translate(i18.searchBeneficiary.monthsAbbr)}',
            cellKey: 'age',
          ),
          DigitTableData(
            e.gender?.name == null
                ? '--'
                : localizations
                    .translate('CORE_COMMON_${e.gender?.name.toUpperCase()}'),
            cellKey: 'gender',
          ),
        ];

        return DigitTableRow(
          tableRow: RegistrationDeliverySingleton().beneficiaryType !=
                  BeneficiaryType.individual
              ? rowTableData
                  .where((element) => element.cellKey != 'delivery')
                  .toList()
              : rowTableData,
        );
        // rowTableData
      },
    ).toList();

    return DigitCard(
        margin:
            const EdgeInsets.symmetric(horizontal: spacer4, vertical: spacer1),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.8,
                child: BeneficiaryCard(
                  description: [
                    householdMember.household?.address?.doorNo,
                    householdMember.household?.address?.addressLine1,
                    householdMember.household?.address?.addressLine2,
                    householdMember.household?.address?.landmark,
                    householdMember.household?.address?.city,
                    householdMember.household?.address?.pincode,
                  ].whereNotNull().take(2).join(' '),
                  subtitle: distance != null
                      ? '${householdMember.members?.length ?? 1} ${householdMember.members?.length == 1 ? localizations.translate(i18.beneficiaryDetails.householdMemberSingular) : localizations.translate(i18.beneficiaryDetails.householdMemberPlural)}\n${((distance!) * 1000).round() > 999 ? '(${((distance!).round())} km)' : '(${((distance!) * 1000).round()} mts) ${localizations.translate(i18.beneficiaryDetails.fromCurrentLocation)}'}'
                      : '${householdMember.members?.length ?? 1} ${householdMember.members?.length == 1 ? localizations.translate(i18.beneficiaryDetails.householdMemberSingular) : localizations.translate(i18.beneficiaryDetails.householdMemberPlural)}',
                  status: widget.status ?? Constants.statusOptions.first,
                  title: (RegistrationDeliverySingleton().householdType ==
                          HouseholdType.community)
                      ? householdMember.household?.address?.buildingName ??
                          localizations.translate(i18.common.coreCommonNA)
                      : [
                          householdMember.headOfHousehold?.name?.givenName ??
                              localizations.translate(i18.common.coreCommonNA),
                          householdMember.headOfHousehold?.name?.familyName,
                        ].whereNotNull().join(''),
                ),
              ),
              Flexible(
                child: DigitButton(
                  label: localizations.translate(
                      i18_local.common.nonComplianceUpdateStatusLabel),
                  onPressed: widget.onOpenPressed,
                  type: DigitButtonType.secondary,
                  size: DigitButtonSize.small,
                ),
              ),
            ],
          ),
          ...[
            Offstage(
              offstage: !isCardExpanded,
              child: DigitTable(
                enableBorder: true,
                showPagination: false,
                columns: filteredHeaderList,
                rows: tableData ?? [],
              ),
            ),
            SizedBox(
              height: 20,
              child: Center(
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    isCardExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: 24,
                  ),
                  onPressed: () => isCardExpanded = !isCardExpanded,
                ),
              ),
            ),
          ]
        ]);
  }

  String getTableCellText(
    CustomStatusKeys statusKeys,
    List<TaskModel>? taskData,
  ) {
    if (statusKeys.isNotEligible || statusKeys.isBeneficiaryIneligible) {
      return localizations.translate(
          i18.householdOverView.householdOverViewNotEligibleIconLabel);
    } else if (statusKeys.isBeneficiaryReferred) {
      return localizations.translate(Status.beneficiaryReferred.toValue());
    } else if (statusKeys.isBeneficiaryAbsent) {
      return localizations
          .translate(local_status.Status.beneficiaryAbsent.toValue());
    } else if (taskData != null) {
      if (taskData.isEmpty) {
        return localizations.translate(Status.notVisited.toValue());
      } else if (statusKeys.isBeneficiaryRefused && !statusKeys.isStatusReset) {
        return localizations.translate(Status.beneficiaryRefused.toValue());
      } else if (statusKeys.isStatusReset) {
        return localizations.translate(Status.notVisited.toValue());
      } else {
        return localizations.translate(
            i18.householdOverView.householdOverViewDeliveredIconLabel);
      }
    } else {
      return localizations.translate(Status.notVisited.toValue());
    }
  }

  // ignore: long-parameter-list
  Color getTableCellTextColor({
    required bool isNotEligible,
    required List<TaskModel>? taskdata,
    required bool isBeneficiaryRefused,
    required bool isBeneficiaryIneligible,
    required bool isStatusReset,
    required ThemeData theme,
  }) {
    return taskdata != null &&
            taskdata.isNotEmpty &&
            !isBeneficiaryRefused &&
            !isNotEligible &&
            !isBeneficiaryIneligible &&
            !isStatusReset
        ? theme.colorScheme.onSurfaceVariant
        : theme.colorScheme.error;
  }

  getStatus(
      Iterable<TaskModel> tasks,
      List<ProjectBeneficiaryModel> projectBeneficiaries,
      bool isNotEligible,
      bool isBeneficiaryRefused) {
    if (projectBeneficiaries.isNotEmpty) {
      if (tasks.isEmpty) {
        return Status.registered.toValue();
      } else {
        return getTaskStatus(tasks.toList()).toValue();
      }
    } else {
      return Status.notRegistered.toValue();
    }
  }
}

class CustomStatusKeys {
  bool isNotEligible;
  bool isBeneficiaryRefused;
  bool isBeneficiaryReferred;
  bool isBeneficiaryIneligible;
  bool isBeneficiaryAbsent;
  bool isStatusReset;

  CustomStatusKeys(
    this.isNotEligible,
    this.isBeneficiaryRefused,
    this.isBeneficiaryReferred,
    this.isBeneficiaryIneligible,
    this.isBeneficiaryAbsent,
    this.isStatusReset,
  );
}
