import 'package:doctor_app/component/BottomSheet/CustomBottomSheet.dart';
import 'package:doctor_app/utils/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Utils/Constants/AssetsImage.dart';
import '../../../../../../component/Button/CustomCircleButton.dart';
import '../../../../../../component/Button/CustomFillButton.dart';
import '../../../../../../component/Text/TextStyle.dart';
import '../../../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../../../utils/constants/AppIcons.dart';



class WelcomeBottomSheet {
  welcomeBottomSheet(BuildContext context) {
    Responsive(context).setOrientation(context);
    Size size = MediaQuery
        .of(context)
        .size;
    return CustomBottomSheet().customBottomSheet(
        context,
        Container(
          height: Responsive(context).isTabletPortrait? size.height *0.6:Responsive(context).isTabletLandscape? size.height*0.9: size.height*0.5,
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
          decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32.sp), topLeft: Radius.circular(32.sp))),
          child: Column(
            children: [
              Container(
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                    Image.asset(
                              AssetsImages.successImage,
                              height:Responsive(context).isTabletLandscape?41.sp:100.sp,
                              width: 100.sp,
                            ),

                          Text(
                            "Sent Successfully!",
                            style: AppTextStyle()
                                .boldText()
                                .copyWith(fontSize:Responsive(context).isTabletLandscape? 12.sp: 24.sp, color: AppTheme.appTextColor),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: "Email sent successfully. we’ll contact you within",
                                style: AppTextStyle()
                                    .regularText()
                                    .copyWith(color: AppTheme.grey, fontSize:Responsive(context).isTabletLandscape?10.sp:16.sp),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: " 1-3 business days",
                                    style: AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape?10.sp:16.sp,
                                    color: Colors.blue,
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height:Responsive(context).isTabletLandscape? 10.sp:30.sp,
                    ),
                    CustomFilledButton(
                      height: Responsive(context).isTabletLandscape? 30.sp:null,
                      disableButton: false,
                      title: 'Done',
                      onPressed: () {
                        Navigator.pop(context);
                        // WelcomeBottomSheet().welcomeBottomSheet(context);
                        // if (formKey.currentState!.validate()) {
                        //   Navigator.of(context)
                        //       .pushNamed(RouteConstants.loginPasswordScreen, arguments: {
                        //     "is_phone_number": true,
                        //     "user_enter_data": "$countryCode${phoneNumberController.text}",
                        //   });
                        // }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}