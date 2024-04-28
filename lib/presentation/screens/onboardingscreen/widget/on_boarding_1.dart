import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:transjo/core/common_widgets/navigations_types.dart';
import 'package:transjo/presentation/screens/login/login_view.dart';

class FirstOnBoardingScreen extends StatelessWidget {
  const FirstOnBoardingScreen({super.key});

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
          Container(
            alignment: Alignment.center,
            child: FadeInLeft(
              duration: Duration(milliseconds: 1000),
              child: Text(
                'Welcome to',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.black,fontFamily: 'Montserrat' ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Image(
              image: AssetImage('assets/images/logo (2).jpg'),
            ),
          ),
          const SizedBox(
            height: 100
          ),
          const Text(
            'What We Provides ?',
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black ),
          ),
          const Text(
            'Explore Bus Routes in Real-Time',
            style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: Colors.grey ),
          ),
          const SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.fromLTRB(35, 0, 20,0),

            child: RichText(text: const TextSpan(
              text: 'TransJO offers a comprehensive view of all available bus routes in your city, displayed in real-time. Easily track the location and estimated arrival times of buses on each route, empowering you to plan your journey with confidence.'
            ,style: TextStyle(color: Colors.grey,fontSize: 22,fontWeight: FontWeight.w400),

            )),
          )




        ],
      ),
    );
  }
}
