

import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:doctor_app/utils/constants/AppIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Utils/Constants/AssetsImage.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../utils/constants/app_theme.dart';

class MonthlySubscribersBody extends StatelessWidget {
   MonthlySubscribersBody({super.key,});


  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      alignment: Alignment.topCenter,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 10.sp,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
      overscroll.disallowIndicator();

      return true;
      },
                child: ListView.builder(
                  physics:Responsive(context).isTabletLandscape? NeverScrollableScrollPhysics():BouncingScrollPhysics(),
                  shrinkWrap: true,
                    itemCount: 4,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context,index){
                  return  Padding(
                    padding:  EdgeInsets.symmetric(horizontal:20.sp,vertical: 20.sp),
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [


                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                maxRadius: 25.r,
                                backgroundImage:  const AssetImage(AssetsImages.patientImage),
                              ),
                              SizedBox(width: 10.sp,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Mohamed Motaz",
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle()
                                            .boldText()
                                            .copyWith(fontSize: 14.sp,fontWeight: FontWeight.w400,color: AppTheme.appTextColor,),
                                      ),
                                      SizedBox(width: 110.sp,),
                                        Row(
                                          children: [
                                            Stack(
                                              children: [
                                                SvgPicture.asset(AssetsImages.messageFilled,
                                                height: Responsive(context).isTabletLandscape? 15.sp:Responsive(context).isTabletPortrait?20.sp:20.sp,
                                                 width: Responsive(context).isTabletLandscape? 15.sp:Responsive(context).isTabletPortrait?20.sp:20.sp,
                                                  fit: BoxFit.contain,

                                                ),
                                                Positioned(
                                                  top: 2.sp,
                                                  left: 0.sp,
                                                  right: 0.sp,

                                                  child: Text("3",textAlign: TextAlign.center, style: TextStyle(
                                                    fontSize:Responsive(context).isTabletLandscape? 8.sp:10.sp,
                                                    color: AppTheme.white,
                                                  ),),
                                                )
                                              ],
                                            ),
                                            Icon(AppIcons.arrowForward,size:Responsive(context).isTabletLandscape? 30:Responsive(context).isTabletPortrait?30.sp:20.sp,color: AppTheme.lightTextColor),
                                          ],
                                        )
                                    ],
                                  ),
                                  Text(
                                    "3 sessions left . till 20/03/2022",
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle()
                                        .regularText()
                                        .copyWith(fontSize: 12.sp,fontWeight: FontWeight.w300,color: AppTheme.lightTextColor,),
                                  ),

                                  SizedBox(height: 20.sp,),

                                  Container(
                                    height: 24.sp,
                                    width: 0.7.sw,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF5F7FA),
                                      borderRadius: BorderRadius.circular(8.sp),
                                    ),
                                    child:Center(
                                      child: Text(
                                        "Next follow up : Fri 12 Apr 2022 . 2:00 PM",
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle()
                                            .regularText()
                                            .copyWith(fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppTheme.lightTextColor,),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),





                        ],
                      ),

                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }


}