import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/BottomSheet/CustomBottomSheet.dart';
import '../../../../../component/Button/CustomCircleButton.dart';
import '../../../../../component/Button/CustomFillButton.dart';
import '../../../../../component/Text/TextStyle.dart';
import '../../../../../utils/constants/AppIcons.dart';
import '../../../../../utils/constants/app_theme.dart';


class LogoutBottomSheet {
  logoutBottomSheet(BuildContext context, {AnimationController? animationController}) {
    Size size = MediaQuery.of(context).size;
    Responsive(context).setOrientation(context);
    return CustomBottomSheet().customBottomSheet(
        context,
        Container(
          height:Responsive(context).isTabletLandscape? size.height*0.9:Responsive(context).isTabletPortrait? size.height*0.5: size.height * 0.3,
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
          decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32.sp), topLeft: Radius.circular(32.sp))),
          child: Column(
            children: [
              SizedBox(
                height: 40.sp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 4.sp,
                      width: 65.sp,
                      decoration: BoxDecoration(
                          color: AppTheme.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(5.sp))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Logout",
                          textAlign: TextAlign.center,
                          style: AppTextStyle().mediumText(),
                        ),
                        CustomCircleIconButton(
                          onTap: () => Navigator.of(context).pop(),
                          height: 25.sp,
                          width: 25.sp,
                          boxColor: AppTheme.grey.withOpacity(0.2),
                          icon: AppIcons.close,
                          iconColor: AppTheme.grey,
                          iconSize: 16.sp,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Logout from Medchois account?',
                    textAlign: TextAlign.center,
                    style: AppTextStyle().regularText().copyWith(fontSize: 14.sp),
                  ),
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Column(
                children: [
                  CustomFilledButton(
                    disableButton: false,
                    buttonGradients:
                        const LinearGradient(colors: [AppTheme.red, AppTheme.red]),
                    title: 'Logout',
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  CustomFilledButton(
                    disableButton: false,
                    borderColor: AppTheme.grey.withOpacity(0.2),
                    buttonGradients:
                        const LinearGradient(colors: [AppTheme.white, AppTheme.white]),
                    textColor: AppTheme.appPrimaryColor,
                    title: 'Cancel',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ],
          ),
        ),
        animationController: animationController);
  }
}
