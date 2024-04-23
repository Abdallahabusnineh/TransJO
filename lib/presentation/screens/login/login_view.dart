import 'package:flutter/material.dart';
import 'package:transjo/presentation/blocs/Login/login_bloc.dart';
import 'package:transjo/presentation/screens/login/login_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
          body: LoginContent()
      ),
    );
  }
}
