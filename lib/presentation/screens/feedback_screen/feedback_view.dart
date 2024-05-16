import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transjo/core/common_widgets/navigations_types.dart';
import 'package:transjo/core/common_widgets/show_toast.dart';
import 'package:transjo/core/services/services_locater.dart';
import 'package:transjo/presentation/blocs/setting/feedback/feed_back_bloc.dart';
import 'package:transjo/presentation/screens/feedback_screen/feedback_content.dart';
import 'package:transjo/presentation/screens/feedback_screen/feedback_is_done.dart';

class FeedbackView extends StatelessWidget {
  const FeedbackView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FeedBackBloc>(),
      child: BlocListener<FeedBackBloc, FeedBackState>(
        listener: (context, state) {
      if(state is FeedBackSuccessState)
        navigateTo(context, FeedbackIsDone());

      showToast(text: 'feed back is done, we will contact with you', state: ToastState.SUCCESS);
        },
        child: Scaffold(
          body: FeedbackContent(),
        ),
      ),
    );
  }
}
