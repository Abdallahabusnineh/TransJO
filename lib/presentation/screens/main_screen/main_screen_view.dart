import 'package:flutter/material.dart';
import 'package:transjo/presentation/screens/main_screen/main_screen_content.dart';

class MainScreenView extends StatelessWidget {
  const MainScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainScreenContent(),
    );
  }
}
