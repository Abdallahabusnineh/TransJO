import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'home_content.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeContent(),
    );
  }
}
