import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:transjo/core/common_widgets/navigations_types.dart';
import 'package:transjo/presentation/screens/login/login_view.dart';
import 'package:transjo/presentation/screens/onboardingscreen/on_boarding_1.dart';
import 'package:transjo/presentation/screens/onboardingscreen/on_boarding_2.dart';
import 'package:transjo/presentation/screens/onboardingscreen/on_boarding_3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: const [
            FirstOnBoardingScreen(),
            SecondOnBoardingScreen(),
            ThirdOnBoardingScreen(),
          ],
        ),
        Container(
            alignment: const Alignment(0, .9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      _controller.previousPage(
                          duration: Duration(microseconds: 400),
                          curve: Curves.easeIn);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 20,
                    )),
                SmoothPageIndicator(controller: _controller, count: 3),
                onLastPage
                    ? ElevatedButton(
                        onPressed: () {
                          navigateTo(context, LoginScreen());
                        },
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue)),
                        child: Text(
                          'Get Started',
                        ))
                    : IconButton(
                        onPressed: () {
                          _controller.nextPage(
                              duration: Duration(microseconds: 400),
                              curve: Curves.easeIn);
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 20,
                        ))
              ],
            )),
      ]),
    );
  }
}
