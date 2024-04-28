import 'package:flutter/material.dart';
import 'package:transjo/presentation/screens/setting/setting_content.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingContent(),
    );
  }
}
