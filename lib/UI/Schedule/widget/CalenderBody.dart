import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../component/Text/TextStyle.dart';
import '../../../utils/constants/app_theme.dart';
import 'CalenderWidgets/ViewBookingBottomSheet.dart';

class CalenderBody extends StatelessWidget {
  const CalenderBody({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 20.sp,),
        
         Container(
           height:Responsive(context).isTabletLandscape? 35.sp:60.sp,
            color: AppTheme.white,
           padding:  EdgeInsets.symmetric(horizontal: 18.sp),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                 "Today, 12 Apr",
                 textAlign: TextAlign.center,
                 style: AppTextStyle().boldText().copyWith(color: AppTheme.appTextColor, fontSize:Responsive(context).isTabletLandscape? 8.sp: 16.sp),
               ),
               Row(
                 children: [
                   Text(
                     "2 Bookings",
                     textAlign: TextAlign.center,
                     style: AppTextStyle().boldText().copyWith(color: AppTheme.lightTextColor,fontSize:Responsive(context).isTabletLandscape? 8.sp:13.sp,fontWeight: FontWeight.bold),
                   ),
                   IconButton(onPressed: (){
                     ViewNoBookingBottomSheet().viewNoBookingBottomSheet(context);
                   }, icon: const Icon(Icons.more_horiz_outlined))
                 ],
               )
             ],
           ),
         ),
         Container(
           height:Responsive(context).isTabletLandscape? 35.sp:60.sp,
            color: const Color(0xFFF5F7FA),
           padding:  EdgeInsets.symmetric(horizontal: 18.sp),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                 "Thu, 13 Apr",
                 textAlign: TextAlign.center,
                 style: AppTextStyle().boldText().copyWith(color: AppTheme.appTextColor, fontSize:Responsive(context).isTabletLandscape? 8.sp: 16.sp),
               ),
               Row(
                 children: [
                   Text(
                     "2 Bookings",
                     textAlign: TextAlign.center,
                     style: AppTextStyle().boldText().copyWith(color: AppTheme.lightTextColor,fontSize:Responsive(context).isTabletLandscape? 8.sp: 13.sp,fontWeight: FontWeight.bold),
                   ),
                   IconButton(onPressed: (){}, icon: const Icon(Icons.more_horiz_outlined))
                 ],
               )
             ],
           ),
         ),
         Container(
           height:Responsive(context).isTabletLandscape? 35.sp:60.sp,
            color: AppTheme.white,
           padding:  EdgeInsets.symmetric(horizontal: 18.sp),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                 "Friday, 14 Apr",
                 textAlign: TextAlign.center,
                 style: AppTextStyle().boldText().copyWith(color: AppTheme.appTextColor, fontSize:Responsive(context).isTabletLandscape? 8.sp: 16.sp),
               ),
               Row(
                 children: [
                   Text(
                     "No Bookings",
                     textAlign: TextAlign.center,
                     style: AppTextStyle().boldText().copyWith(color: AppTheme.lightTextColor,fontSize:Responsive(context).isTabletLandscape? 8.sp: 13.sp,fontWeight: FontWeight.bold),
                   ),
                   IconButton(onPressed: (){}, icon: const Icon(Icons.more_horiz_outlined))
                 ],
               )
             ],
           ),
         ),
         Container(
           height:Responsive(context).isTabletLandscape? 35.sp:60.sp,
            color: const Color(0xFFF5F7FA),
           padding:  EdgeInsets.symmetric(horizontal: 18.sp),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                 "Sat, 15 Apr",
                 textAlign: TextAlign.center,
                 style: AppTextStyle().boldText().copyWith(color: AppTheme.appTextColor, fontSize:Responsive(context).isTabletLandscape? 8.sp: 16.sp),
               ),
               Row(
                 children: [
                   Text(
                     "No Bookings",
                     textAlign: TextAlign.center,
                     style: AppTextStyle().boldText().copyWith(color: AppTheme.lightTextColor,fontSize:Responsive(context).isTabletLandscape? 8.sp: 13.sp,fontWeight: FontWeight.bold),
                   ),
                   IconButton(onPressed: (){}, icon: const Icon(Icons.more_horiz_outlined))
                 ],
               )
             ],
           ),
         ),
        
          ],
        ),
      ),
    );
  }
}
