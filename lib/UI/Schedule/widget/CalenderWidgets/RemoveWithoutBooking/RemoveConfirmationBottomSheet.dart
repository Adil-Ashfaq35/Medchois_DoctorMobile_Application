import 'dart:math';
import 'package:doctor_app/UI/Schedule/Provider/ScheduleProvider.dart';
import 'package:doctor_app/component/BottomSheet/CustomBottomSheet.dart';
import 'package:doctor_app/component/Button/CustomFillButton.dart';
import 'package:doctor_app/component/Text/TextStyle.dart';
import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:doctor_app/utils/constants/AppIcons.dart';
import 'package:doctor_app/utils/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


class RemoveConfirmationBottomSheet {
  removeConfirmationBottomSheet(BuildContext context,
      {AnimationController? animationController}) {
    Size size = MediaQuery.of(context).size;
    Responsive(context).setOrientation(context);
    return CustomBottomSheet().customBottomSheet(
      context,
      showDragHandle: true,
      Consumer<ScheduleProvider>(
        builder: (context, appointmentProvider, _) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                // Calculate the maximum height (60% of screen height)
                double maxHeight = Responsive(context).isTabletLandscape? size.height*0.9:size.height * 0.4;
                // Calculate the actual height based on content
                double actualHeight = min(constraints.maxHeight, maxHeight);

                return Container(
                  height: actualHeight,
                  padding: EdgeInsets.symmetric(vertical: 10.sp),
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(32.sp),
                      topLeft: Radius.circular(32.sp),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.sp),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Saturday Shift",
                                textAlign: TextAlign.center,
                                style: AppTextStyle()
                                    .mediumText()
                                    .copyWith(fontSize:Responsive(context).isTabletLandscape? 12.sp :20.sp),
                              ),
                              Container(
                                height: 30.sp,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppTheme.bottomSheetCloseButtonBgColor,
                                ),
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon:  Icon(AppIcons.close,size:Responsive(context).isTabletLandscape?10.sp:15.sp),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 0.04.sh,
                          ),

                          Text(
                            "Sunday, 12 Apr from 10:00 Am to 12:00 Pm",
                            textAlign: TextAlign.center,
                            style: AppTextStyle()
                                .regularText()
                                .copyWith(fontSize:Responsive(context).isTabletLandscape? 12.sp:15.sp,fontWeight: FontWeight.w400),
                          ),

                          SizedBox(height: 20.sp,),

                          Padding(
                            padding: EdgeInsets.all(8.sp),
                            child: CustomFilledButton(
                                borderColor: AppTheme.grey.withOpacity(0.2),
                                textColor: AppTheme.white,
                                btnColor: AppTheme.redColor,
                                title: 'Remove',
                                disableButton: false,
                                onPressed: () => {
                                }),
                          ),
                          SizedBox(
                            height: 2.sp,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.sp),
                            child: CustomFilledButton(
                              borderWidth: 0.1,
                              borderColor: AppTheme.grey.withOpacity(0.2),
                              fontSize: 13.sp,
                              buttonGradients: const LinearGradient(
                                  colors: [AppTheme.white, AppTheme.white]),
                              btnColor: AppTheme.white,
                              textColor: AppTheme.appPrimaryColor,
                              title: "Cancel",
                              disableButton: false,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      animationController: animationController,
    );
  }
}

