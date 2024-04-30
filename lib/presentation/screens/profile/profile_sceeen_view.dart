import 'package:flutter/material.dart';
import 'package:transjo/presentation/screens/profile/profile_screen_content.dart';

class ProfileSceeenView extends StatelessWidget {
  const ProfileSceeenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileScreenContent(),
    );
  }
}
