import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/AppIcons.dart';
import '../../../utils/constants/AssetsImage.dart';
import '../../../utils/constants/app_theme.dart';
import '../../utils/HelperFunction/Reponsive.dart';
import '../Button/CustomCircleButton.dart';
import '../Text/TextStyle.dart';

class AppHeader extends StatelessWidget {
  String? title;
  Widget? actionWidget;
  void Function()? onTap;

  AppHeader({this.title, this.onTap, this.actionWidget});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Container(
      height: Responsive(context).isTabletLandscape? 60.sp:150.sp,
      width: double.infinity,
      decoration: BoxDecoration(gradient: AppTheme.headerBackgroundGradient1),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(25 / 360),
              alignment: Alignment.topRight,
              child: Image.asset(
                AssetsImages.appLogo,
                width:Responsive(context).isTabletLandscape?60.sp: 200.49.sp,
                height:Responsive(context).isTabletLandscape? 60.sp:230.5.sp,
                alignment: const Alignment(2, 5),
                fit: BoxFit.contain,
                color: AppTheme.white.withOpacity(0.15),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment:Responsive(context).isTabletLandscape? CrossAxisAlignment.start:CrossAxisAlignment.center,
                children: [
                  CustomCircleIconButton(
                    icon: AppIcons.keyboardArrowBack,
                    height:Responsive(context).isTabletLandscape? 15.sp:null,
                    width:Responsive(context).isTabletLandscape? 15.sp:null,
                    iconSize: Responsive(context).isTabletLandscape? 10.sp:null,
                    onTap: onTap ?? () => Navigator.of(context).pop(),
                  ),
                  Text(
                    title ?? "",
                    textAlign: TextAlign.center,
                    style: AppTextStyle().boldText().copyWith(color: AppTheme.white,
                        fontSize:Responsive(context).isTabletLandscape? 10.sp:null,
                    ),
                  ),
                  actionWidget ??
                      CustomCircleIconButton(
                        icon: AppIcons.keyboardArrowBack,
                        iconColor: AppTheme.transparent,
                        boxColor: AppTheme.transparent,
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
