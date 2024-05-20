import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transjo/core/common_widgets/navigations_types.dart';
import 'package:transjo/core/common_widgets/show_toast.dart';
import 'package:transjo/core/services/services_locater.dart';
import 'package:transjo/presentation/blocs/setting/change_password_bloc/change_password_bloc.dart';
import 'package:transjo/presentation/blocs/setting/logout/logout_bloc.dart';
import 'package:transjo/presentation/blocs/setting/user_details/user_details_bloc.dart';
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
    // ChangePasswordBloc bloc = BlocProvider.of<ChangePasswordBloc>(context);
    // ChangePasswordBloc blocListener = context.watch<ChangePasswordBloc>();

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
        // BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
        //   builder: (context, state) {
        //     if (state is ChangePasswordSendCodeLoadingState) {
        //       return Center(child: CircularProgressIndicator());
        //     } else {
        //       return Row(
        //         children: [
        //           TextButton(
        //               onPressed: () {
        //                 bloc.add(ChangePasswordSendCodeProcessEvent());
        //                 if (state is ChangePasswordSendCodeSuccessState) {
        //                   navigateTo(
        //                       context, ChangePasswordVerificationCodeView());
        //                   showToast(
        //                       text: 'send code successfully',
        //                       state: ToastState.SUCCESS);
        //                 }
        //                 else {
        //                   showToast(
        //                       text: 'Server failure',
        //                       state: ToastState.ERROR);
        //                 }
        //               },
        //               child: Text(
        //                 'Change Password',
        //                 style: TextStyle(color: Colors.grey, fontSize: 20),
        //               )),
        //           Spacer(),
        //           Container(
        //             child: IconButton(
        //               onPressed: () {
        //                 bloc.add(ChangePasswordSendCodeProcessEvent());
        //                 if (state is ChangePasswordSendCodeSuccessState) {
        //                   navigateTo(
        //                       context, ChangePasswordVerificationCodeView());
        //                   showToast(
        //                       text: 'send code successfully',
        //                       state: ToastState.SUCCESS);
        //                 }
        //                 else {
        //                   showToast(text: 'server failure',
        //                       state: ToastState.ERROR);
        //                 }
        //               }, icon: Icon(
        //               Icons.arrow_forward_ios_sharp,
        //             ),
        //             ),
        //           ),
        //         ],
        //       );
        //     }
        //
        //     //return SizedBox();
        //   },
        // ),
        BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
          listener: (context, state) {
            if (state is ChangePasswordSendCodeSuccessState){
              navigateTo(context, ChangePasswordVerificationCodeView());
              showToast(text: 'Success Send Code', state: ToastState.SUCCESS);
            }
            if(state is ChangePasswordSendCodeServerFailureState)
              {
                showToast(text: 'Server Failuar', state: ToastState.ERROR);
              }
          },
          builder: (BuildContext context, ChangePasswordState state) {
            return state is ChangePasswordSendCodeLoadingState ?CircularProgressIndicator(
              color: Colors.blue.shade700,
            )
            : Row(
              children: [
                TextButton(
                    onPressed: () {
                      context.read<ChangePasswordBloc>().add(ChangePasswordSendCodeProcessEvent());
                    },
                    child: Text(
                      'Change Password',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    )),
                Spacer(),
                Container(
                  child: IconButton(
                    onPressed: () {
                      context.read<ChangePasswordBloc>().add(ChangePasswordSendCodeProcessEvent());
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios_sharp,
                    ),
                  ),
                ),
              ],
            );
          },

        ),
        /*: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        bloc.add(ChangePasswordSendCodeProcessEvent());
                        if (blocListener.state
                            is ChangePasswordSendCodeSuccessState) {
                          navigateTo(
                              context, ChangePasswordVerificationCodeView());
                          showToast(
                              text: 'send code successfully',
                              state: ToastState.SUCCESS);
                        } else
                          showToast(text: 'error', state: ToastState.ERROR);
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
                        if (blocListener.state
                        is ChangePasswordSendCodeSuccessState) {
                          navigateTo(
                              context, ChangePasswordVerificationCodeView());
                          showToast(
                              text: 'send code successfully',
                              state: ToastState.SUCCESS);
                        } else
                          showToast(text: 'error', state: ToastState.ERROR);
                        },
                      icon: Icon(
                        Icons.arrow_forward_ios_sharp,
                      ),
                    ),
                  ),
                ],
              ),*/
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
          create: (context) => LogoutBloc(sl()),
          child: BlocBuilder<LogoutBloc, LogoutState>(
            builder: (context, state) {
              LogoutBloc blocLogout = BlocProvider.of<LogoutBloc>(context);
              return state is LogoutLoadingState
                  ? CircularProgressIndicator(
                color: Colors.blue.shade700,
              )
                  : Container(
                child: ElevatedButton(
                  onPressed: () {
                    blocLogout.add(LogoutStartProcessEvent());
                    /* if (state is LogoutSuccessState) {*/
                    navigateTo(context, LoginScreen());
                    showToast(
                        text: 'Logout is done',
                        state: ToastState.SUCCESS);
                    /* }
                       //   else
                            showToast(text: 'Logout is failued', state: ToastState.ERROR);
                        */
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
