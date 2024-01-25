
import 'package:doctor_app/utils/constants/AssetsImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';
import '../../../../component/BottomSheet/CustomBottomSheet.dart';
import '../../../../component/Button/CustomFillButton.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../utils/constants/app_theme.dart';
import '../../Provider/FollowUpProvider.dart';


class ReminderSetBottomSheet {
  reminderSetBottomSheet(BuildContext context,
      {AnimationController? animationController}) {
    Size size = MediaQuery.of(context).size;
    return CustomBottomSheet().customBottomSheet(context,
        showDragHandle: true,
        Consumer<FollowUpProvider>(
            builder: (context, appointmentProvider, _) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  height: size.height * 0.6,
                  padding: EdgeInsets.symmetric(vertical: 10.sp),
                  decoration: BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(32.sp),
                          topLeft: Radius.circular(32.sp))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Image(
                          width: 125.sp,
                          height: 125.sp,
                          image: const AssetImage(
                        AssetsImages.reminderSuccess,
                      )),
                      SizedBox(height: 10.sp,),

                      Text(
                        "Reminder Set Successfully",
                        textAlign: TextAlign.center,
                        style: AppTextStyle().boldText(),
                      ),


                      SizedBox(height: 10.sp,),

                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                        child: Container(
                          height: 146.sp,
                          width: double.infinity,
                          decoration:  BoxDecoration(
                            color: AppTheme.white,
                            border: Border.all(color: AppTheme.borderColor),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 43.sp,
                                color: AppTheme.fieldTextColor,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 8.sp),
                                    child: Text(
                                      "Reminder Title",
                                      textAlign: TextAlign.start,
                                      style: AppTextStyle().regularText().copyWith(
                                        color: AppTheme.appPrimaryColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal:10.sp,vertical: 8.sp),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 30.sp,
                                        height: 30.sp,
                                        decoration: BoxDecoration(
                                          color: AppTheme.appPrimaryColor,
                                          borderRadius: BorderRadius.circular(4.r),
                                        ),
                                        child: SvgPicture.asset(AssetsImages.scheduleUnselectedIcon,color: AppTheme.white,fit: BoxFit.scaleDown,height:10.sp,width: 10.sp, ),
                                      ),
                                      SizedBox(width: 10.sp,),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '12 Apr, 2022 - Everyweek',
                                            textAlign: TextAlign.start,
                                            style: AppTextStyle()
                                                .regularText()
                                                .copyWith(fontSize: 13.sp,fontWeight: FontWeight.w500,color: AppTheme.appTextColor,),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.sp,),

                                  Row(
                                    children: [
                                      Container(
                                        width: 30.sp,
                                        height: 30.sp,
                                        decoration: BoxDecoration(
                                          color: AppTheme.red,
                                          borderRadius: BorderRadius.circular(4.r),
                                        ),
                                        child: SvgPicture.asset(AssetsImages.clockIconSvg,color: AppTheme.white,fit: BoxFit.scaleDown,height:10.sp,width: 10.sp, ),
                                      ),
                                      SizedBox(width: 10.sp,),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '10:30 PM',
                                            textAlign: TextAlign.start,
                                            style: AppTextStyle()
                                                .regularText()
                                                .copyWith(fontSize: 13.sp,fontWeight: FontWeight.w500,color: AppTheme.appTextColor,),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )

                            ],
                          ),
                        ),
                      ),



                      SizedBox(height: 20.sp,),

                      Padding(
                        padding: EdgeInsets.all(20.sp),
                        child: CustomFilledButton(
                          borderWidth: 0.1,
                          borderColor: AppTheme.grey.withOpacity(0.2),
                          fontSize: 13.sp,
                          // buttonGradients: const LinearGradient(
                          //     colors: [AppTheme.white, AppTheme.white]),

                          textColor: AppTheme.white,
                          title: "Save",
                          disableButton: false,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }), animationController: animationController);
  }
}



