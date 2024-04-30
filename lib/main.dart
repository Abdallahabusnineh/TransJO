import 'package:flutter/material.dart';
import 'package:transjo/core/utils/cash_helper.dart';
import 'package:transjo/core/utils/dio_helper.dart';
import 'package:transjo/presentation/screens/main_screen/main_screen_content.dart';
import 'package:transjo/presentation/screens/main_screen/main_screen_view.dart';
import 'package:transjo/presentation/screens/onboardingscreen/onBoardingScreen.dart';
import 'package:transjo/presentation/screens/password_change_isdone/password_change_view.dart';
import 'package:transjo/presentation/screens/setting/setting_view.dart';



Future<void> main() async{
  DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();//عشان ما يعمل رن الا لما يتأكد انو كلشي معملوه initlaies
  await CashHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TrasnJo',
      theme: ThemeData(),
      home:MainScreenView(),
    );
  }
}
