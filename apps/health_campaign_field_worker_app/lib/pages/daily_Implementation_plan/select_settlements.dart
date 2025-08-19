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
class SelectSettlementsPage extends LocalizedStatefulWidget {
  const SelectSettlementsPage({super.key});

  @override
  State<SelectSettlementsPage> createState() => _SelectSettlementsPageState();
}

class _SelectSettlementsPageState
    extends LocalizedState<SelectSettlementsPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(bottom: spacer2),
        child: CustomBackNavigationHelpHeaderWidget(
          showHelp: false,
        ),
      ),
      DigitTextBlock(
        padding: EdgeInsets.zero,
        heading: localizations
            .translate(i18.dailyImplementationFlow.selectBoundaryLabel),
        headingStyle:
            textTheme.headingXl.copyWith(color: theme.colorTheme.text.primary),
      ),
      ReportDetailsContent(
        title: localizations
            .translate(i18.dailyImplementationFlow.selectBoundaryLabel),
        data: {
          'Settlement 1': 'Day 1',
          'Settlement 2': 'Day 2',
          'Settlement 3': 'Day 3',
        },
      ),
    ]);
  }
}

class ReportDetailsContent extends LocalizedStatefulWidget {
  final String title;
  final Map<String, String> data;

  const ReportDetailsContent({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  State<ReportDetailsContent> createState() => _ReportDetailsContentState();
}

class _ReportDetailsContentState extends LocalizedState<ReportDetailsContent> {
  static const _settlementKey = 'settlement';
  static const _dateOfVisitKey = 'dateOfVisit';
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(spacer2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: spacer4),
            Expanded(
              child: EditableDigitGrid(
                data: DigitGridData(columns: [
                  DigitGridColumn(
                    label: localizations.translate(
                      i18.inventoryReportDetails.dateLabel,
                    ),
                    key: _settlementKey,
                    width: 200,
                  ),
                  DigitGridColumn(
                    label: localizations.translate(
                      i18.inventoryReportDetails.dateLabel,
                    ),
                    key: _dateOfVisitKey,
                    type: PlutoColumnType.select(["Day 1", "Day 2", "Day 3"]),
                    width: 200,
                  ),
                ], rows: [
                  for (var entry in widget.data.keys)
                    DigitGridRow([
                      DigitGridCell(
                        key: _settlementKey,
                        value: entry,
                      ),
                      DigitGridCell(
                        key: _dateOfVisitKey,
                        value: widget.data[entry] ?? '',
                      ),
                    ])
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
