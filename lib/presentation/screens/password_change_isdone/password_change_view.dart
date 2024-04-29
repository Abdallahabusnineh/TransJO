import 'package:flutter/material.dart';
import 'package:transjo/presentation/screens/password_change_isdone/password_change_content.dart';

class PasswordChangeView extends StatelessWidget {
  const PasswordChangeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PasswordChangeContent(),
    );
  }
}
