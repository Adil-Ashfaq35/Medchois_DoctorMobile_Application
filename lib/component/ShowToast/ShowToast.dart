import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants/app_theme.dart';
import '../Text/TextStyle.dart';

class ShowToast{

  bool isCloseClicked=false;
  Flushbar<dynamic> showFlushBar(BuildContext context,{
    required String message,
    required String leadingIcon,
    required String actionButtonText,
    required bool showActionButton,
    required bool showCloseButton,

    required VoidCallback actionButtonOnTap,
  }) {
    return Flushbar(
      message:  message,
      duration:  const Duration(minutes: 30),
      isDismissible: true,
      titleColor: AppTheme.black,
      messageColor: AppTheme.black,
      icon:  SvgPicture.asset(leadingIcon,
        height: 25.sp,
        width: 25.sp,
        fit: BoxFit.cover,
      ),
      backgroundColor: AppTheme.appScreenBackgroundColor,

      mainButton: Container(
        color: AppTheme.white,
        padding: EdgeInsets.only(left: 10.sp,right: 10.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            showActionButton?
            InkWell(
              onTap: actionButtonOnTap,
              child: Text(
                actionButtonText,
                style: AppTextStyle().regularText().copyWith(color: AppTheme.appPrimaryColor, fontSize: 12.sp,),
              ),
            ):const SizedBox.shrink(),
            SizedBox(width: 8.sp,),
            showActionButton?
            Container(
              height: 15.sp,
              width: 2.sp,
              color: Colors.grey,
            ):const SizedBox.shrink(),
            showCloseButton?
            IconButton(onPressed: (){
              if(isCloseClicked==false){
                Navigator.pop(context);
                isCloseClicked=true;
              }
            }, icon: const Icon(Icons.close,color: Color(0xff5A7184),weight: 4,)):const SizedBox.shrink(),
          ],
        ),
      ),
      flushbarPosition: FlushbarPosition.TOP,
      borderRadius: BorderRadius.circular(10.r),
      flushbarStyle: FlushbarStyle.FLOATING,
      margin: EdgeInsets.all(15.sp),
      leftBarIndicatorColor: Colors.green[500],
    );
  }


}