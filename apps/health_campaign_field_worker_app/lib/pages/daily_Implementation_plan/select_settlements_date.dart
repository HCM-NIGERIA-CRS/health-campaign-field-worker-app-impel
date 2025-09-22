import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/component_utils.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/atoms/text_block.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:registration_delivery/utils/utils.dart';

import '../../blocs/daily_implementation_plan/daily_implementation_plan.dart';
import '../../blocs/daily_implementation_plan/dip_search.dart';
import '../../models/settlement/settlement_model.dart';
import '../../router/app_router.dart';
import '../../utils/utils.dart';
import '../../widgets/custom_back_navigation.dart';
import '../../widgets/localized.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/i18_key_constants.dart' as i18_local;

@RoutePage()
class SelectSettlementsDatePage extends LocalizedStatefulWidget {
  const SelectSettlementsDatePage({super.key});

  @override
  State<SelectSettlementsDatePage> createState() =>
      _SelectSettlementsPageState();
}

class _SelectSettlementsPageState
    extends LocalizedState<SelectSettlementsDatePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    return Column(children: [
      const Padding(
        padding: EdgeInsets.only(bottom: spacer2),
        child: CustomBackNavigationHelpHeaderWidget(
          showHelp: false,
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<LocationBloc, LocationState>(
            builder: (context, locationState) {
              double? latitude = locationState.latitude;
              double? longitude = locationState.longitude;
              double? locationAccuracy = locationState.accuracy;
              return BlocConsumer<DailyImplementationPlanBloc,
                  DailyImplementationPlanState>(
                listener: (context, state) {
                  if (state is DailyImplementationPlanCreateState) {
                    var tripBookAction = state.dipUserAction;
                    context.read<DipSearchBloc>().add(DipSearchEvent.search(
                        beneficiaryTag: tripBookAction?.beneficiaryTag));
                    if (tripBookAction == null) return;
                    context.router.popUntilRoot();
                    context.router.push(
                      const SelectSettlementsDateViewRoute(),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is DailyImplementationPlanSelectSettlementsState) {
                    String monthYear =
                        DateFormat('MMM yyyy').format(DateTime.now());
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DigitTextBlock(
                          padding: EdgeInsets.zero,
                          heading: localizations
                              .translate(i18.dailyImplementationFlow.dip),
                          headingStyle: textTheme.headingXl
                              .copyWith(color: theme.colorTheme.text.primary),
                        ),
                        DigitTextBlock(
                          padding: EdgeInsets.zero,
                          heading:
                              "$monthYear ${localizations.translate(i18.dailyImplementationFlow.obrRound)}",
                          headingStyle: textTheme.headingXS
                              .copyWith(color: theme.colorTheme.text.primary),
                        ),
                        const SizedBox(height: spacer2),
                        SettlementGridView(
                          title: localizations.translate(
                              i18.dailyImplementationFlow.selectBoundaryLabel),
                          settlements: state.selectedSettlements ?? [],
                          settlementData: state.settlementData ?? [],
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DigitButton(
                            type: DigitButtonType.primary,
                            size: DigitButtonSize.large,
                            mainAxisSize: MainAxisSize.max,
                            onPressed: () async {
                              for (var element
                                  in state.selectedSettlements ?? []) {
                                if (state.settlementData?.firstWhereOrNull(
                                        (e) => e.boundaryCode == element) ==
                                    null) {
                                  await DigitToast.show(
                                    context,
                                    options: DigitToastOptions(
                                      localizations.translate(i18
                                          .dailyImplementationFlow
                                          .selectDateForAllSettlements),
                                      true,
                                      theme,
                                    ),
                                  );

                                  return;
                                }
                              }
                              final submit = await showCustomPopup(
                                context: context,
                                builder: (popupContext) => Popup(
                                  title: localizations.translate(
                                    i18_local.beneficiaryDetails.dialogTitle,
                                  ),
                                  onOutsideTap: () {
                                    Navigator.of(popupContext).pop(false);
                                  },
                                  description: localizations.translate(
                                    i18_local.beneficiaryDetails.dialogContent,
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
                                var clientReferenceId = IdGen.i.identifier;
                                var startTime =
                                    DateTime.now().millisecondsSinceEpoch;
                                if (latitude == null ||
                                    longitude == null ||
                                    locationAccuracy == null) {
                                  if (context.mounted) {
                                    DigitComponentsUtils.showDialog(
                                      context,
                                      localizations.translate(
                                          i18.common.locationCapturing),
                                      DialogType.inProgress,
                                    );
                                  }
                                  return;
                                }
                                UserActionModel tripBookAction =
                                    UserActionModel(
                                        latitude: latitude,
                                        longitude: longitude,
                                        locationAccuracy: locationAccuracy,
                                        clientReferenceId: clientReferenceId,
                                        beneficiaryTag:
                                            context.loggedInUserUuid,
                                        isSync: true,
                                        timestamp: state.date ?? startTime,
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
                                        action: "DAILY_PLAN",
                                        additionalFields:
                                            UserActionAdditionalFields(
                                                version: 1,
                                                fields: [
                                              if (state.administrativeUnit !=
                                                  null)
                                                AdditionalField(
                                                    Constants.boundaryCode,
                                                    state.administrativeUnit),
                                              if (state.wfpSupervisor != null)
                                                AdditionalField(
                                                    Constants.supervisorName,
                                                    state.wfpSupervisor),
                                              if (state.settlementData != null)
                                                AdditionalField(
                                                    Constants.data,
                                                    json.encode(state
                                                        .settlementData!
                                                        .map((e) => json
                                                            .encode(e.toJson()))
                                                        .toList())),
                                            ]));

                                context.read<DailyImplementationPlanBloc>().add(
                                      DailyImplementationPlanEvent.handleCreate(
                                        dipUserAction: tripBookAction,
                                      ),
                                    );
                              }
                            },
                            label: localizations
                                .translate(i18.common.coreCommonFinish),
                          ),
                        ),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              );
            },
          ),
        ),
      ),
    ]);
  }
}

class SettlementGridView extends LocalizedStatefulWidget {
  final String title;
  final List<String> settlements;
  final List<SettlementModel> settlementData;

  const SettlementGridView({
    super.key,
    required this.title,
    required this.settlements,
    required this.settlementData,
  });

  @override
  State<SettlementGridView> createState() => _ReportDetailsContentState();
}

class _ReportDetailsContentState extends LocalizedState<SettlementGridView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SettlementTitleRow(
              settlementTitle: localizations
                  .translate(i18.dailyImplementationFlow.settlements),
              dateOfVisitTitle: localizations
                  .translate(i18.dailyImplementationFlow.dateOfVisit)),
          const SizedBox(height: 1),
          Expanded(
            child: ListView.separated(
              itemCount: widget.settlements.length,
              itemBuilder: (context, index) {
                return SettlementRow(
                  key: ValueKey(index),
                  settlementCode: widget.settlements[index],
                  settlementData: widget.settlementData.firstWhereOrNull(
                      (e) => e.boundaryCode == widget.settlements[index]),
                  onSelectDate: (value) {
                    context.read<DailyImplementationPlanBloc>().add(
                            DailyImplementationPlanEvent
                                .handleSelectSettlementsDate(settlementData: [
                          SettlementModel(
                              boundaryCode: widget.settlements[index],
                              dayOfVisit: value.name)
                        ]));
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 0);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SettlementTitleRow extends StatelessWidget {
  final String settlementTitle;
  final String dateOfVisitTitle;
  const SettlementTitleRow(
      {super.key,
      required this.settlementTitle,
      required this.dateOfVisitTitle});

  @override
  Widget build(BuildContext context) {
    var cellDecoration = const BoxDecoration(
      color: Colors.white,
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
            child: Container(
          decoration: cellDecoration,
          height: 40,
          child: Center(child: Text(settlementTitle)),
        )),
        const SizedBox(width: 1),
        Expanded(
            child: Container(
          decoration: cellDecoration,
          height: 40,
          child: Center(child: Text(dateOfVisitTitle)),
        )),
      ],
    );
  }
}

class SettlementRow extends StatefulWidget {
  final String settlementCode;
  final SettlementModel? settlementData;
  final Function(DropdownItem) onSelectDate;
  const SettlementRow({
    super.key,
    required this.onSelectDate,
    required this.settlementCode,
    required this.settlementData,
  });

  @override
  State<SettlementRow> createState() => _SettlementRowState();
}

class _SettlementRowState extends State<SettlementRow> {
  Map<String, String> allDates = {
    'day1': 'Day 1',
    'day2': 'Day 2',
    'day3': 'Day 3',
    'day4': 'Day 4',
  };
  DropdownItem? selectedOption;

  @override
  Widget build(BuildContext context) {
    var cellDecoration = const BoxDecoration(
      color: Colors.white,
    );

    selectedOption = widget.settlementData == null
        ? null
        : DropdownItem(
            code: widget.settlementData!.dayOfVisit,
            name: widget.settlementData!.dayOfVisit);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
            child: Container(
          decoration: cellDecoration,
          height: 40,
          child: Center(child: Text(widget.settlementCode)),
        )),
        const SizedBox(width: 1),
        Expanded(
            child: Container(
          decoration: cellDecoration,
          height: 40,
          child: Center(
            child: DigitDropdown(
              selectedOption: selectedOption,
              items: [
                for (var date in allDates.keys)
                  DropdownItem(code: date, name: allDates[date]!),
              ],
              onSelect: (value) {
                widget.onSelectDate(value);
              },
            ),
          ),
        )),
      ],
    );
  }
}
