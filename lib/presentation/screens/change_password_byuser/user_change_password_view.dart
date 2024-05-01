import 'package:flutter/material.dart';
import 'package:transjo/presentation/screens/change_password_byuser/user_change_password_content.dart';

class UserChangePasswordView extends StatelessWidget {
  const UserChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserChangePasswordContent(),
    );
  }
}
