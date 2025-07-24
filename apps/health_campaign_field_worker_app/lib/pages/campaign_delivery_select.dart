import 'package:digit_data_model/data/local_store/sql_store/sql_store.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/digit_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/widgets/scrollable_content.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_delivery/utils/utils.dart';

import '../router/app_router.dart';
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/home/home_item_card.dart';
import '../widgets/localized.dart';
import '../widgets/showcase/config/showcase_constants.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/showcase/showcase_wrappers.dart';

@RoutePage()
class CampaignDeliverySelectPage extends LocalizedStatefulWidget {
  const CampaignDeliverySelectPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<CampaignDeliverySelectPage> createState() =>
      CampaignDeliverySelectPageState();
}

class CampaignDeliverySelectPageState
    extends LocalizedState<CampaignDeliverySelectPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mappedItems = _getItems(context);
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    final homeItems = mappedItems?.homeItems ?? [];
    return Scaffold(
        backgroundColor: DigitTheme.instance.colorScheme.surface,
        body: Column(children: [
          Expanded(
            child: ScrollableContent(
              slivers: [
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return homeItems.elementAt(index);
                    },
                    childCount: homeItems.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 145,
                    childAspectRatio: 104 / 128,
                  ),
                ),
              ],
              header: Column(
                children: [
                  const BackNavigationHelpHeaderWidget(
                    showBackNavigation: true,
                    showHelp: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                        kPadding, kPadding * 2, kPadding, kPadding * 2),
                    child: Text(
                      localizations.translate(
                        i18.deliverIntervention.campaignDeliverySelectionLabel,
                      ),
                      style: textTheme.headingXl
                          .copyWith(color: theme.colorTheme.text.primary),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }

  _HomeItemDataModel? _getItems(BuildContext context) {
    List<Widget> homeItemsList = [
      HomeItemCard(
        icon: Icons.family_restroom_rounded,
        label: i18.home.beneficiaryLabel,
        onPressed: () async {
          RegistrationDeliverySingleton()
              .setHouseholdType(HouseholdType.family);
          context.router.push(const CustomRegistrationDeliveryWrapperRoute());
        },
      ),
    ];

    return _HomeItemDataModel(homeItemsList);
  }
}

class _HomeItemDataModel {
  final List<Widget> homeItems;

  const _HomeItemDataModel(this.homeItems);
}
