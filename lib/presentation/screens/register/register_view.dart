import 'package:flutter/material.dart';
import 'package:transjo/presentation/screens/register/register_content.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterContent(),
    );
  }
}
