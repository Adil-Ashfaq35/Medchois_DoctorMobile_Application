import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:password_strength_indicator/password_strength_indicator.dart';

import '../../../utils/constants/app_theme.dart';


class CustomPasswordStrengthIndicator extends StatelessWidget {
  String? password;
  bool? showError;

  CustomPasswordStrengthIndicator({@required this.password, this.showError = true});

  @override
  Widget build(BuildContext context) {
    return PasswordStrengthIndicator(
      width: double.infinity,
      // Change the width of the strength bar
      thickness: 6.sp,
      // Change the thickness of the strength bar
      backgroundColor: AppTheme.grey.withOpacity(0.5),
      // Change the background color of the strength bar
      radius: 8.sp,
      // Change the radius of the strength bar
      colors: StrengthColors(
        // Customize the colors of the strength bar
        weak: AppTheme.appLightGreenColor,
        medium: AppTheme.appLightGreenColor,
        strong: showError! ? AppTheme.appLightGreenColor : AppTheme.red,
      ),
      duration: Duration(milliseconds: 300),
      // Set the animation duration
      curve: Curves.easeOut,
      // Set the animation curve
      callback: (double strength) {
        // Receive the strength value of the password
        print('Password Strength: $strength');
      },
      strengthBuilder: (String password) {
        // Implement a custom strength builder to calculate the strength based on your criteria
        // Return a value between 0.0 (too weak) and 1.0 (very strong)
        // Example:
        return password.length / 8;
        // if (showOnlyOneValidation!) {
        //   return password.length / 8;
        // } else {
        //   if (AppExtensions().specialCharacter(password)) {
        //     return 2 / 8;
        //   } else if (AppExtensions().isNumericCharacter(password)) {
        //     return 4 / 8;
        //   } else if (password.length > 8) {
        //     return 6 / 8;
        //   } else if (password != previousPassword &&
        //       password.length > 8 &&
        //       AppExtensions().isNumericCharacter(password) &&
        //       AppExtensions().specialCharacter(password)) {
        //     return 8 / 8;
        //   } else {
        //     return 0;
        //   }
        // }
      },
      style: StrengthBarStyle.dashed,
      password: password, // Choose a style for the strength bar
    );
  }
}
