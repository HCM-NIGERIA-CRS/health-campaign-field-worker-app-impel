import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/widgets/localized.dart';

import '../../blocs/daily_implementation_plan/daily_implementation_plan.dart';
import '../../blocs/daily_implementation_plan/dip_all_search.dart';
import '../../router/app_router.dart';
import '../../utils/constants.dart';
import '../../widgets/custom_back_navigation.dart';
import '../../utils/i18_key_constants.dart' as i18_local;

@RoutePage()
class SelectSettlementsDateViewListPage extends LocalizedStatefulWidget {
  const SelectSettlementsDateViewListPage({
    super.key,
  });

  @override
  State<SelectSettlementsDateViewListPage> createState() =>
      _SelectSettlementsDateViewListPageState();
}

class _SelectSettlementsDateViewListPageState
    extends LocalizedState<SelectSettlementsDateViewListPage> {
  @override
  void initState() {
    context.read<DipAllSearchBloc>().add(
          const DipAllSearchEvent.search(
            userAction: 'DAILY_PLAN',
          ),
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
            child: BlocBuilder<DipAllSearchBloc, DipAllSearchState>(
                builder: (context, state) {
              if (state is DipAllSearchSettlementState) {
                List<UserActionModel>? dipUserActionModelList =
                    state.allDipUserAction;
                if (dipUserActionModelList != null &&
                    dipUserActionModelList.isNotEmpty) {
                  return ListView.builder(
                      itemCount: dipUserActionModelList.length,
                      itemBuilder: (context, index) {
                        UserActionModel dipUserActionModel =
                            dipUserActionModelList[index];
                        List<AdditionalField>? dipUserActionAdditionalField =
                            dipUserActionModel.additionalFields?.fields;

                        DateTime date = DateTime.fromMillisecondsSinceEpoch(
                            dipUserActionModel.timestamp);
                        String wfpSupervisor = dipUserActionAdditionalField
                                ?.firstWhere(
                                  (e) => e.key == Constants.supervisorName,
                                  orElse: () => const AdditionalField(
                                      Constants.supervisorName, ''),
                                )
                                .value ??
                            '';

                        return InkWell(
                          onTap: () {
                            context.router.push(SelectSettlementsDateViewRoute(
                                clientReferenceId:
                                    dipUserActionModel.clientReferenceId));
                          },
                          child: DigitCard(
                            margin:
                                const EdgeInsets.symmetric(vertical: spacer1),
                            children: [
                              Text(
                                date.toString(),
                                style: textTheme.bodyL,
                              ),
                              Text(
                                wfpSupervisor,
                                style: textTheme.bodyL,
                              ),
                              Text(dipUserActionModel.clientReferenceId),
                            ],
                          ),
                        );
                      });
                } else {
                  return Center(
                    child: Text(
                      localizations.translate(i18_local.dailyImplementationFlow
                          .no_daily_implementation_plan_found),
                      style: textTheme.bodyL,
                    ),
                  );
                }
              }
              return const SizedBox.shrink();
            }),
          ),
        ),
      ],
    );
  }
}
