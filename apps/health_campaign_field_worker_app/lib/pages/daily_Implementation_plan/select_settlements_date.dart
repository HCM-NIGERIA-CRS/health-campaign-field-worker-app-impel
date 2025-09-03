import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:digit_data_model/utils/utils.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/component_utils.dart';
import 'package:digit_ui_components/widgets/atoms/text_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_delivery/utils/utils.dart';

import '../../blocs/daily_implementation_plan/daily_implementation_plan.dart';
import '../../blocs/daily_implementation_plan/dip_search.dart';
import '../../models/settlement/settlement_model.dart';
import '../../router/app_router.dart';
import '../../utils/utils.dart';
import '../../widgets/custom_back_navigation.dart';
import '../../widgets/localized.dart';
import '../../utils/i18_key_constants.dart' as i18;

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
                        clientReferenceId: tripBookAction?.clientReferenceId));
                    context.router.pushAndPopUntil(
                        const SelectSettlementsDateViewRoute(),
                        predicate: (route) =>
                            route.settings.name == HomeRoute.name);
                  }
                },
                builder: (context, state) {
                  if (state is DailyImplementationPlanSelectSettlementsState) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DigitTextBlock(
                          padding: EdgeInsets.zero,
                          heading:
                              "Team 1 ${localizations.translate(i18.dailyImplementationFlow.dip)}",
                          headingStyle: textTheme.headingXl
                              .copyWith(color: theme.colorTheme.text.primary),
                        ),
                        DigitTextBlock(
                          padding: EdgeInsets.zero,
                          heading:
                              "May 2024 ${localizations.translate(i18.dailyImplementationFlow.obrRound)}",
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
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DigitButton(
                            type: DigitButtonType.primary,
                            size: DigitButtonSize.large,
                            mainAxisSize: MainAxisSize.max,
                            onPressed: () {
                              for (var element
                                  in state.selectedSettlements ?? []) {
                                if (state.settlementData?.firstWhereOrNull(
                                        (e) => e.boundaryCode == element) ==
                                    null) {
                                  DigitComponentsUtils.showDialog(
                                    context,
                                    localizations.translate(i18
                                        .dailyImplementationFlow
                                        .selectDateForAllSettlements),
                                    DialogType.failed,
                                  );
                                  return;
                                }
                              }
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
                              UserActionModel tripBookAction = UserActionModel(
                                  latitude: latitude,
                                  longitude: longitude,
                                  locationAccuracy: locationAccuracy,
                                  clientReferenceId: clientReferenceId,
                                  isSync: true,
                                  timestamp: state.date ?? startTime,
                                  tenantId:
                                      RegistrationDeliverySingleton().tenantId,
                                  projectId: RegistrationDeliverySingleton()
                                      .projectId!,
                                  boundaryCode: RegistrationDeliverySingleton()
                                          .boundary
                                          ?.code! ??
                                      "",
                                  action: "DAILY_PLAN",
                                  additionalFields: UserActionAdditionalFields(
                                      version: 1,
                                      fields: [
                                        if (state.administrativeUnit != null)
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
                                              state.settlementData!
                                                  .map((e) => e.toJson())
                                                  .toList()),
                                      ]));

                              context.read<DailyImplementationPlanBloc>().add(
                                    DailyImplementationPlanEvent.handleCreate(
                                      dipUserAction: tripBookAction,
                                    ),
                                  );
                            },
                            label: localizations
                                .translate(i18.common.coreCommonSubmit),
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
  static const _settlementKey = 'settlement';
  static const _dateOfVisitKey = 'dateOfVisit';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SettlementTitleRow(
              settlementKey: _settlementKey, settlementValue: _dateOfVisitKey),
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
  final String settlementKey;
  final String settlementValue;
  const SettlementTitleRow(
      {super.key, required this.settlementKey, required this.settlementValue});

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
          child: Center(child: Text(settlementKey)),
        )),
        const SizedBox(width: 1),
        Expanded(
            child: Container(
          decoration: cellDecoration,
          height: 40,
          child: Center(child: Text(settlementValue)),
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
