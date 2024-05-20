import 'package:flutter/material.dart';
import 'package:transjo/presentation/blocs/setting/user_details/user_details_bloc.dart';
import 'package:transjo/presentation/screens/profile/profile_screen_content.dart';

import '../../../core/utils/tools.dart';

class ProfileSceeenView extends StatelessWidget {
  const ProfileSceeenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDetailsBloc(sl())..add(GetUserDetails()),
      child: Scaffold(
        body: ProfileScreenContent(),
      ),
    );
  }
}
