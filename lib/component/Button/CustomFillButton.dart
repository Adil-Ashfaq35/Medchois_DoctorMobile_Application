import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../utils/constants/app_theme.dart';
import '../Text/TextStyle.dart';


class CustomFilledButton extends StatelessWidget {
  final String? title;
  final Gradient? buttonGradients;
  BorderRadiusGeometry? borderRadius;
  final double? width, height, btnRadius, textColorOpacity, fontSize, buttonIconSize, borderWidth;
  final Color? textColor, buttonIconColor, btnColor, borderColor;
  final VoidCallback? onPressed;
  final bool isTitleUpperCase, disableButton;
  IconData? buttonIcon;
  Widget? imageButtonIcon;
  FontWeight? fontWeight;
  TextStyle? style;
  double? letterSpacing;
  String? fontFamily;

  CustomFilledButton(
      {super.key, this.title,
      this.onPressed,
      this.width,
      this.buttonIcon,
      this.imageButtonIcon,
      this.borderRadius,
      this.isTitleUpperCase = true,
      this.disableButton = true,
      this.height,
      this.buttonIconSize,
      this.textColor,
      this.buttonIconColor,
      this.textColorOpacity = 1,
      this.btnColor,
      this.borderColor,
      this.btnRadius = 8,
      this.buttonGradients,
      this.fontSize,
      this.borderWidth,
      this.fontWeight,
      this.letterSpacing,
      this.style,
      this.fontFamily});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    Size size = MediaQuery.of(context).size;
    final double shortestSide = size.shortestSide;
    final bool isMobile = shortestSide < 600.0;
    return Container(
      height: height==null ? Responsive(context).isTabletLandscape?30.sp:56.sp:height,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
          color: btnColor ?? null,
          borderRadius: borderRadius ?? BorderRadius.circular(btnRadius!.sp),
          gradient: disableButton ? null : buttonGradients ?? AppTheme.buttonGradient),
      child: buttonIcon == null && imageButtonIcon == null
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                backgroundColor: btnColor?? Colors.transparent,
                shadowColor: Colors.transparent,
                side: BorderSide(color: borderColor ?? AppTheme.transparent),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: borderRadius ?? BorderRadius.circular(btnRadius!.sp)),
                minimumSize: Size(width ?? double.infinity, height ?? 56.sp),
              ),
              onPressed: onPressed ?? null,
              child: Text(
                title!,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: style ??
                    TextStyle(
                        height: 1.25,
                        fontFamily: fontFamily ?? englishMedium,
                        color:
                            disableButton ? AppTheme.grey : textColor ?? AppTheme.white,
                        fontSize: fontSize==null ? Responsive(context).isTabletLandscape? 10.sp:15.sp:fontSize,
                        fontWeight: fontWeight ?? FontWeight.w500),
              ),
            )
          : ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: btnColor ?? AppTheme.transparent,
                side: BorderSide(
                    color: borderColor ?? AppTheme.transparent, width: borderWidth ?? 2),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: borderRadius ?? BorderRadius.circular(btnRadius!.sp)),
                minimumSize: Size(width ?? double.infinity, height ?? 48.h),
              ),
              onPressed: onPressed ?? () {},
              icon: imageButtonIcon ??
                  Icon(
                    buttonIcon,
                    color: buttonIconColor,
                    size: buttonIconSize,
                  ),
              label: Text(
                title!,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: style ??
                    TextStyle(
                        height: 1.25,
                        fontFamily: fontFamily ?? englishMedium,
                        color: textColor ?? AppTheme.white,
                        fontSize: fontSize ?? 15.sp,
                        fontWeight: fontWeight ?? FontWeight.w500),
              ),
            ),
    );
  }
}
