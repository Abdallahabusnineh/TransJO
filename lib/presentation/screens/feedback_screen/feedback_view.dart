import 'package:flutter/material.dart';
import 'package:transjo/presentation/screens/feedback_screen/feedback_content.dart';

class FeedbackView extends StatelessWidget {
  const FeedbackView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FeedbackContent(),
    );
  }
}
