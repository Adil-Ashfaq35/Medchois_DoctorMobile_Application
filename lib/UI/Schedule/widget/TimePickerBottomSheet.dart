import 'package:doctor_app/Utils/Constants/RouteConstant.dart';
import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:provider/provider.dart';
import '../../../../component/BottomSheet/CustomBottomSheet.dart';
import '../../../../component/Button/CustomFillButton.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../component/TextField/CustomTextField.dart';
import '../../../../utils/constants/app_theme.dart';
import '../Provider/ScheduleProvider.dart';

class TimerPickerBottomSheet {
  timerPickerBottomSheet(BuildContext context,
      {AnimationController? animationController}) {
    Size size = MediaQuery.of(context).size;
    Responsive(context).setOrientation(context);
    return CustomBottomSheet().customBottomSheet(context,
        Consumer<ScheduleProvider>(
            builder: (context, appointmentProvider, _) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  height:Responsive(context).isTabletLandscape? size.height*0.9:size.height * 0.6,
                  padding: EdgeInsets.symmetric(vertical: 10.sp),
                  decoration: BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(32.sp),
                          topLeft: Radius.circular(32.sp))),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding:
                            EdgeInsets.symmetric(vertical: 8.sp, horizontal: 14.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Saturday Shifts",
                                  textAlign: TextAlign.center,
                                  style:
                                  AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 12.sp:20.sp),
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(Icons.close)),
                              ],
                            )),
                        SizedBox(
                          height: 0.025.sh,
                        ),
                    
                    
                    TimePickerSpinner(
                      is24HourMode: false,
                      itemWidth: 30.sp,
                      normalTextStyle:  TextStyle(
                          fontSize:Responsive(context).isTabletLandscape? 10.sp:24.sp,
                          color: AppTheme.lightTextColor,
                      ),
                      highlightedTextStyle:  TextStyle(
                          fontSize:Responsive(context).isTabletLandscape? 10.sp: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.appTextColor,
                      ),
                      spacing:Responsive(context).isTabletLandscape? 50.sp:50.sp,
                      itemHeight:Responsive(context).isTabletLandscape? 30.sp:80.sp,
                      isForce2Digits: true,
                      onTimeChange: (time) {
                        // setState(() {
                        //   _dateTime = time;
                        // });
                      },
                    ),
                    
                      SizedBox(height:Responsive(context).isTabletLandscape? 0.sp:25.sp,),
                    
                        Padding(
                          padding: EdgeInsets.all(20.sp),
                          child: CustomFilledButton(
                            borderWidth: 0.1,
                            borderColor: AppTheme.grey.withOpacity(0.2),
                            fontSize:Responsive(context).isTabletLandscape? null:13.sp,
                            // buttonGradients: const LinearGradient(
                            //     colors: [AppTheme.white, AppTheme.white]),
                    
                            textColor: AppTheme.white,
                            title: "Set Time",
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
            }), animationController: animationController);
  }
}
