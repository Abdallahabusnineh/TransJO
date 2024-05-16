import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transjo/core/common_widgets/navigations_types.dart';
import 'package:transjo/core/common_widgets/text_area.dart';
import 'package:transjo/presentation/blocs/setting/feedback/feed_back_bloc.dart';
import 'package:transjo/presentation/screens/feedback_screen/feedback_is_done.dart';

class FeedbackContent extends StatelessWidget {
  FeedbackContent({Key? key}) : super(key: key);

  // we must create feedbackController in bloc but it for testing

  @override
  Widget build(BuildContext context) {
    FeedBackBloc bloc = BlocProvider.of<FeedBackBloc>(context);
    FeedBackBloc bloclistener = context.watch<FeedBackBloc>();
    return Form(
      key: bloc.formKey,
      child: SingleChildScrollView(
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
              child: TextArea(
                controller: bloc.textController,
                minLines: 5,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            bloclistener.state is FeedBackLoadingState?Center(child: CircularProgressIndicator(color: Colors.blue.shade700)):
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
                     if(bloc.formKey.currentState!.validate())
                       bloc.add(SendFeedBackEvent(text: bloc.textController.text));
                    },
                    child: Text(
                      'Send Feedback',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ))),
          ],
        ),
      ),
    );
  }
}
