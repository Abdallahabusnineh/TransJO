import 'package:flutter/material.dart';
import 'package:transjo/core/utils/tools.dart';
import 'package:transjo/presentation/screens/home/home_view.dart';

import 'presentation/blocs/maps/maps_bloc.dart';
import 'presentation/blocs/routs/routs_bloc.dart';
import 'presentation/screens/login/login_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
            MapsBloc()
              ..add(GetCurrentLocation()),
          ),
          BlocProvider(
            create: (context) => RoutsBloc(sl(),sl()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Trans Jo',
          theme: ThemeData(),
          home: HomeView(),
        ),
      );
    });
  }
}
