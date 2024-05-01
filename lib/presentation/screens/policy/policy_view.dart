import 'package:flutter/material.dart';
import 'package:transjo/presentation/screens/policy/policy_content.dart';

class PolicyView extends StatelessWidget {
  const PolicyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PolicyContent(),
    );
  }
}
