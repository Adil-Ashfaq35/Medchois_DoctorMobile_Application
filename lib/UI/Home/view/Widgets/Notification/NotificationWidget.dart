import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/Button/CustomFillButton.dart';
import '../../../../../component/Text/TextStyle.dart';
import '../../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../../utils/constants/app_theme.dart';

class NotificationWidget extends StatelessWidget {
 final String profileImagePath;
 final  String iconPath;
 final String title;
 final String subTitle;
 final String timeString;
 final bool isButtonRequired;
 final bool? isDoubleButtonEnable;
 final String? buttonText;
 final Color iconBackgroundColor;
 final Color? profileBackgroundColor;


 const NotificationWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.profileImagePath,
    required this.iconPath,
   required this.isButtonRequired,
    required this.timeString,
    this.buttonText,
    this.isDoubleButtonEnable=false, required this.iconBackgroundColor,  this.profileBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 5.sp,vertical: 10.sp),
      child: Column(
        children: [
          SizedBox(
            height:Responsive(context).isTabletLandscape? 80.sp:150.sp,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 1,child: Stack(
                  children: [
                    Container(
                      width:Responsive(context).isTabletLandscape? 30.sp:50.sp,
                      height:Responsive(context).isTabletLandscape? 30.sp:50.sp,
                      decoration:  BoxDecoration(
                        color: profileBackgroundColor,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(profileImagePath)),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Positioned(
                      right:Responsive(context).isTabletLandscape?40.sp:23.sp,
                      bottom: 0,
                      child: Container(
                        width:Responsive(context).isTabletLandscape? 15.sp: 25.sp,
                        height:Responsive(context).isTabletLandscape? 15.sp:25.sp,
                        decoration:  BoxDecoration(
                          color:iconBackgroundColor,
                          shape: BoxShape.circle,
                        ),
                        child: Align(
                          child: Image(
                            height:Responsive(context).isTabletLandscape? 8.sp:16.sp,
                            width:Responsive(context).isTabletLandscape? 8.sp:16.sp,
                            image: AssetImage(iconPath),),
                        ),
                      ),
                    )
                  ],
                )),
                Expanded(flex: 3,child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: AppTextStyle()
                              .regularText()
                              .copyWith(
                            fontSize:Responsive(context).isTabletLandscape? 10.sp:13.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF414042),

                          ),
                        ),
                        Text(
                          timeString,
                          style: AppTextStyle()
                              .regularText()
                              .copyWith(
                            fontSize:Responsive(context).isTabletLandscape? 8.sp:13.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFC8C9D0),

                          ),
                        ),
                      ],
                    ),
                    Text(
                      subTitle,
                      style: AppTextStyle()
                          .regularText()
                          .copyWith(
                        fontSize:Responsive(context).isTabletLandscape? 10.sp:13 .sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF92929F),

                      ),
                    ),
                    SizedBox(height: 10.sp,),
                    isButtonRequired?
                    CustomFilledButton(
                      disableButton: false,
                      btnColor: Colors.white,
                      buttonGradients: const LinearGradient(
                          colors: [
                            AppTheme.white,
                            AppTheme.white,
                          ]
                      ),
                      textColor: AppTheme.secondaryColor,
                      borderRadius: BorderRadius.circular(8.r),
                      borderColor: const Color(0xffE4E4E7),
                      title: "Enter Session",
                      onPressed: (){},
                    ):const SizedBox.shrink(),


                  ],
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}