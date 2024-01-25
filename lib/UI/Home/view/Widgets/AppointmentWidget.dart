import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../component/Button/CustomFillButton.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../utils/constants/AssetsImage.dart';
import '../../../../utils/constants/app_theme.dart';

class AppointmentWidget extends StatelessWidget {

 final String appointmentStartTime;
 final String appointmentEndTime;
 final String patientImage;
 final String patientName;
 final String patientSubtitle;
 final String patientFollowUpText;
 final Color patientFollowUpBgColor;
 final Color patientFollowUpTextColor;
 final Color? leftButtonTextColor;
 final Color? rightButtonTextColor;
 final String leftButtonText;
 final String rightButtonText;
 final VoidCallback leftButtonOnTap;
 final VoidCallback rightButtonOnTap;
 final VoidCallback patientSubTitleOnTap;
 final Color? leftButtonBgColor;
 final Color? rightButtonBgColor;
 final Color? leftButtonBorderColor;
 final Color? rightButtonBorderColor;
 final double? rightButtonBorderWidth;
 final double? leftButtonBorderWidth;



  const AppointmentWidget({
    super.key,
    required this.appointmentStartTime,
    required this.appointmentEndTime,
    required this.patientImage,
    required this.patientName,
    required this.patientSubtitle,
    required this.patientFollowUpText,
    required this.patientFollowUpBgColor,
    required this.patientFollowUpTextColor,
    required this.leftButtonText,
    required this.rightButtonText,
    required this.leftButtonOnTap,
    required this.rightButtonOnTap,
    required this.patientSubTitleOnTap,
    required this.leftButtonTextColor,
    required this.rightButtonTextColor,
    this.leftButtonBgColor,
    this.rightButtonBgColor,
    this.leftButtonBorderColor,
    this.rightButtonBorderColor,
    this.rightButtonBorderWidth,
    this.leftButtonBorderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(vertical:5.sp, horizontal: 12.sp ):  EdgeInsets.all(12.sp),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Appointments time part
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding:EdgeInsets.symmetric(vertical: 2.sp),
                    child: Column(
                      children: [
                        SizedBox(height: 8.sp,),
                        Text(
                          appointmentStartTime,
                          textAlign: TextAlign.center,
                          style: AppTextStyle()
                              .boldText()
                              .copyWith(fontSize:Responsive(context).isTabletLandscape? 10.sp:12.sp,fontWeight: FontWeight.w400,color: AppTheme.lightTextColor,),
                        ),
                        SizedBox(height: 4.sp,),
                        Container(
                          height: 20.sp,
                          width: 0.5.sp,
                          color: AppTheme.lightTextColor,
                        ),
                        SizedBox(height: 4.sp,),
                        Text(
                          appointmentEndTime,
                          textAlign: TextAlign.center,
                          style: AppTextStyle()
                              .boldText()
                              .copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:12.sp,fontWeight: FontWeight.w400,color: AppTheme.lightTextColor,),
                        ),
                      ],
                    ),
                  )),

              /// Doctor part

              Expanded(
                  flex: 4,
                  child: Padding(
                    padding:  EdgeInsets.all(10.sp),
                    child: Container(
                      width: 266.sp,
                      height:Responsive(context).isTabletLandscape? 100.sp: 158.sp,
                      decoration:BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x66ECEDEF),
                            blurRadius: 16,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ) ,

                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10.sp,vertical: 5.sp),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            Row(
                              children: [
                                CircleAvatar(
                                  maxRadius:Responsive(context).isTabletLandscape? 35.r:25.r,
                                  backgroundImage:  AssetImage(patientImage),
                                ),
                                SizedBox(width: 10.sp,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(
                                      patientName,
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle()
                                          .boldText()
                                          .copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp,fontWeight: FontWeight.w400,color: AppTheme.appTextColor,),
                                    ),
                                    InkWell(
                                      onTap: patientSubTitleOnTap,
                                      child: Text(
                                        patientSubtitle,
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle()
                                            .regularText()
                                            .copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:12.sp,fontWeight: FontWeight.w300,color: AppTheme.appPrimaryColor,),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),

                            SizedBox(height:Responsive(context).isTabletLandscape? 5.sp:10.sp,),

                            Container(
                              height:Responsive(context).isTabletLandscape? 15.sp:24.sp,
                              width: 1.sw,
                              decoration: BoxDecoration(
                                color:patientFollowUpBgColor,
                                borderRadius: BorderRadius.circular(8.sp),
                              ),
                              child:Center(
                                child: Text(
                                  patientFollowUpText,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle()
                                      .regularText()
                                      .copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:12.sp,fontWeight: FontWeight.w400,color: patientFollowUpTextColor,),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.sp,),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: CustomFilledButton(
                                      height:Responsive(context).isTabletLandscape? 25.sp:35.sp,
                                      borderWidth: leftButtonBorderWidth?? 0.1,
                                      borderColor:leftButtonBorderColor?? AppTheme.grey,
                                      buttonGradients:leftButtonBgColor!=null? const LinearGradient(colors: [
                                        AppTheme.white,
                                        AppTheme.white
                                      ]):AppTheme.buttonGradient,
                                      btnColor: leftButtonBgColor,
                                      textColor: leftButtonTextColor,
                                      title: leftButtonText,
                                      fontSize:Responsive(context).isTabletLandscape? 8.sp:  13.sp,
                                      disableButton: false,
                                      onPressed: leftButtonOnTap,
                                )),

                                SizedBox(width: 10.sp,),

                                Expanded(
                                  flex: 1,
                                  child: CustomFilledButton(
                                      height:Responsive(context).isTabletLandscape? 25.sp:35.sp,
                                      borderWidth:rightButtonBorderWidth?? 0,
                                      borderColor:rightButtonBorderColor?? AppTheme.grey,
                                      fontSize:Responsive(context).isTabletLandscape? 8.sp:13.sp,
                                      buttonGradients:rightButtonBgColor!=null? const LinearGradient(colors: [
                                        AppTheme.white,
                                        AppTheme.white
                                      ]):AppTheme.buttonGradient,
                                      btnColor: rightButtonBgColor,
                                      textColor: rightButtonTextColor,
                                      title: rightButtonText,
                                      disableButton: false,
                                      onPressed:rightButtonOnTap,
                                      ),
                                ),
                              ],
                            )



                          ],
                        ),
                      ),

                    ),
                  )),
            ],
          ),
        )
      ],
    );
  }
}