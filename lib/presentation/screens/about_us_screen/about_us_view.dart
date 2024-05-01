import 'package:flutter/material.dart';
import 'package:transjo/presentation/screens/about_us_screen/about_us_content.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AboutUsContent(),
    );
  }
}
