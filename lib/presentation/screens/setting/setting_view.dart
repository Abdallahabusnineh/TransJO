import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transjo/core/common_widgets/navigations_types.dart';
import 'package:transjo/core/services/services_locater.dart';
import 'package:transjo/presentation/blocs/setting/change_password_bloc/change_password_bloc.dart';
import 'package:transjo/presentation/screens/change_password_byuser/verification/verification_code_changepassword_view.dart';
import 'package:transjo/presentation/screens/setting/setting_content.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ChangePasswordBloc>(),
      child: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
        listener: (context, state) {
          if(state is ChangePasswordSendCodeSuccessState)
            navigateTo(context,ChangePasswordVerificationCodeView() );
        },
        builder: (context, state) {
          return Scaffold(
            body: SettingContent(),
          );
        },
      ),
    );
  }
}
