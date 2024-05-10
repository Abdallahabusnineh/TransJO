import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transjo/core/common_widgets/navigations_types.dart';
import 'package:transjo/core/common_widgets/show_toast.dart';
import 'package:transjo/core/services/services_locater.dart';
import 'package:transjo/presentation/blocs/verification_bloc.dart';
import 'package:transjo/presentation/screens/password_change_isdone/password_change_view.dart';
import 'package:transjo/presentation/screens/verification/verification_content.dart';
class VerificationView extends StatelessWidget {
  const VerificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<VerificationBloc>(),
      child: BlocListener<VerificationBloc, VerificationState>(
        listener: (context, state) {
      if(state is VerificationSuccessState) {
        navigateTo(context, PasswordChangeView());
        showToast(text: 'change password successfully', state: ToastState.SUCCESS);
      }
      else if (state is VerificationServerFailureState || state is VerificationErrorState  )
        showToast(text: 'your code is not correct', state: ToastState.ERROR);
      },

        child: Scaffold(
          body: VerificationContent(),
        ),
      ),
    );
  }
}
