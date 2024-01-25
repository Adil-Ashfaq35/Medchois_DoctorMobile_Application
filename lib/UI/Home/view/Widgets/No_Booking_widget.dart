import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../component/Text/TextStyle.dart';
import '../../../../utils/constants/AssetsImage.dart';
import '../../../../utils/constants/app_theme.dart';

class NoBookingWidget extends StatelessWidget {
  const NoBookingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.7.sh,
      width: 1.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child:   Padding(
        padding:  EdgeInsets.all(8.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 0.1.sh,),
             Image(
                width: 180.sp,
                height: 180.sp,
                image: const AssetImage(
                  AssetsImages.noBooking,
                )),
            SizedBox(height: 10.sp,),

            Text(
              "No Bookings",
              textAlign: TextAlign.center,
              style: AppTextStyle()
                  .regularText()
                  .copyWith(fontSize: 18.sp,fontWeight: FontWeight.bold, color: const Color(0xFF2C91D4),),
            ),
            SizedBox(height: 10.sp,),
            Text(
              "You are not eligible to receive bookings until your license is approved",
              textAlign: TextAlign.center,
              style: AppTextStyle()
                  .regularText()
                  .copyWith(fontSize: 16.sp, color: AppTheme.lightTextColor),
            ),

          ],
        ),
      ),
    );
  }
}