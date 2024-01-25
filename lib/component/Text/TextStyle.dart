import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/app_theme.dart';


String englishBold = 'engBold';
String englishRegular = 'engRegular';
String englishLight = 'engLight';
String englishMedium = 'engMedium';
String englishThin = 'engThin';

class AppTextStyle {
  TextStyle boldText() {
    return TextStyle(
      fontSize: 20.sp,
      fontFamily: englishBold,
      fontWeight: FontWeight.w500,
      color: AppTheme.appTextColor,
    );
  }

  TextStyle regularText() {
    return TextStyle(
      fontSize: 18.sp,
      fontFamily: englishRegular,
      fontWeight: FontWeight.w500,
      color: AppTheme.appTextColor,
    );
  }

  TextStyle mediumText() {
    return TextStyle(
      fontSize: 16.sp,
      fontFamily: englishMedium,
      fontWeight: FontWeight.w500,
      color: AppTheme.appTextColor,
    );
  }
}
