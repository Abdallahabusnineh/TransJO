import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transjo/core/common_widgets/navigations_types.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transjo/presentation/blocs/Login/login_bloc.dart';
import 'package:transjo/presentation/screens/forgot_password/forgotpassword_view.dart';
import 'package:transjo/presentation/screens/home_screen/home_view.dart';
import 'package:transjo/presentation/screens/register/register_view.dart';
class LoginContent extends StatelessWidget {
   LoginContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc=BlocProvider.of<LoginBloc>(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.blue.shade900,
            Colors.blue.shade800,
            Colors.blue.shade400,
          ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FadeInUp(
                    duration: Duration(milliseconds: 1300),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    )),
                SizedBox(
                  height: 10,
                ),
                FadeInUp(
                  duration: Duration(milliseconds: 1300),
                  child: Text(
                    'Welcome Back',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 60,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              const BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, 0.3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade200))),
                              child: FadeInUp(
                                duration: Duration(milliseconds: 1000),
                                child: TextFormField(
                                  controller: TextEditingController(),
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                      hintText: 'Username',
                                      prefixIcon: Icon(Icons.person),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                  validator: (value ) {
                                    if (value!.isEmpty)
                                      return 'password is too short';
                                  },
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade200))),
                              child: FadeInUp(
                                duration: Duration(milliseconds: 1000),
                                child: TextFormField(
                                  controller: TextEditingController(),
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                      hintText: 'Password',
                                      prefixIcon: Icon(Icons.security),
                                      suffixIcon:
                                      Icon(Icons.visibility_off_rounded),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                  validator: (value) {
                                    if (value!.isEmpty)
                                      return 'password is too short';
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          navigateTo(context, ForgotPasswordView());
                        },
                        child: FadeInUp(
                          duration: Duration(milliseconds: 1000),
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.blue.shade900),
                          child: Center(
                              child: FadeInUp(
                                duration: Duration(milliseconds: 1000),
                                child: TextButton(
                                  onPressed: () {
                                 //   if(bloc.formKey.currentState!.validate())
                                      navigateTo(context, HomeView());
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ))),
                      SizedBox(
                        height: 10,
                      ),
                      FadeInUp(
                          duration: Duration(milliseconds: 1000),
                          child: Text('Don\'t have an account ?')),
                      FadeInUp(
                          duration: Duration(milliseconds: 1000),
                          child: TextButton(
                              onPressed: () {
                                navigateTo(context, RegisterView());
                              },
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
