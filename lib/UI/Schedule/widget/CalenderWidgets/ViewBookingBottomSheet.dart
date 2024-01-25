import 'dart:math';
import 'package:doctor_app/UI/Schedule/Provider/ScheduleProvider.dart';

import 'package:doctor_app/UI/Schedule/widget/CalenderWidgets/RemoveWithoutBooking/NoBookingShiftRemoveBottomSheet.dart';
import 'package:doctor_app/component/BottomSheet/CustomBottomSheet.dart';
import 'package:doctor_app/component/Text/TextStyle.dart';
import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:doctor_app/utils/constants/AppIcons.dart';
import 'package:doctor_app/utils/constants/AssetsImage.dart';
import 'package:doctor_app/utils/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../component/Button/CustomCircleButton.dart';
import 'RemoveWithBooking/CancelConsultationsBottomSheet.dart';



class ViewNoBookingBottomSheet {
  viewNoBookingBottomSheet(BuildContext context,
      {AnimationController? animationController}) {
    Responsive(context).setOrientation(context);
    Size size = MediaQuery.of(context).size;
    return CustomBottomSheet().customBottomSheet(
      context,
      showDragHandle: true,
      Consumer<ScheduleProvider>(
        builder: (context, appointmentProvider, _) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                double maxHeight = Responsive(context).isTabletLandscape? size.height*0.8:size.height * 0.4;
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
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 2.sp, horizontal: 14.sp),
                        child: Row(
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
                      ),
                      SizedBox(
                        height: 0.04.sh,
                      ),


                      Padding(
                        padding: EdgeInsets.only(left: 10.sp),
                        child: ListTile(
                          leading:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  "Shift 1",
                                  style: AppTextStyle()
                                      .mediumText()
                                      .copyWith(fontSize:Responsive(context).isTabletPortrait? 12.sp:Responsive(context).isTabletLandscape? 5.sp:16.sp),
                                ),
                              ),
                              SizedBox(height:Responsive(context).isTabletPortrait? 0.sp:Responsive(context).isTabletLandscape?0:5.sp,),
                             Expanded(
                             child:
                              RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                    text: "From 12:00 Pm to 2:00 PM -",
                                    style: AppTextStyle()
                                        .regularText()
                                        .copyWith(color: AppTheme.lightTextColor, fontSize:Responsive(context).isTabletPortrait? 8.sp:Responsive(context).isTabletLandscape? 5.sp: 12.sp),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: " No Bookings",
                                        style: AppTextStyle().regularText().copyWith(
                                          fontSize:Responsive(context).isTabletLandscape? 8.sp:12.sp,
                                          color: const Color(0xff404180),
                                        ),
                                      ),
                                    ]),
                              )),
                            ],
                          ),
                          trailing: InkWell(
                            onTap: (){
                              Navigator.pop(context);
                              NoBookingShiftRemoveBottomSheet().noBookingShiftRemoveBottomSheet(context);
                            },
                            child: Container(
                              height: 40.sp,
                              width: 40.sp,
                              decoration: const BoxDecoration(
                                color: Color(0xffFFEDED),
                                shape: BoxShape.circle,
                              ),
                              child:FittedBox(
                               fit: BoxFit.scaleDown,
                                child: SvgPicture.asset(
                                  height:Responsive(context).isTabletLandscape?10.sp:16.sp,
                                  width: 16.sp,
                                  fit: BoxFit.contain,
                                    AssetsImages.trashIcon),
                              )
                            ),
                          ),

                        ),
                      ),

                      SizedBox(height: 10.sp,),

                      Padding(
                        padding:  EdgeInsets.only(left: 10.sp),
                        child: ListTile(
                          leading:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  "Shift 1",
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle()
                                      .mediumText()
                                      .copyWith(fontSize:Responsive(context).isTabletPortrait? 12.sp:Responsive(context).isTabletLandscape? 5.sp:16.sp),
                                ),
                              ),
                              SizedBox(height:Responsive(context).isTabletPortrait? 0:Responsive(context).isTabletLandscape? 0:5.sp,),

                            Expanded(child:
                              RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                    text: "From 12:00 Pm to 2:00 PM -",
                                    style: AppTextStyle()
                                        .regularText()
                                        .copyWith(color: AppTheme.lightTextColor, fontSize:Responsive(context).isTabletPortrait? 8.sp:Responsive(context).isTabletLandscape? 5.sp:12.sp),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: " 2 Bookings",
                                        style: AppTextStyle().regularText().copyWith(
                                          fontSize:Responsive(context).isTabletLandscape? 8.sp:12.sp,
                                          color: const Color(0xff404180),
                                        ),
                                      ),
                                    ]),
                              )),
                            ],
                          ),
                          trailing: InkWell(
                            onTap: (){
                              CancelConsultationsBottomSheet().cancelConsultationsBottomSheet(context);
                            },
                            child: Container(
                                height: 40.sp,
                                width: 40.sp,
                                decoration: const BoxDecoration(
                                  color: Color(0xffFFEDED),
                                  shape: BoxShape.circle,
                                ),
                                child:FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: SvgPicture.asset(
                                      height:Responsive(context).isTabletLandscape?10.sp:16.sp,
                                      width: 16.sp,
                                      fit: BoxFit.contain,
                                      AssetsImages.trashIcon),
                                )
                            ),
                          ),

                        ),
                      ),



                    ],
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

