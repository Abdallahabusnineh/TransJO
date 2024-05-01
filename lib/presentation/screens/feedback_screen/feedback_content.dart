import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:transjo/core/common_widgets/navigations_types.dart';
import 'package:transjo/core/common_widgets/text_area.dart';
import 'package:transjo/presentation/screens/feedback_screen/feedback_is_done.dart';
import 'package:transjo/presentation/screens/main_screen/main_screen_view.dart';

class FeedbackContent extends StatelessWidget {
   FeedbackContent({Key? key}) : super(key: key);
  // we must create feedbackController in bloc but it for testing
TextEditingController feedbackController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: FadeInLeft(
              duration: Duration(milliseconds: 1000),
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
                child: Text(
                  'Do you have a problem?',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
              ),
            ),
          ),
          Container(
            child: Image(
              image: AssetImage('assets/images/Feedback-rafiki.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextArea(controller:feedbackController,minLines: 5, ),
          ),
          SizedBox(height: 10,),
          Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blue.shade900),
              child: Center(
                  child: FadeInUp(
                    duration: Duration(milliseconds: 1000),
                    child: TextButton(
                      onPressed: () {
                          navigateTo(context, FeedbackIsDone());
                      },
                      child: Text(
                        'Send Feedback',
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
