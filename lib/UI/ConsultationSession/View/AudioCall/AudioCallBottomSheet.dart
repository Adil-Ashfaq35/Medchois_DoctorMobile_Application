import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Utils/Constants/RouteConstant.dart';
import '../../../../component/BottomSheet/CustomBottomSheet.dart';
import '../../../../component/Button/CustomCircleButton.dart';
import '../../../../component/Button/CustomFillButton.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../utils/constants/AppIcons.dart';
import '../../../../utils/constants/app_theme.dart';


class AudioCallBottomSheet {
  audioCallBottomSheet(BuildContext context, {AnimationController? animationController}) {
    Size size = MediaQuery.of(context).size;
    Responsive(context).setOrientation(context);
    return CustomBottomSheet().customBottomSheet(
        context,
        Container(
          height:Responsive(context).isTabletLandscape? size.height*0.9: size.height * 0.45,
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
          decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32.sp), topLeft: Radius.circular(32.sp))),
          child: Column(
            children: [
              Container(
                height:Responsive(context).isTabletLandscape? 25.sp:40.sp,
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
                          "Audio Call",
                          textAlign: TextAlign.center,
                          style: AppTextStyle().mediumText().copyWith(
                            fontSize: Responsive(context).isTabletLandscape? 13.sp: null,
                          ),
                        ),
                        CustomCircleIconButton(
                          onTap: () => Navigator.of(context).pop(),
                          height:Responsive(context).isTabletLandscape? 15.sp: 25.sp,
                          width:Responsive(context).isTabletLandscape? 15.sp: 25.sp,
                          boxColor: AppTheme.grey.withOpacity(0.2),
                          icon: AppIcons.close,
                          iconColor: AppTheme.grey,
                          iconSize:Responsive(context).isTabletLandscape? 8.sp: 16.sp,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomCircleIconButton(
                      height:Responsive(context).isTabletLandscape? 40.sp: 80.sp,
                      width:Responsive(context).isTabletLandscape? 40.sp: 80.sp,
                      boxGradientColors: AppTheme.buttonGradient,
                      icon: AppIcons.phone,
                      iconColor: AppTheme.white,
                    ),
                    Text(
                      'Confirm starting your audio session?',
                      textAlign: TextAlign.center,
                      style: AppTextStyle().regularText().copyWith(fontSize:Responsive(context).isTabletLandscape? 12.sp: 14.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.sp,
              ),
              CustomFilledButton(
                disableButton: false,
                title: 'Start audio call',
                onPressed: () {
                  Navigator.pop(context);
                  Future.delayed(const Duration(milliseconds: 200),
                      () => Navigator.of(context).pushNamed(RouteConstants.audioCallScreen));
                },
              ),
            ],
          ),
        ),
        animationController: animationController);
  }
}
