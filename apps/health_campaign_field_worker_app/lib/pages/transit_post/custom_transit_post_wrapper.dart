import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:transit_post/blocs/transit_post.dart';
import 'package:transit_post/data/repositories/local/user_action.dart';
import 'package:transit_post/utils/extensions/extensions.dart';

import '../../blocs/transit_post/custom_transit_post.dart';

@RoutePage()
class CustomTransitPostWrapperPage extends StatelessWidget {
  const CustomTransitPostWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) {
              return LocationBloc(location: Location())
                ..add(const LoadLocationEvent());
            },
            lazy: false,
          ),
          BlocProvider(
            create: (_) {
              return TransitPostBloc(
                const TransitPostState(),
                userActionLocalRepository:
                    context.read<UserActionLocalRepository>(),
                userActionRemoteRepository:
                    context.repository<UserActionModel, UserActionSearchModel>(
                        context),
              );
            },
            lazy: false,
          ),
          BlocProvider(
            create: (_) {
              return CustomTransitPostBloc(
                const CustomTransitPostState(),
                userActionLocalRepository:
                    context.read<UserActionLocalRepository>(),
                userActionRemoteRepository:
                    context.repository<UserActionModel, UserActionSearchModel>(
                        context),
              );
            },
            lazy: false,
          ),
        ],
        child: const AutoRouter(),
      ),
    );
  }
}
