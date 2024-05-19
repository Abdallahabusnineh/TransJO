import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transjo/core/common_widgets/navigations_types.dart';
import 'package:transjo/core/common_widgets/show_toast.dart';
import 'package:transjo/core/services/services_locater.dart';
import 'package:transjo/presentation/blocs/Login/login_bloc.dart';
import 'package:transjo/presentation/blocs/setting/change_password_bloc/change_password_bloc.dart';
import 'package:transjo/presentation/blocs/setting/logout/logout_bloc.dart';
import 'package:transjo/presentation/screens/about_us_screen/about_us_view.dart';
import 'package:transjo/presentation/screens/change_password_byuser/verification/verification_code_changepassword_view.dart';
import 'package:transjo/presentation/screens/feedback_screen/feedback_view.dart';
import 'package:transjo/presentation/screens/login/login_view.dart';
import 'package:transjo/presentation/screens/policy/policy_view.dart';
import 'package:transjo/presentation/screens/profile/profile_sceeen_view.dart';

class SettingContent extends StatelessWidget {
  const SettingContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChangePasswordBloc bloc = BlocProvider.of<ChangePasswordBloc>(context);
    ChangePasswordBloc blocListener = context.watch<ChangePasswordBloc>();

    return SingleChildScrollView(
      child: Column(children: [
        Container(
          padding: EdgeInsets.fromLTRB(15, 60, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Setting ',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Icon(Icons.manage_accounts)),
            Container(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Text(
                'Account',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        //abood alloooooo
        Divider(
          endIndent: 15,
          indent: 15,
        ),
        Row(
          children: [
            TextButton(
                onPressed: () {
                  navigateTo(context, ProfileSceeenView());
                },
                child: Text(
                  'User Info',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                )),
            Spacer(),
            Container(
              child: IconButton(
                onPressed: () {
                  navigateTo(context, ProfileSceeenView());
                },
                icon: Icon(
                  Icons.arrow_forward_ios_sharp,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        blocListener.state is ChangePasswordSendCodeLoadingState
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.blue.shade700,
              ))
            : Row(
                children: [
                  TextButton(
                      onPressed: () {
                        bloc.add(ChangePasswordSendCodeProcessEvent());
                          navigateTo(
                              context, ChangePasswordVerificationCodeView());
                          showToast(
                              text: 'send code successfully',
                              state: ToastState.SUCCESS);

                      },
                      child: Text(
                        'Change Password',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      )),
                  Spacer(),
                  Container(
                    child: IconButton(
                      onPressed: () {
                        bloc.add(ChangePasswordSendCodeProcessEvent());

                          navigateTo(
                              context, ChangePasswordVerificationCodeView());
                          showToast(
                              text: 'send code successfully',
                              state: ToastState.SUCCESS);

                      },
                      icon: Icon(
                        Icons.arrow_forward_ios_sharp,
                      ),
                    ),
                  ),
                ],
              ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Icon(Icons.settings)),
            Container(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Text(
                'Other Setting',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Divider(
          endIndent: 15,
          indent: 15,
        ),
        Row(
          children: [
            TextButton(
                onPressed: () {
                  navigateTo(context, FeedbackView());
                },
                child: Text(
                  'Feedback',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                )),
            Spacer(),
            Container(
              child: IconButton(
                onPressed: () {
                  navigateTo(context, FeedbackView());
                },
                icon: Icon(
                  Icons.feed,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            TextButton(
                onPressed: () {
                  navigateTo(context, PolicyView());
                },
                child: Text(
                  'Policy',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                )),
            Spacer(),
            Container(
              child: IconButton(
                onPressed: () {
                  navigateTo(context, PolicyView());
                },
                icon: Icon(
                  Icons.policy,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            TextButton(
                onPressed: () {
                  navigateTo(context, AboutUsView());
                },
                child: Text(
                  'About Us',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                )),
            Spacer(),
            Container(
              child: IconButton(
                onPressed: () {
                  navigateTo(context, AboutUsView());
                },
                icon: Icon(
                  Icons.info,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        BlocProvider(
          create: (context) => LogoutBloc(sl())..add(LogoutStartProcessEvent()),
          child: BlocBuilder<LogoutBloc, LogoutState>(
            builder: (context, state) {

              return state is LoginLoadingState
                  ? CircularProgressIndicator(
                      color: Colors.blue.shade700,
                    )
                  : Container(
                      child: ElevatedButton(
                        onPressed: () {
                            navigateTo(context, LoginScreen());
                            showToast(
                                text: 'Logout is done',
                                state: ToastState.SUCCESS);

                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 20),
                            // Adjust padding for bigger size
                            backgroundColor: Color.fromARGB(255, 21, 101, 192)),
                        child: Text('Log Out',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ),
                      decoration: BoxDecoration(),
                    );
            },
          ),
        )
      ]),
    );
  }
}
