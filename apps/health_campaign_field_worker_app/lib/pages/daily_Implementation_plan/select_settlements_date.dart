import 'dart:math';

import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/widgets/atoms/text_block.dart';
import 'package:digit_ui_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../blocs/localization/app_localization.dart';
import '../../router/app_router.dart';
import '../../widgets/custom_back_navigation.dart';
import '../../widgets/localized.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/reports/editable_pluto_grid.dart';

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
          child: Column(
            children: [
              DigitTextBlock(
                padding: EdgeInsets.zero,
                heading: localizations
                    .translate(i18.dailyImplementationFlow.selectBoundaryLabel),
                headingStyle: textTheme.headingXl
                    .copyWith(color: theme.colorTheme.text.primary),
              ),
              const SizedBox(height: spacer2),
              SettlementGridView(
                title: localizations
                    .translate(i18.dailyImplementationFlow.selectBoundaryLabel),
                settlements: [
                  'Settlement 1',
                  'Settlement 2',
                  'Settlement 3',
                  'Settlement 4',
                  'Settlement 5',
                  'Settlement 6'
                ],
                allDates: {
                  'day1': 'Day 1',
                  'day2': 'Day 2',
                  'day3': 'Day 3',
                  'day4': 'Day 4',
                  'day5': 'Day 5',
                  'day6': 'Day 6',
                },
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}

class SettlementGridView extends LocalizedStatefulWidget {
  final String title;
  final List<String> settlements;
  final Map<String, String> allDates;

  const SettlementGridView({
    super.key,
    required this.title,
    required this.settlements,
    required this.allDates,
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
                  key: ValueKey(widget.settlements[index]),
                  settlement: widget.settlements[index],
                  selectedDate: 'day${index + 1}',
                  allDates: widget.allDates,
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

class SettlementRow extends StatelessWidget {
  final String settlement;
  final String selectedDate;
  final Map<String, String> allDates;
  const SettlementRow(
      {super.key,
      required this.settlement,
      required this.selectedDate,
      required this.allDates});

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
          child: Center(child: Text(settlement)),
        )),
        const SizedBox(width: 1),
        Expanded(
            child: Container(
          decoration: cellDecoration,
          height: 40,
          child: Center(
              child: DigitDropdown(
            selectedOption: DropdownItem(
                code: selectedDate, name: allDates[selectedDate] ?? ""),
            items: [
              for (var date in allDates.keys)
                DropdownItem(code: date, name: allDates[date]!),
            ],
            onSelect: (value) {},
          )),
        )),
      ],
    );
  }
}
