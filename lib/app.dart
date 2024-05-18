import 'package:flutter/material.dart';
import 'package:transjo/core/utils/tools.dart';
import 'package:transjo/presentation/blocs/setting/change_password_bloc/change_password_bloc.dart';
import 'package:transjo/presentation/screens/home/home_view.dart';
import 'package:transjo/presentation/screens/login/login_view.dart';
import 'package:transjo/presentation/screens/onboardingscreen/onBoardingScreen.dart';

import 'core/utils/app_constanse.dart';
import 'presentation/blocs/maps/maps_bloc.dart';
import 'presentation/blocs/routs/routs_bloc.dart';
import 'presentation/screens/main_screen/main_screen_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    print('TOKEN ::: $token');
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MapsBloc()..add(GetCurrentLocation()),
          ),
          BlocProvider(
            create: (context) => RoutsBloc(sl(), sl())..add(RoutsGetAllEvent()),
            lazy: false,
          ),
          BlocProvider(create: (context)=>ChangePasswordBloc(sl(), sl(),sl()))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Trans Jo',
          theme: ThemeData(),
          home: startPage(),
        ),
      );
    });
  }

  Widget startPage() {
    if (token != "") {
      return const MainScreenView();
    } else {
      return const OnBoardingScreen();
    }
  }
}
