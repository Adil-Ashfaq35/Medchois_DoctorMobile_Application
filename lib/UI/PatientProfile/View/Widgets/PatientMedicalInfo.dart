import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../component/Text/TextStyle.dart';

import '../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../utils/constants/app_theme.dart';


class PatientMedicalInfo extends StatelessWidget {
  String? imageUrl;

  PatientMedicalInfo({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Container(
      color: AppTheme.appScreenBackgroundColor,
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: Responsive(context).isTabletLandscape? 5.sp:15.sp),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24.sp),
                child: Text(
                  "Operations",
                  style: AppTextStyle().regularText().copyWith(
                    fontSize: Responsive(context).isTabletLandscape? 12.sp: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.black,
                  ),
                ),
              ),
              SizedBox(height:Responsive(context).isTabletLandscape? 8.sp:20.sp,),

              buildMedicalInfo(showDate: true,context: context),
              const Divider(color:  AppTheme.borderColor),
              buildMedicalInfo(showDate: true,context: context),
              const Divider(color:  AppTheme.borderColor),
              buildMedicalInfo(showDate: true,context: context),


              SizedBox(height:Responsive(context).isTabletLandscape? 10.sp:20.sp,),



              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24.sp),
                child: Text(
                  "Allergies",
                  style: AppTextStyle().regularText().copyWith(
                    fontSize:Responsive(context).isTabletLandscape? 12.sp: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.black,
                  ),
                ),
              ),
              SizedBox(height:Responsive(context).isTabletLandscape? 10.sp: 20.sp,),

              buildMedicalInfo(showDate: false, context: context),

              SizedBox(height:Responsive(context).isTabletLandscape? 10.sp:20.sp,),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24.sp),
                child: Text(
                  "Allergies",
                  style: AppTextStyle().regularText().copyWith(
                    fontSize:Responsive(context).isTabletLandscape? 12.sp: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.black,
                  ),
                ),
              ),
              SizedBox(height:Responsive(context).isTabletLandscape? 10.sp: 20.sp,),

              buildMedicalInfo(showDate: false,context: context),
              const Divider(color:  AppTheme.borderColor),
              buildMedicalInfo(showDate: false,context: context),

            ],
          ),
        ],
      )
    );
  }

  Padding buildMedicalInfo({required bool showDate , required BuildContext context}) {
    return Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.sp,vertical:Responsive(context).isTabletLandscape? 5.sp:10.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Ophthalmologist",
                style: AppTextStyle().regularText().copyWith(
                  fontSize:Responsive(context).isTabletLandscape?10.sp: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.black,
                ),
              ),
              showDate?
              Text(
                "12 Feb, 2020",
                style: AppTextStyle().regularText().copyWith(
                  fontSize:Responsive(context).isTabletLandscape?10.sp: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.lightTextColor,
                ),
              ):const SizedBox.shrink(),

            ],
          ),
        );
  }
}
