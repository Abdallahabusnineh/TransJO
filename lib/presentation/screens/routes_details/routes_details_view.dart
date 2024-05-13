import 'package:flutter/material.dart';
import 'package:transjo/core/utils/tools.dart';
import 'package:transjo/domain/entites/routs.dart';
import 'package:transjo/presentation/screens/routes_details/routes_details_content.dart';

class RoutesDetailsView extends StatelessWidget {
  const RoutesDetailsView({super.key, required this.route});

  final Routs route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          text: "Route Details",
        ),
      ),
      body: RoutesDetailsContent(
        route: route,
      ),
    );
  }
}
