import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../utils/constants/app_theme.dart';
import '../../utils/HelperFunction/Reponsive.dart';
import '../Text/TextStyle.dart';




class CustomPinPutBox extends StatefulWidget {
  void Function(String)? onCompleted;
  final TextEditingController? controller;
  final FocusNode? node;

  CustomPinPutBox({this.onCompleted, this.controller, this.node});

  @override
  _CustomPinPutBoxState createState() => _CustomPinPutBoxState();
}

class _CustomPinPutBoxState extends State<CustomPinPutBox> {
  @override
  void dispose() {
    widget.node!.dispose();
    widget.controller!.dispose();
    super.dispose();
  }

  bool showError = false;

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    const length = 4;
    Color borderColor = AppTheme.grey.withOpacity(0.6),
        errorColor = AppTheme.red,
        fillColor = Colors.transparent;
    final defaultPinTheme = PinTheme(
      width: Responsive(context).isTabletLandscape? 30.sp:48.sp,
      height:Responsive(context).isTabletLandscape? 30.sp:48.sp,
      margin: EdgeInsets.symmetric(horizontal: 5.sp),
      textStyle: AppTextStyle().mediumText().copyWith(fontSize: 24.sp),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8.sp),
        border: Border.all(color: borderColor),
      ),
    );

    return Pinput(
      length: length,
      controller: widget.controller,
      focusNode: widget.node,

      defaultPinTheme: defaultPinTheme,
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 10.sp,
            backgroundColor: AppTheme.appPrimaryColor.withOpacity(0.3),
          )
        ],
      ),
      onCompleted: widget.onCompleted,
      focusedPinTheme: defaultPinTheme.copyWith(
        width:Responsive(context).isTabletLandscape? 30.sp: 56.sp,
        height:Responsive(context).isTabletLandscape? 30.sp:56.sp,
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: AppTheme.appPrimaryColor),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: errorColor,
          borderRadius: BorderRadius.circular(8.sp),
        ),
      ),
    );
  }
}
