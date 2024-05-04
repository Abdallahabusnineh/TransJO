import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transjo/core/common_widgets/navigations_types.dart';
import 'package:transjo/core/common_widgets/show_toast.dart';
import 'package:transjo/core/services/services_locater.dart';
import 'package:transjo/presentation/blocs/register/register_bloc.dart';
import 'package:transjo/presentation/screens/main_screen/main_screen_view.dart';
import 'package:transjo/presentation/screens/register/register_content.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterBloc>(),
      child: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if(state is RegisterSuccessState)
            {
              navigateTo(context, MainScreenView());
              showToast(text: state.r, state: ToastState.SUCCESS);
            }
          else
            showToast(text: 'enter with correct value', state: ToastState.ERROR);
        },
        builder: (context, state) {
          return Scaffold(
            body: RegisterContent(),
          );
        },
      ),
    );
  }
}
