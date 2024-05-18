import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transjo/core/common_widgets/navigations_types.dart';
import 'package:transjo/core/common_widgets/show_toast.dart';
import 'package:transjo/presentation/blocs/setting/change_password_bloc/change_password_bloc.dart';
import 'package:transjo/presentation/screens/change_password_byuser/password_ischanged.dart';
import 'package:transjo/presentation/screens/change_password_byuser/user_change_password_content.dart';
import 'package:transjo/presentation/screens/main_screen/main_screen_view.dart';

class UserChangePasswordView extends StatelessWidget {
  const UserChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordBloc, ChangePasswordState>(
      listener: (context, state) {
        if(state is ChangePasswordUpdatedSuccessState) {
          navigateTo(context, ChangePasswordDone());
          showToast(text: 'updated password successfully', state: ToastState.SUCCESS);
        }
        else if (state is ChangePasswordUpdatedServerFailureState )
          showToast(text: 'your current password is not correct', state: ToastState.ERROR);

      },
      child: Scaffold(
        body: UserChangePasswordContent(),
      ),
    );
  }
}
