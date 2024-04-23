import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:transjo/core/common_widgets/navigations_types.dart';
import 'package:transjo/core/utils/regex.dart';
import 'package:transjo/presentation/forgot_password.dart';
import 'package:transjo/presentation/screens/home_screen.dart';
import 'package:transjo/presentation/screens/login/login_content.dart';
import 'package:transjo/presentation/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var userController = TextEditingController();
    var passwordController = TextEditingController();

    return Form(
      key: formKey,
      child: Scaffold(
        body: LoginContent()
      ),
    );
  }
}
