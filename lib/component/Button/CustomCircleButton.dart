import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/app_theme.dart';

class CustomCircleIconButton extends StatelessWidget {
  double? height, width, iconSize;
  Color? boxColor, iconColor, boxShadowColor;
  Widget? iconImage;
  Gradient? boxGradientColors;
  EdgeInsetsGeometry? padding;
  IconData? icon;
  void Function()? onTap;

  CustomCircleIconButton(
      {this.width,
      this.height,
      this.boxColor,
      this.iconColor,
      this.iconImage,
      this.padding,
      this.boxGradientColors,
      this.iconSize,
      this.onTap,
      this.icon,
      this.boxShadowColor});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return InkWell(
      onTap: onTap ?? () {},
      splashColor: AppTheme.transparent,
      hoverColor: AppTheme.transparent,
      highlightColor: AppTheme.transparent,
      child: Container(
        height: height==null ? Responsive(context).isTabletLandscape?20.sp:40.sp:height,
        width: width ?? 40.sp,
        padding: padding ?? EdgeInsets.zero,
        decoration: BoxDecoration(
          color: boxColor ?? AppTheme.white,
          gradient: boxGradientColors,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: boxShadowColor ?? AppTheme.transparent,
              spreadRadius: 3,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: iconImage ??
              Icon(
                icon,
                size: iconSize==null ? Responsive(context).isTabletLandscape? 15.sp: 24.sp:iconSize,
                weight: 1,
                color: iconColor ?? AppTheme.appPrimaryColor,
              ),
        ),
      ),
    );
  }
}
