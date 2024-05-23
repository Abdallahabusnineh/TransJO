import 'package:flutter/material.dart';
import 'package:transjo/core/common_widgets/text_widget.dart';
import 'package:transjo/presentation/screens/all_routes/all_routes_content.dart';

class AllRoutesView extends StatelessWidget {
  const AllRoutesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: TextWidget(text: "All Routes",),
      ),
      body: AllRoutesContent(),
    );
  }
}
