import 'package:country_flags/country_flags.dart';
import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/BottomSheet/CustomBottomSheet.dart';
import '../../../../../component/Button/CustomFillButton.dart';
import '../../../../../component/Text/TextStyle.dart';
import '../../../../../utils/constants/AppIcons.dart';
import '../../../../../utils/constants/app_theme.dart';


class SwitchLanguageBottomSheet {
  switchLanguageBottomSheet(BuildContext context, {AnimationController? animationController}) {
    Size size = MediaQuery.of(context).size;
    Responsive(context).setOrientation(context);
    return CustomBottomSheet().customBottomSheet(
        context,
        Container(
          height: Responsive(context).isTabletLandscape? size.height*0.9: size.height * 0.4,
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
          decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32.sp), topLeft: Radius.circular(32.sp))),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape? 0.sp: 8.sp),
                child: Text(
                  "Select Language | اختر اللغة",
                  textAlign: TextAlign.center,
                  style: AppTextStyle().mediumText().copyWith(fontSize: Responsive(context).isTabletLandscape? 12.sp:20.sp),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: Responsive(context).isTabletLandscape? 10.sp:20.sp, horizontal: 15.sp),
                      decoration: BoxDecoration(
                          color: AppTheme.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.all(Radius.circular(16.sp))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CountryFlag.fromCountryCode(
                                'US',
                                height: Responsive(context).isTabletLandscape? 18.sp: 24.sp,
                                width: Responsive(context).isTabletLandscape? 18.sp:40.sp,
                                borderRadius: 4.sp,
                              ),
                              SizedBox(
                                width: 8.sp,
                              ),
                              Text(
                                "English",
                                style: AppTextStyle()
                                    .regularText()
                                    .copyWith(fontWeight: FontWeight.w500,
                                  fontSize:  Responsive(context).isTabletLandscape? 10.sp:null,
                                ),
                              )
                            ],
                          ),
                          const Icon(
                            AppIcons.emptyCircle,
                            color: AppTheme.grey,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height:Responsive(context).isTabletLandscape? 5.sp:8.sp,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape? 10.sp:20.sp, horizontal: 15.sp),
                      decoration: BoxDecoration(
                          color: AppTheme.grey.withOpacity(0.1),
                          border: Border.all(width: 1.2, color: AppTheme.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(16.sp))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CountryFlag.fromCountryCode(
                                'eg',
                                height: Responsive(context).isTabletLandscape? 18.sp: 24.sp,
                                width: Responsive(context).isTabletLandscape? 18.sp:40.sp,
                                borderRadius: 4.sp,
                              ),
                              SizedBox(
                                width: 8.sp,
                              ),
                              Text(
                                "العربية",
                                style: AppTextStyle()
                                    .regularText()
                                    .copyWith(fontWeight: FontWeight.w500,
                                fontSize:  Responsive(context).isTabletLandscape? 10.sp:null,
                                ),
                              )
                            ],
                          ),
                          const Icon(
                            AppIcons.emptyCircle,
                            color: AppTheme.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.sp),
                child: CustomFilledButton(
                  disableButton: false,
                  title: 'Change Language',
                ),
              ),
            ],
          ),
        ),
        animationController: animationController);
  }
}
