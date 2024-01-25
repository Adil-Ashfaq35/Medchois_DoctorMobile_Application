import 'package:doctor_app/utils/constants/AssetsImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../component/Button/CustomFillButton.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../utils/constants/app_theme.dart';
import 'AppointmentWidget.dart';

class PendingAppointmentWidget extends StatefulWidget {
  const PendingAppointmentWidget({super.key});

  @override
  State<PendingAppointmentWidget> createState() => _PendingAppointmentWidgetState();
}

class _PendingAppointmentWidgetState extends State<PendingAppointmentWidget> {
  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Container(
      decoration: const BoxDecoration(
          color: AppTheme.white
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection:Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: List.generate(
                    dateList.length,
                        (index) => InkWell(
                      onTap: () {},
                      child: Container(
                        height:Responsive(context).isTabletLandscape? 40.sp:73.sp,
                        width: Responsive(context).isTabletLandscape? 40.sp:62.sp,
                        padding: EdgeInsets.all(Responsive(context).isTabletLandscape? 8.sp:10.sp),
                        margin: EdgeInsets.only(left: 15.sp, top: 10.sp, bottom: 10.sp),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppTheme.grey.withOpacity(0.5)),
                            borderRadius: BorderRadius.all(Radius.circular(8.sp))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              dateList[index]['date'],
                              style: AppTextStyle().regularText().copyWith(
                                  color: AppTheme.grey.withOpacity(0.8), fontSize:Responsive(context).isTabletLandscape? 8.sp: 14.sp),
                            ),
                            Text(
                              dateList[index]['day'],
                              style: AppTextStyle().regularText().copyWith(
                                  color: AppTheme.grey.withOpacity(0.8), fontSize:Responsive(context).isTabletLandscape? 8.sp: 14.sp),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ),

            AppointmentWidget(
              appointmentStartTime: "10 AM",
              appointmentEndTime: "10:30 AM",
              patientFollowUpBgColor:  const Color(0x0C18C9BF),
              patientFollowUpText: "Examination Consultation",
              patientFollowUpTextColor: const Color(0xFF108881),
              patientImage: AssetsImages.doctorImage,
              patientName: "Mostafa Moataz",
              patientSubtitle: "View profile",
              patientSubTitleOnTap: (){},
              leftButtonOnTap:(){},
              leftButtonText: "Reject",
              rightButtonText: "Accept",
              leftButtonTextColor: AppTheme.appPrimaryColor,
              rightButtonOnTap: (){},
              rightButtonTextColor: AppTheme.white,
              leftButtonBgColor: AppTheme.white,
              rightButtonBorderColor: AppTheme.white,
            ),


            AppointmentWidget(
              appointmentStartTime: "10 AM",
              appointmentEndTime: "12 PM",
              patientFollowUpBgColor:  const Color(0x0C2C91D4),
              patientFollowUpText: "Examination Consultation",
              patientFollowUpTextColor: AppTheme.primaryColor,
              patientImage: AssetsImages.doctorImage,
              patientName: "Mostafa Moataz",
              patientSubtitle: "View profile",
              patientSubTitleOnTap: (){},
              leftButtonOnTap:(){},
              leftButtonText: "Reject",
              rightButtonText: "Accept",
              leftButtonTextColor: AppTheme.appPrimaryColor,
              rightButtonOnTap: (){},
              rightButtonTextColor: AppTheme.white,
              leftButtonBgColor: AppTheme.white,
              rightButtonBorderColor: AppTheme.white,
            //  rightButtonBgColor: AppTheme.white,

            )




          ],

        ),
      ),
    );
  }
  List dateList = [
    {
      "day": 'Mon',
      "date": '8',
    },
    {
      "day": 'Wed',
      "date": '9',
    },
    {
      "day": 'Thu',
      "date": '10',
    },
    {
      "day": 'Fri',
      "date": '11',
    },
    {
      "day": 'Sat',
      "date": '12',
    },
    {
      "day": 'Sun',
      "date": '13',
    },
    {
      "day": 'Mon',
      "date": '14',
    },
    {
      "day": 'Tue',
      "date": '15',
    },
  ];
}


