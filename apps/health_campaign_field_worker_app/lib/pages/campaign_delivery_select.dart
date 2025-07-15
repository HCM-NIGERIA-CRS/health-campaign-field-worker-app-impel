import 'package:flutter/material.dart';

import '../router/app_router.dart';
import '../widgets/localized.dart';

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
    return const Text("TESTING");
  }
}
