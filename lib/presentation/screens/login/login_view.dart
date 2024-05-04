import 'package:flutter/material.dart';
import 'package:transjo/core/common_widgets/navigations_types.dart';
import 'package:transjo/core/common_widgets/show_toast.dart';
import 'package:transjo/core/services/services_locater.dart';
import 'package:transjo/presentation/blocs/Login/login_bloc.dart';
import 'package:transjo/presentation/screens/login/login_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transjo/presentation/screens/main_screen/main_screen_view.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginBloc>(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
         if(state is LoginSuccessState){
           navigateTo(context, MainScreenView());
           showToast(text: state.r, state: ToastState.SUCCESS);

         }
         else
           showToast(text: 'enter with correct value', state: ToastState.ERROR);

        },
        child: Scaffold(
            body: LoginContent()
        ),
      ),
    );
  }
}
