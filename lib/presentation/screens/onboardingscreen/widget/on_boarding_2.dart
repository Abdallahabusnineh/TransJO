import 'package:flutter/material.dart';
import 'package:transjo/core/common_widgets/navigations_types.dart';
import 'package:transjo/presentation/screens/login/login_view.dart';

class SecondOnBoardingScreen extends StatelessWidget {
  const SecondOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              navigateTo(context,LoginScreen());

            },
            child: const Text(
              'skip',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 0,0),
            child: const Text(
              'Find Your Way with Ease',
              style: TextStyle(fontSize: 40,fontFamily:'Montserrat',fontWeight: FontWeight.bold ),
            ),
          ),
          Image(
            image: AssetImage('assets/images/onBoarding33.png'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(55, 0, 20,0),
            child: RichText(text: const TextSpan(
              text: 'Navigating through the city has never been easier. With our intuitive interface, you can effortlessly locate nearby bus stops and view detailed schedules for each stop. Whether you are heading to work, meeting friends, or exploring new places, our app ensures you reach your destination on time.'
              ,style: TextStyle(color: Colors.grey,fontSize: 18,fontFamily: 'Montserrat'),

            )),
          )




        ],
      ),
    );


  }
}
