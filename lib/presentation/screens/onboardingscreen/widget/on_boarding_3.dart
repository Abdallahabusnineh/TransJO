import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:transjo/core/common_widgets/navigations_types.dart';
import 'package:transjo/presentation/screens/login/login_view.dart';



class ThirdOnBoardingScreen extends StatelessWidget {
  const ThirdOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          FadeInLeft(
            duration: Duration(milliseconds: 1000),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 0,0),
              child: const Text(
                'Want To Track Your Bus ?',
                style: TextStyle(fontSize: 35,fontFamily:'Montserrat',fontWeight: FontWeight.bold ),
              ),
            ),
          ),
          Lottie.asset('assets/images/Animation - 1702035910937.json'),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 20,0),
            child: RichText(text: const TextSpan(
              text: 'Save time and effort by effortlessly tracking your favorite bus routes with TransJO'
              ,style: TextStyle(color: Colors.grey,fontSize: 25,fontFamily: 'Montserrat'),

            )),
          ),




        ],
      ),
    );



  }
}
