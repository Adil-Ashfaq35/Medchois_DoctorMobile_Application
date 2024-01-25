import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../component/Text/TextStyle.dart';
import '../../../utils/constants/app_theme.dart';
import '../../Home/Provider/AppointmentProvider.dart';
import '../Provider/ScheduleProvider.dart';
import 'SessionDuration.dart';
import 'ShiftAddBottomSheet.dart';

class ScheduleBody extends StatelessWidget {
  const ScheduleBody({super.key});

  @override
  Widget build(BuildContext context) {

    List<String> days=[
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
    ];

    return Scaffold(
      backgroundColor: AppTheme.white,
      body:

        Consumer<ScheduleProvider>(
        builder: (context, scheduleProvider, _) {
          Responsive(context).setOrientation(context);
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.sp),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.sp,),
                  Text(
                    "Select available days",
                    textAlign: TextAlign.center,
                    style: AppTextStyle().boldText().copyWith(color: AppTheme.appTextColor,fontWeight: FontWeight.w500, fontSize:Responsive(context).isTabletLandscape? 13.sp: 18.sp),
                  ),

               MediaQuery.removePadding(
                 context: context,
                 removeBottom: true,
                 removeTop: true,
                 child: ListView.separated(
                      shrinkWrap: true,
                     physics: const NeverScrollableScrollPhysics(),
                     itemCount: days.length,
                     itemBuilder: (context,index){
                   return  ListTile(
                     onTap: (){
                    //   TimerPickerBottomSheet().timerPickerBottomSheet(context);
                       ShiftAddBottomSheet().shiftAddBottomSheet(context);
                     },
                     trailing: Icon(Icons.arrow_forward_ios,size: 8.sp,color: const Color(0xffAEB6CA),),
                     leading:Text(days[index],
                       style: AppTextStyle().regularText().copyWith(color: AppTheme.appTextColor,fontWeight: FontWeight.w500, fontSize:Responsive(context).isTabletLandscape? 8.sp: 18.sp),
                     ),
                   );


                 }, separatorBuilder: (BuildContext context, int index) {
                       return const Divider(
                          color: Color(0xffF5F7FA),
                        );
                 },),
               ),


                  Text(
                    "Session Duration",
                    textAlign: TextAlign.center,
                    style: AppTextStyle().boldText().copyWith(color: AppTheme.appTextColor,fontWeight: FontWeight.w500, fontSize:Responsive(context).isTabletLandscape? 13.sp: 18.sp),
                  ),

                  SizedBox(height: 10.sp,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SessionDurationSelection(isChecked: scheduleProvider.selectedSession == '30 Mins', label: '30 Mins'),
                      SessionDurationSelection(isChecked: scheduleProvider.selectedSession == '45 Mins', label: '45 Mins'),
                      SessionDurationSelection(isChecked: scheduleProvider.selectedSession == '60 Mins', label: '60 Mins'),
                    ],
                  ),


                  SizedBox(height: 20.sp,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Repeat Schedule",
                        textAlign: TextAlign.center,
                        style: AppTextStyle().regularText().copyWith(color: AppTheme.appTextColor,fontWeight: FontWeight.w500, fontSize:Responsive(context).isTabletLandscape? 12.sp: 18.sp),
                      ),
                      Text(
                        "How long the schedule will be kept?",
                        textAlign: TextAlign.center,
                        style: AppTextStyle().regularText().copyWith(color: AppTheme.lightTextColor,fontWeight: FontWeight.w200, fontSize:Responsive(context).isTabletLandscape? 8.sp:12.sp),
                      ),



                      ListTile(
                        title: Text(
                          "Keep for 2 weeks from now",
                          textAlign: TextAlign.start,
                          style: AppTextStyle().regularText().copyWith(color: AppTheme.appTextColor,fontWeight: FontWeight.w600, fontSize:Responsive(context).isTabletLandscape? 8.sp:13.sp),
                        ),
                        subtitle: Text(
                          "Starts today 12 Apr  to 25 Apr",
                          textAlign: TextAlign.start,
                          style: AppTextStyle().regularText().copyWith(color: AppTheme.lightTextColor,fontWeight: FontWeight.w300, fontSize:Responsive(context).isTabletLandscape? 8.sp: 11.sp),
                        ),
                        trailing: Radio<String>(
                          value: 'other',
                         groupValue: AppointmentProvider().selectedSessionOfCancelAppointment,
                          onChanged: (value) {
                           // appointmentProvider.updateCancelSession(value);
                          },
                        ),
                      ),

                      ListTile(
                        title: Text(
                          "Keep for 4 weeks from now",
                          textAlign: TextAlign.start,
                          style: AppTextStyle().regularText().copyWith(color: AppTheme.appTextColor,fontWeight: FontWeight.w600, fontSize:Responsive(context).isTabletLandscape? 8.sp: 13.sp),
                        ),
                        subtitle: Text(
                          "Starts today 12 Apr  to 25 Apr",
                          textAlign: TextAlign.start,
                          style: AppTextStyle().regularText().copyWith(color: AppTheme.lightTextColor,fontWeight: FontWeight.w300, fontSize:Responsive(context).isTabletLandscape? 8.sp:11.sp),
                        ),
                        trailing: Radio<String>(
                          value: 'other',
                          groupValue: AppointmentProvider().selectedSessionOfCancelAppointment,
                          onChanged: (value) {
                            // appointmentProvider.updateCancelSession(value);
                          },
                        ),
                      ),

                      ListTile(
                        title: Text(
                          "Fixed",
                          textAlign: TextAlign.start,
                          style: AppTextStyle().regularText().copyWith(color: AppTheme.appTextColor,fontWeight: FontWeight.w600, fontSize:Responsive(context).isTabletLandscape? 8.sp: 13.sp),
                        ),
                        subtitle: Text(
                          "This will keep your schedule fixed",
                          textAlign: TextAlign.start,
                          style: AppTextStyle().regularText().copyWith(color: AppTheme.lightTextColor,fontWeight: FontWeight.w300, fontSize:Responsive(context).isTabletLandscape? 8.sp: 11.sp),
                        ),
                        trailing: Radio<String>(
                          value: 'other',
                          groupValue: AppointmentProvider().selectedSessionOfCancelAppointment,
                          onChanged: (value) {
                            // appointmentProvider.updateCancelSession(value);
                          },
                        ),
                      ),
                    ],
                  )





                ],
              ),
            ),
          );
        }
      ),
    );
  }


}


