import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transjo/core/common_widgets/navigations_types.dart';
import 'package:transjo/core/common_widgets/show_toast.dart';
import 'package:transjo/core/services/services_locater.dart';
import 'package:transjo/presentation/blocs/forgotpassword/forgot_password_bloc.dart';
import 'package:transjo/presentation/screens/forgot_password/forgot_password_content.dart';
import 'package:transjo/presentation/screens/verification/verification_view.dart';
class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ForgotPasswordBloc>(),
      child: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
        listener: (context, state) {
          print(state);
          if(state is ForgotPasswordSuccessState){
            navigateTo(context, VerificationView());
            showToast(text: 'check your email', state: ToastState.SUCCESS);
          }
          else if (state is ForgotPasswordServerFailureState || state is ForgotPasswordErrorState  )
            showToast(text: 'email is not correct', state: ToastState.ERROR);
          },
        child: Scaffold(
          body: ForgotPasswordContent(),
        ),
      ),
    );
  }
}
