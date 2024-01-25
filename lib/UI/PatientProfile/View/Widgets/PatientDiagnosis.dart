import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:doctor_app/utils/constants/AssetsImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../component/Text/TextStyle.dart';
import '../../../../utils/constants/app_theme.dart';

class PatientDiagnosis extends StatelessWidget {
  const PatientDiagnosis({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Container(
      color: AppTheme.appScreenBackgroundColor,
      alignment: Alignment.topCenter,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.sp),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 10.sp,),
             Container(
               height:Responsive(context).isTabletLandscape? 120.sp: 210.sp,
               width: 1.sw,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10.r),
                 border: Border.all(color: AppTheme.borderColor),
               ),
               child: Padding(
                 padding:  EdgeInsets.all(8.sp),
                 child: Column(
                   children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(AssetsImages.doctorImage),
                        ),
                          SizedBox(height: 20.sp,width: 10.sp,),
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape?0.sp:5.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [

                              Text(
                                "Dr. Mostafa Moataz",
                                textAlign: TextAlign.start,
                                style:
                                AppTextStyle().regularText().copyWith(
                                    fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.black),
                              ),
                              Text(
                                "Consultant in Plant-based",
                                textAlign: TextAlign.start,
                                style:
                                AppTextStyle().regularText().copyWith(
                                    fontSize:Responsive(context).isTabletLandscape? 5.sp:12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppTheme.lightTextColor),
                              ),

                              SizedBox(height:Responsive(context).isTabletLandscape? 4.sp:15.sp,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text(
                                   "1 Jan, 2022",
                                   style: AppTextStyle().regularText().copyWith(
                                       fontSize:Responsive(context).isTabletLandscape? 10.sp:14.sp,
                                       fontWeight: FontWeight.bold,
                                       color: AppTheme.black),
                                 ),
                                 SizedBox(width: 100.sp,),
                                 Text(
                                   "A week ago",
                                   style:
                                   AppTextStyle().regularText().copyWith(
                                       fontSize:Responsive(context).isTabletLandscape? 10.sp:14.sp,
                                       fontWeight: FontWeight.bold,
                                       color: AppTheme.lightTextColor),
                                 ),
                               ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),

                     SizedBox(height:Responsive(context).isTabletLandscape? 8.sp:20.sp,),


                     const Divider(color:  AppTheme.borderColor),


                     Padding(
                       padding:  EdgeInsets.symmetric(horizontal: 10.sp),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               "Symptoms",
                               textAlign: TextAlign.start,
                               style:
                               AppTextStyle().regularText().copyWith(
                                   fontSize:Responsive(context).isTabletLandscape? 10.sp:14.sp,
                                   fontWeight: FontWeight.bold,
                                   color: AppTheme.black),
                             ),
                              SizedBox(height: 3.sp,),
                             Text(
                               "I have acne on my skin and dark spots on\n around the ",
                               textAlign: TextAlign.start,
                               style:
                               AppTextStyle().regularText().copyWith(
                                   fontSize:Responsive(context).isTabletLandscape? 8.sp:12.sp,
                                   fontWeight: FontWeight.w500,
                                   color: AppTheme.lightTextColor),
                             ),
                           ],
                         ),
                           SizedBox(height:Responsive(context).isTabletLandscape? 6.sp:15.sp,),

                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               const SizedBox.shrink(),
                               Text(
                                 "See more",
                                 textAlign: TextAlign.start,
                                 style:
                                 AppTextStyle().regularText().copyWith(
                                     fontSize:Responsive(context).isTabletLandscape? 8.sp:12.sp,
                                     fontWeight: FontWeight.bold,
                                     color: AppTheme.appPrimaryColor),
                               ),
                             ],
                           )

                         ],
                       ),
                     ),



                   ],
                 ),
               ),

             )
            ],

          ),
        ),
      ),
    );
  }
}
