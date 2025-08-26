import 'package:digit_data_model/data/local_store/sql_store/tables/user_action.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/widgets/atoms/text_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_campaign_field_worker_app/widgets/reports/readonly_pluto_grid.dart';
import 'package:inventory_management/widgets/localized.dart';
import 'package:registration_delivery/widgets/showcase/showcase_wrappers.dart';

import '../../blocs/daily_implementation_plan/daily_implementation_plan.dart';
import '../../router/app_router.dart';
import '../../widgets/custom_back_navigation.dart';
import '../../utils/i18_key_constants.dart' as i18;

@RoutePage()
class SelectSettlementsDateViewPage extends LocalizedStatefulWidget {
  final String clientReferenceId;
  const SelectSettlementsDateViewPage({
    super.key,
    required this.clientReferenceId,
  });

  @override
  State<SelectSettlementsDateViewPage> createState() =>
      _SelectSettlementsDateViewState();
}

class _SelectSettlementsDateViewState
    extends LocalizedState<SelectSettlementsDateViewPage> {
  @override
  void initState() {
    context.read<DailyImplementationPlanBloc>().add(
          DailyImplementationPlanEvent.handleSearch(
              clientReferenceId: widget.clientReferenceId),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: spacer2),
          child: CustomBackNavigationHelpHeaderWidget(
            showHelp: false,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(spacer2),
            child: BlocBuilder<DailyImplementationPlanBloc,
                DailyImplementationPlanState>(
              builder: (context, state) {
                if (state is DailyImplementationPlanSearchState) {
                  UserActionModel? dipUserActionModel =
                      state.dipUserAction?.firstOrNull;
                  List<AdditionalField>?
                      selectedSettlementsDateAdditionalField =
                      dipUserActionModel?.additionalFields?.fields
                          .where((e) => e.key == 'settlements')
                          .toList();
                  Map<String, dynamic> selectedSettlementsDate =
                      selectedSettlementsDateAdditionalField == null
                          ? {}
                          : selectedSettlementsDateAdditionalField.first.value;
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
                      const SizedBox(height: kPadding),
                      Expanded(
                        child: ReadonlyDigitGrid(
                          data: DigitGridData(columns: [
                            DigitGridColumn(
                                key: 'settlements',
                                label: localizations.translate(
                                    i18.dailyImplementationFlow.settlements),
                                width: screenWidth / 2),
                            DigitGridColumn(
                                key: 'dateOfVisit',
                                label: localizations.translate(
                                    i18.dailyImplementationFlow.dateOfVisit),
                                width: screenWidth / 2),
                          ], rows: [
                            for (var key in selectedSettlementsDate.keys)
                              DigitGridRow([
                                DigitGridCell(
                                    key: 'settlements',
                                    value: localizations.translate(key)),
                                DigitGridCell(
                                    key: 'dateOfVisit',
                                    value: localizations.translate(
                                        selectedSettlementsDate[key] ?? ''))
                              ]),
                          ]),
                        ),
                      )
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ],
    );
  }
}
