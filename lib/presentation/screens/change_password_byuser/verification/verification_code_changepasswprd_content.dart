import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transjo/core/common_widgets/navigations_types.dart';
import 'package:transjo/presentation/blocs/setting/change_password_bloc/change_password_bloc.dart';
import 'package:transjo/presentation/screens/password_change_isdone/password_change_view.dart';

class ChangePasswordVerificationCodeContent extends StatelessWidget {
  const ChangePasswordVerificationCodeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChangePasswordBloc  bloc=BlocProvider.of<ChangePasswordBloc>(context);
    ChangePasswordBloc  blocListener=context.watch<ChangePasswordBloc>();
    final GlobalKey<FormState> formKeyVerificationCode = GlobalKey<FormState>();

    return Form(
      key: formKeyVerificationCode,
      child: Container(
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
                            "You\'ve received a code in your email. ",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )),
                  SizedBox(
                    height: 10,
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
                        Container(
                          child: Image(
                            height: 200,
                            width: 4000,
                            image: AssetImage('assets/images/check_your_email.jpg'),
                          ),
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
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200))),
                                child: FadeInUp(
                                  duration: Duration(milliseconds: 1000),
                                  child: TextFormField(
                                    controller: bloc.codeController,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                        hintText: 'Enter Your Code',
                                        prefixIcon: Icon(Icons.verified),
                                        //suffixIcon: Icon(Icons.remove_red_eye),
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                    validator: (value) {
                                      if (value!.isEmpty)
                                        return 'enter code';
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        blocListener.state is ChangePasswordVerificationCodeLoadingState?Center(child: CircularProgressIndicator(color: Colors.blue.shade700,)):
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
                                      if(formKeyVerificationCode.currentState!.validate())
                                        bloc.add(ChangePasswordVerificationCodeProcessEvent(code:  bloc.codeController.text));
                                      print(bloc.codeController.text);
                                    },
                                    child: Text(
                                      'Verification ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),

                                ))),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
