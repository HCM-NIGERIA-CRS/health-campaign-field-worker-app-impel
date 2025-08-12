import 'package:flutter/material.dart';

import '../../router/app_router.dart';
import '../../widgets/localized.dart';

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
    return const Placeholder();
  }
}
