import 'dart:math';

import 'package:doctor_app/UI/Schedule/widget/CalenderWidgets/RemoveWithoutBooking/RemoveConfirmationBottomSheet.dart';
import 'package:doctor_app/utils/constants/AppIcons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../component/BottomSheet/CustomBottomSheet.dart';
import '../../../../../component/Button/CustomCircleButton.dart';
import '../../../../../component/Button/CustomFillButton.dart';
import '../../../../../component/Text/TextStyle.dart';
import '../../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../../utils/constants/app_theme.dart';
import '../../../Provider/ScheduleProvider.dart';



class NoBookingShiftRemoveBottomSheet {
  noBookingShiftRemoveBottomSheet(BuildContext context,
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
                double maxHeight =Responsive(context).isTabletLandscape?size.height*0.8:size.height * 0.4;
                // Calculate the actual height based on content
                double actualHeight = min(constraints.maxHeight, maxHeight);

                return Container(
                  height: actualHeight,
                  padding: EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape? 5.sp:10.sp),
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
                                    .copyWith(fontSize:Responsive(context).isTabletLandscape? 12.sp: 20.sp),
                              ),
                              CustomCircleIconButton(
                                onTap: () => Navigator.of(context).pop(),
                                height:Responsive(context).isTabletLandscape? 12.sp:25.sp,
                                width:Responsive(context).isTabletLandscape? 12.sp:25.sp,
                                boxColor: AppTheme.grey.withOpacity(0.2),
                                icon: AppIcons.close,
                                iconColor: AppTheme.grey,
                                iconSize:Responsive(context).isTabletLandscape? 8.sp:16.sp,
                              ),
                            ],
                          ),
                          SizedBox(
                            height:Responsive(context).isTabletLandscape?0.05.sh:0.04.sh,
                          ),

                          Text(
                            "Sunday, 12 Apr from 10:00 Am to 12:00 Pm",
                            textAlign: TextAlign.center,
                            style: AppTextStyle()
                                .regularText()
                                .copyWith(fontSize:Responsive(context).isTabletLandscape? 10.sp:15.sp,fontWeight: FontWeight.w400),
                          ),

                          SizedBox(height: 20.sp,),

                          Padding(
                            padding: EdgeInsets.all(8.sp),
                            child: CustomFilledButton(
                                borderColor: AppTheme.grey.withOpacity(0.2),
                                textColor: AppTheme.white,
                                title: 'This Sunday only',
                                disableButton: false,
                                onPressed: () => {
                                Navigator.pop(context),
                                  RemoveConfirmationBottomSheet().removeConfirmationBottomSheet(context),
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
                              buttonGradients: const LinearGradient(
                                  colors: [AppTheme.white, AppTheme.white]),
                              btnColor: AppTheme.white,
                              textColor: AppTheme.appPrimaryColor,
                              title: "All upcoming Sundays",
                              disableButton: false,
                              onPressed: () {
                                Navigator.pop(context);
                                RemoveConfirmationBottomSheet().removeConfirmationBottomSheet(context);
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

