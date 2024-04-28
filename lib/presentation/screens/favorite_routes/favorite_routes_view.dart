import 'package:flutter/material.dart';
import 'package:transjo/presentation/screens/favorite_routes/favorite_routes_content.dart';

class FavoriteRoutesView extends StatelessWidget {
  const FavoriteRoutesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FavoriteRoutesContent(),
    );
  }
}
