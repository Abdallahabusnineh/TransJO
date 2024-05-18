import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transjo/core/common_widgets/navigations_types.dart';
import 'package:transjo/core/common_widgets/show_toast.dart';
import 'package:transjo/core/services/services_locater.dart';
import 'package:transjo/presentation/blocs/setting/change_password_bloc/change_password_bloc.dart';
import 'package:transjo/presentation/screens/change_password_byuser/user_change_password_view.dart';
import 'package:transjo/presentation/screens/change_password_byuser/verification/verification_code_changepasswprd_content.dart';
import 'package:transjo/presentation/screens/password_change_isdone/password_change_view.dart';

class ChangePasswordVerificationCodeView extends StatelessWidget {
  const ChangePasswordVerificationCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordBloc, ChangePasswordState>(
      listener: (context, state) {
    if(state is ChangePasswordVerificationCodeSuccessState) {
      navigateTo(context, UserChangePasswordView());
      showToast(text: 'code is correct successfully', state: ToastState.SUCCESS);
    }
    else if (state is ChangePasswordVerificationCodeServerFailureState )
      showToast(text: 'your code is not correct', state: ToastState.ERROR);
        },
      child: Scaffold(
        body: ChangePasswordVerificationCodeContent(),
      ),
    );
  }
}
