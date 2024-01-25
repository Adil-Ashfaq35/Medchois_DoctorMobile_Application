import 'dart:math';
import 'package:doctor_app/utils/constants/AppIcons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:provider/provider.dart';
import '../../../../../component/BottomSheet/CustomBottomSheet.dart';
import '../../../../../component/Button/CustomCircleButton.dart';
import '../../../../../component/Button/CustomFillButton.dart';
import '../../../../../component/Text/TextStyle.dart';
import '../../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../../utils/constants/app_theme.dart';
import '../../../Provider/ScheduleProvider.dart';
import '../RemoveWithoutBooking/NoBookingShiftRemoveBottomSheet.dart';




class CancelConsultationsBottomSheet {
  cancelConsultationsBottomSheet(BuildContext context,
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
                double maxHeight =Responsive(context).isTabletLandscape?size.height*0.9:size.height * 0.6;
                // Calculate the actual height based on content
                double actualHeight = min(constraints.maxHeight, maxHeight);

                return Container(
                  height: actualHeight,
                  padding: EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape? 2.sp:10.sp),
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(32.sp),
                      topLeft: Radius.circular(32.sp),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  IconButton(onPressed: (){
                                    Navigator.pop(context);
                                  }, icon:  Icon(Icons.arrow_back,size:  Responsive(context).isTabletLandscape? 12.sp:null,)),

                                  SizedBox(width: 5.sp,),
                                  Text(
                                    "Cancel Consultation",
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle()
                                        .mediumText()
                                        .copyWith(fontSize: Responsive(context).isTabletLandscape? 13.sp:20.sp),
                                  ),
                                ],
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
                            height: 0.04.sh,
                          ),

                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                                text: "This shift isn’t free, you’ll need to cancel this/these",
                                style: AppTextStyle()
                                    .regularText()
                                    .copyWith(color: AppTheme.lightTextColor, fontSize:Responsive(context).isTabletLandscape? 8.sp:13.sp),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: " 2",
                                    style: AppTextStyle().regularText().copyWith(
                                      fontSize:Responsive(context).isTabletLandscape? 10.sp:13.sp,
                                      color:  AppTheme.primaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " consultations first before you can delete it",
                                    style: AppTextStyle().regularText().copyWith(
                                      fontSize:Responsive(context).isTabletLandscape? 8.sp:13.sp,
                                      color: AppTheme.lightTextColor,
                                    ),
                                  ),
                                ]),
                          ),

                          SizedBox(height:Responsive(context).isTabletLandscape? 10.sp:30.sp,),

                          /// shift 1

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Shift 1",
                                style: AppTextStyle()
                                    .mediumText()
                                    .copyWith(fontSize:Responsive(context).isTabletLandscape? 10.sp:16.sp,fontWeight: FontWeight.w700),
                              ),     Text(
                                "Sun, 12 Apr  -  12:00 PM to 2:00 PM",
                                style: AppTextStyle()
                                    .mediumText()
                                    .copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:12.sp,fontWeight: FontWeight.w300,color: AppTheme.lightTextColor),
                              ),
                            ],
                          ),


                          SizedBox(height:Responsive(context).isTabletLandscape? 10.sp:20.sp,),

                          /// booking details



                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 5.sp,vertical:Responsive(context).isTabletLandscape? 5.sp:10.sp),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Booking 1",
                                      style: AppTextStyle()
                                          .mediumText()
                                          .copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:13.sp,color: AppTheme.appTextColor,fontWeight: FontWeight.w200),
                                    ),
                                    Text(
                                      "3:00 PM to 6:00 PM",
                                      style: AppTextStyle()
                                          .mediumText()
                                          .copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:12.sp,color: AppTheme.lightTextColor,fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.sp,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Booking 1",
                                      style: AppTextStyle()
                                          .mediumText()
                                          .copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:13.sp,color: AppTheme.appTextColor,fontWeight: FontWeight.w200),
                                    ),
                                    Text(
                                      "3:00 PM to 6:00 PM",
                                      style: AppTextStyle()
                                          .mediumText()
                                          .copyWith(fontSize:Responsive(context).isTabletLandscape?8.sp:12.sp,color: AppTheme.lightTextColor,fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),



                          SizedBox(height:Responsive(context).isTabletLandscape? 20.sp: 30.sp,),

                          CustomFilledButton(
                              borderColor: AppTheme.grey.withOpacity(0.2),
                              textColor: AppTheme.white,
                              title: 'Cancel consultations',
                              disableButton: false,
                              onPressed: () => {
                              Navigator.pop(context),
                              NoBookingShiftRemoveBottomSheet().noBookingShiftRemoveBottomSheet(context),


                                // RemoveConfirmationBottomSheet().removeConfirmationBottomSheet(context),
                              }),
                          SizedBox(
                            height:Responsive(context).isTabletLandscape? 5.sp:20.sp,
                          ),
                          CustomFilledButton(
                            borderWidth: 0.1,
                            borderColor: AppTheme.grey.withOpacity(0.2),
                            fontSize:Responsive(context).isTabletLandscape? null:13.sp,
                            buttonGradients: const LinearGradient(
                                colors: [AppTheme.white, AppTheme.white]),
                            btnColor: AppTheme.white,
                            textColor: AppTheme.appPrimaryColor,
                            title: "Keep",
                            disableButton: false,
                            onPressed: () {
                              Navigator.pop(context);
                             // RemoveConfirmationBottomSheet().removeConfirmationBottomSheet(context);
                            },
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

