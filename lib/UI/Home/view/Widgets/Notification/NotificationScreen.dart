import 'package:doctor_app/component/Button/CustomFillButton.dart';
import 'package:doctor_app/utils/constants/AssetsImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/AppHeader/AppHeader.dart';
import '../../../../../component/Text/TextStyle.dart';
import '../../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../../utils/constants/app_theme.dart';
import 'package:flutter_html/flutter_html.dart';

import 'NotificationWidget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return  Scaffold(
       body:  Stack(
         children: [
           AppHeader(
             title: 'Notifications',
           ),
           Container(
             alignment: Alignment.topLeft,
             margin: EdgeInsets.only(top: Responsive(context).isTabletLandscape?42.sp:120.sp),
             padding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp): EdgeInsets.all(20.sp),
             decoration: BoxDecoration(color: AppTheme.white,
                 borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(Responsive(context).isTabletLandscape?20.sp: 32.sp), topRight: Radius.circular(Responsive(context).isTabletLandscape?20.sp:32.sp))),
             child: Padding(
               padding:  EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape?10.sp:30.sp),
               child:  SingleChildScrollView(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       "Today",
                       style: AppTextStyle()
                           .regularText()
                           .copyWith(
                         fontSize:Responsive(context).isTabletLandscape?12.sp:16.sp,
                         fontWeight: FontWeight.w800,
                         color: const Color(0xFF414042),
                 
                       ),
                     ),
                     SizedBox(height:Responsive(context).isTabletLandscape? 10.sp:30.sp,),
                     const NotificationWidget(title: 'Consultation Reminder',
                     subTitle: "Your session with Mohamed on 14 Apr, 2022 at 2:00 PM",
                       timeString: "01:36 PM",
                       isButtonRequired: true,
                       buttonText: "Enter Session",
                       profileImagePath: AssetsImages.doctorImage,
                       iconPath: AssetsImages.bellIcon, iconBackgroundColor: AppTheme.secondaryColor,
                     ),
                 
                 
                     Text(
                       "Yesterday",
                       style: AppTextStyle()
                           .regularText()
                           .copyWith(
                         fontSize:Responsive(context).isTabletLandscape? 12.sp:16.sp,
                         fontWeight: FontWeight.w800,
                         color: const Color(0xFF414042),
                 
                       ),
                     ),
                 
                 
                     const NotificationWidget(title: 'Consultation Reminder',
                       subTitle: "Your session with Mohamed on 14 Apr, 2022 at 2:00 PM",
                       timeString: "01:36 PM",
                       isButtonRequired: false,
                       profileImagePath: AssetsImages.doctorImage,
                       iconPath: AssetsImages.bellIcon, iconBackgroundColor: AppTheme.secondaryColor,
                     ),
                 
                 
                   ],
                 ),
               ),
             ),
           )
         ],
       ),
    );
  }
}


