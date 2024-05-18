import 'package:flutter/material.dart';
import 'package:transjo/core/utils/tools.dart';
import 'package:transjo/presentation/blocs/routs/routs_bloc.dart';
import 'package:transjo/presentation/screens/routes_details/routes_details_view.dart';

import 'home_content.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RoutsBloc, RoutsState>(
      listener: (context, state) {
        if (state is RoutsGetByIdSuccessState) {
          navigateTo(
            context,
            RoutesDetailsView(
              route: state.routs,
            ),
          );
        }
      },
      child: Scaffold(
        body: HomeContent(),
      ),
    );
  }
}
