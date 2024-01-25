import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import '../../utils/constants/app_theme.dart';

class AppTimePickerSpinner extends StatelessWidget {
  void Function(DateTime)? onTimeChange;
  TextStyle? normalTextStyle;
  TextStyle? highlightedTextStyle;
  double? spacing;
  double? itemHeight;
  bool? isForce2Digits;
   AppTimePickerSpinner({super.key, required this.onTimeChange,this.normalTextStyle, this.highlightedTextStyle,this.isForce2Digits,this.itemHeight,this.spacing});

  @override
  Widget build(BuildContext context) {
    return TimePickerSpinner(
      alignment: Alignment.center,
      is24HourMode: false,
      itemWidth: 40.sp,
      normalTextStyle: normalTextStyle ??  TextStyle(
        fontSize: 22.sp,
        color: AppTheme.lightTextColor,
      ),
      highlightedTextStyle: highlightedTextStyle??  TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: AppTheme.appTextColor,
      ),
      spacing:spacing?? 50.sp,
      itemHeight:itemHeight?? 80.sp,
      isForce2Digits:isForce2Digits?? true,
      onTimeChange: onTimeChange,
    );
  }
}
