import 'package:flutter/material.dart';
import 'package:transjo/presentation/screens/verification/verification_content.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VerificationContent(),
    );
  }
}
