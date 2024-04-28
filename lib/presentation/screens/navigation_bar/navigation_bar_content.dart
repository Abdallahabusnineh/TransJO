import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:transjo/core/common_widgets/navigations_types.dart';
import 'package:transjo/presentation/blocs/bottom_navigation_bar/bottom_navigation_bar_bloc.dart';
import 'package:transjo/presentation/screens/favorite_routes/favorite_routes_view.dart';
import 'package:transjo/presentation/screens/home_screen/home_view.dart';
import 'package:transjo/presentation/screens/setting/setting_content.dart';
import 'package:transjo/presentation/screens/setting/setting_view.dart';

class NavigationBarContent extends StatelessWidget {
  const NavigationBarContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
      builder: (context, state) {
        return Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: GNav(
                padding: EdgeInsets.all(16),
                curve: Curves.bounceInOut,
                color: Colors.black,
                backgroundColor: Colors.white,
                textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                activeColor: Colors.white,

                // backgroundColor: Colors.blue.shade700,
                tabBackgroundColor: Colors.blue.shade700,
                gap: 10,
                iconSize: 25,
                tabs: [
                  GButton(icon: Icons.home, text: 'Home'),
                  GButton(
                      icon: Icons.favorite,
                      text: 'Favorite Routes',
                      iconActiveColor: Colors.red.shade700),
                  GButton(
                    icon: Icons.settings,
                    text: 'Setting',
                  ),
                ],
                onTabChange: (value) {
    BottomNavigationBarBloc.getObject(context).add(BottomNavigationBarEventChange(index: value));



                },
              ),
            );
      },
    );
  }
}
