import 'package:doctor_app/utils/constants/AppIcons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../component/Button/CustomFillButton.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../utils/constants/AssetsImage.dart';
import '../../../../utils/constants/app_theme.dart';
import '../../../Utils/Constants/RouteConstant.dart';

class PreviousSessionPatientWidget extends StatelessWidget {


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
  final VoidCallback patientSubTitleOnTap;
  final Color? leftButtonBgColor;
  final Color? rightButtonBgColor;
  final Color? leftButtonBorderColor;
  final Color? rightButtonBorderColor;
  final double? rightButtonBorderWidth;
  final double? leftButtonBorderWidth;



  const PreviousSessionPatientWidget({
    super.key,
    required this.patientImage,
    required this.patientName,
    required this.patientSubtitle,
    required this.patientFollowUpText,
    required this.patientFollowUpBgColor,
    required this.patientFollowUpTextColor,
    required this.leftButtonText,
    required this.rightButtonText,
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
          padding:  EdgeInsets.all(10.sp),
          child: Container(
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

                  InkWell(
                    onTap: ()=> Navigator.pushNamed(context, RouteConstants.patientSessionMenuScreen),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Row(children: [
                          CircleAvatar(
                            maxRadius: 25.r,
                            backgroundImage:  const AssetImage(AssetsImages.patientImage),
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
                                    .copyWith(fontSize: 14.sp,fontWeight: FontWeight.w400,color: AppTheme.appTextColor,),
                              ),
                              SizedBox(height: 3.sp,),
                              InkWell(
                                onTap: patientSubTitleOnTap,
                                child: Text(
                                  patientSubtitle,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle()
                                      .regularText()
                                      .copyWith(fontSize: 12.sp,fontWeight: FontWeight.w300,color: AppTheme.appPrimaryColor,),
                                ),
                              ),
                            ],
                          ),
                        ],),
                        IconButton(onPressed: (){}, icon: const Icon(AppIcons.arrowForward,color: AppTheme.lightTextColor,))
                      ],
                    ),
                  ),

                  SizedBox(height: 10.sp,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap:(){
                        Navigator.pushNamed(context, RouteConstants.followUpReminderScreen);
                      } ,
                      child: Container(
                        height: 24.sp,
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
                                .copyWith(fontSize: 12.sp,fontWeight: FontWeight.w400,color: patientFollowUpTextColor,),
                          ),
                        ),
                      ),
                    ),
                  ),



                ],
              ),
            ),

          ),
        )
      ],
    );
  }
}