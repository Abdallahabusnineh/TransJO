import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:transjo/core/common_widgets/action_button_with_icon.dart';
import 'package:transjo/core/utils/app_assets.dart';
import 'package:transjo/core/utils/app_colors.dart';

class LoginByGoogleButton extends StatelessWidget {
  const LoginByGoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionButtonWithIcon(
      icon: Image.asset(AppAssets.googleIcon, height: 3.h),
      backgroundColor: AppColors.myGrey,
      onPressed: () {},
      text: "Google",
      textColor: Colors.black,
    );
  }
}
