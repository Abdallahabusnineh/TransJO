import 'package:flutter/material.dart';
import 'package:transjo/presentation/screens/change_password_byuser/verification/verification_code_changepasswprd_content.dart';

class ChangePasswordVerificationCodeView extends StatelessWidget {
  const ChangePasswordVerificationCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangePasswordVerificationCodeContent(),
    );
  }
}
