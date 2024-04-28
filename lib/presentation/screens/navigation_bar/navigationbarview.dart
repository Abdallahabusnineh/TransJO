import 'package:flutter/material.dart';
import 'package:transjo/presentation/screens/navigation_bar/navigation_bar_content.dart';

class NavigationBarView extends StatelessWidget {
  const NavigationBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavigationBarContent(),
    );
  }
}
