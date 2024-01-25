import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../../component/Text/TextStyle.dart';
import '../../../../../utils/constants/app_theme.dart';

class ChatCard extends StatelessWidget {
  int? index;

  ChatCard({this.index});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Align(
      alignment: index!.isEven ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 10.sp),
        margin: EdgeInsets.fromLTRB(index!.isEven ? 8.sp : 0, 8.sp, index!.isEven ? 0 : 8.sp, 8.sp),
        decoration: BoxDecoration(
          color: index!.isEven
              ? AppTheme.appLightGreenColor.withOpacity(0.05)
              : AppTheme.white,
          border: Border.all(
              color:
                  index!.isEven ? AppTheme.transparent : AppTheme.grey.withOpacity(0.2),
              width: 1),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12.sp),
              topLeft: Radius.circular(index!.isEven ? 12.sp : 1.sp),
              bottomLeft: Radius.circular(12.sp),
              bottomRight: Radius.circular(index!.isEven ? 1.sp : 12.sp)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              index!.isEven ? "What would you like to ask about" : "Hi",
              style: AppTextStyle()
                  .regularText()
                  .copyWith(color: AppTheme.black, fontSize: Responsive(context).isTabletLandscape? 8.sp:14.sp),
            ),
            SizedBox(
              height: 5.sp,
            ),
            Text(
              "11:00 PM",
              style: AppTextStyle()
                  .regularText()
                  .copyWith(color: AppTheme.grey.withOpacity(0.7), fontSize:Responsive(context).isTabletLandscape? 6.sp:12.sp),
            ),
          ],
        ),
      ),
    );
  }
}
