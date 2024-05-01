import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:transjo/core/common_widgets/navigations_types.dart';
import 'package:transjo/presentation/screens/main_screen/main_screen_view.dart';

class FeedbackIsDone extends StatelessWidget {
  const FeedbackIsDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FadeInLeft(
            duration: Duration(milliseconds: 1000),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15,80,0,0),
              child: Text('Your feedback is done',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,fontFamily: 'Montserrat'),),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0,0),
                  child: FadeInLeft(duration: Duration(milliseconds: 1000),child: Text('Thank you for sharing!',style: TextStyle(fontSize: 20),))),
            ],
          ),
          Image(image: AssetImage('assets/images/feedback_done.jpg')),
          SizedBox(height: 20,),
          Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.lightBlue.shade700),
              child: Center(
                  child: FadeInUp(
                    duration: Duration(milliseconds: 1000),
                    child: TextButton(
                      onPressed: () {
                          navigateTo(context, MainScreenView());
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ))),

        ],
      ),
    );
  }
}
