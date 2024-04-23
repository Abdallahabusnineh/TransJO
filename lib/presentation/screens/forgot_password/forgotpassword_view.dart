import 'package:flutter/material.dart';
import 'package:transjo/presentation/screens/forgot_password/forgot_password_content.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ForgotPasswordContent(),
    );
  }
}
