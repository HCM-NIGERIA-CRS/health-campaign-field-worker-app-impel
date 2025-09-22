import 'dart:convert';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/atoms/text_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_campaign_field_worker_app/widgets/reports/readonly_pluto_grid.dart';
import 'package:intl/intl.dart';
import 'package:inventory_management/widgets/localized.dart';
import 'package:registration_delivery/widgets/showcase/showcase_wrappers.dart';

import '../../blocs/daily_implementation_plan/dip_search.dart';
import '../../models/settlement/settlement_model.dart';
import '../../router/app_router.dart';
import '../../widgets/custom_back_navigation.dart';
import '../../utils/i18_key_constants.dart' as i18;

@RoutePage()
class SelectSettlementsDateViewPage extends LocalizedStatefulWidget {
  const SelectSettlementsDateViewPage({
    super.key,
  });

  @override
  State<SelectSettlementsDateViewPage> createState() =>
      _SelectSettlementsDateViewState();
}

class _SelectSettlementsDateViewState
    extends LocalizedState<SelectSettlementsDateViewPage> {
  @override
  void initState() {
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
            child: BlocBuilder<DipSearchBloc, DipSearchState>(
              builder: (context, state) {
                if (state is DipSearchSettlementState) {
                  UserActionModel? dipUserActionModel =
                      state.selectedDipUserAction;
                  List<AdditionalField>?
                      selectedSettlementsDateAdditionalField =
                      dipUserActionModel?.additionalFields?.fields
                          .where((e) => e.key == 'Data')
                          .toList();
                  List<dynamic> settlementsData =
                      selectedSettlementsDateAdditionalField == null
                          ? []
                          : json
                                  .decode(selectedSettlementsDateAdditionalField
                                      .first.value)
                                  .map((e) {
                                return SettlementModel.fromJson(json.decode(e));
                              }).toList() ??
                              [];

                  // commented as per the requirement change

                  // DateTime? date = dipUserActionModel == null
                  //     ? null
                  //     : DateTime.fromMillisecondsSinceEpoch(
                  //         dipUserActionModel.timestamp);
                  // String monthYear =
                  //     date == null ? '' : DateFormat('MMM yyyy').format(date);

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
                      // DigitTextBlock(
                      //   padding: EdgeInsets.zero,
                      //   heading:
                      //       "$monthYear ${localizations.translate(i18.dailyImplementationFlow.obrRound)}",
                      //   headingStyle: textTheme.headingXS
                      //       .copyWith(color: theme.colorTheme.text.primary),
                      // ),
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
                            for (var settlement in settlementsData)
                              DigitGridRow([
                                DigitGridCell(
                                    key: 'settlements',
                                    value: localizations
                                        .translate(settlement.boundaryCode)),
                                DigitGridCell(
                                    key: 'dateOfVisit',
                                    value: localizations
                                        .translate(settlement.dayOfVisit))
                              ]),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DigitButton(
                          type: DigitButtonType.primary,
                          size: DigitButtonSize.large,
                          mainAxisSize: MainAxisSize.max,
                          onPressed: () async {
                            context.router.maybePop();
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
            ),
          ),
        ),
      ],
    );
  }
}
