import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transjo/core/common_widgets/navigations_types.dart';
import 'package:transjo/core/utils/app_constanse.dart';
import 'package:transjo/presentation/blocs/setting/user_details/user_details_bloc.dart';
import 'package:transjo/presentation/screens/login/login_view.dart';
import 'package:transjo/presentation/screens/setting/setting_view.dart';

class ProfileScreenContent extends StatelessWidget {
  const ProfileScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserDetailsBloc,UserDetailsState>(
      builder: (BuildContext context, UserDetailsState state) {
        return state is SuccessUserDetailsState ? Column(
          children: [
            Container(
              height: 180,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'User Inforamtion ',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Colors.grey.shade200))
                ),
                child: TextFormField(
                  readOnly: true,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      hintText: userDetailsName,
                      prefixIcon: Icon(Icons.man),
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Colors.grey.shade200))
                ),
                child: TextFormField(
                  readOnly: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: userDetailsEmail,
                      prefixIcon: Icon(Icons.email),
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(height: 10,),


          ],
        )  : Center(
          child: CircularProgressIndicator(
          backgroundColor: Colors.blue.shade700,
          color: Colors.grey,
          ),
        );
      },
      listener: (BuildContext context, UserDetailsState state) {  },

    );
  }
}
