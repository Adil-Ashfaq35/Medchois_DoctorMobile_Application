import 'package:doctor_app/Utils/Constants/RouteConstant.dart';
import 'package:doctor_app/component/Text/TextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../component/Button/CustomCircleButton.dart';
import '../../../../utils/constants/AssetsImage.dart';
import '../../../../utils/constants/app_theme.dart';


class HeaderInComplete extends StatelessWidget {
  const HeaderInComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(gradient: AppTheme.homePageHeaderGradient),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
          right: -30.sp,
            top: 30.sp,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(25 / 360),
              alignment: Alignment.topRight,
              child: Image.asset(
                AssetsImages.appLogo,
                width: 146.71.sp,
                height: 175.82.sp,
                alignment: const Alignment(2, 5),
                fit: BoxFit.contain,
                color: AppTheme.white.withOpacity(0.051),
              ),
            ),
          ),
          Column(
            children: [
              /// top header section
              Container(
                height: 121.sp,
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomCircleIconButton(
                          height: 34.sp,
                          width: 34.sp,
                          padding: EdgeInsets.all(5.sp),
                          iconImage: Image.asset(
                            AssetsImages.profileIcon,
                            color: AppTheme.appPrimaryColor,
                          ),
                        ),
                        SizedBox(
                          width: 10.sp,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good Afternoon",
                              textAlign: TextAlign.center,
                              style: AppTextStyle()
                                  .regularText()
                                  .copyWith(fontSize: 12.sp, color: AppTheme.white),
                            ),
                            Text(
                              "Dr. Eman Ahmed",
                              textAlign: TextAlign.center,
                              style: AppTextStyle()
                                  .boldText()
                                  .copyWith(fontSize: 16.sp, color: AppTheme.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: ()=>Navigator.pushNamed(context, RouteConstants.notificationScreen),
                      child: Container(
                        height: 34.sp,
                        width: 34.sp,
                        padding: EdgeInsets.all(5.sp),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppTheme.white.withOpacity(0.5))),
                        child: Stack(
                          children: [
                            Image.asset(
                              AssetsImages.bellIcon,
                              color: AppTheme.white,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 10.sp,
                                width: 10.sp,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppTheme.red,
                                    border: Border.all(color: AppTheme.white, width: 1.5)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              /// remaining bottom section

              Expanded(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 24.sp),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Account Setup",
                            textAlign: TextAlign.center,
                            style: AppTextStyle()
                                .regularText()
                                .copyWith(fontSize: 12.sp, color: AppTheme.white),
                          ),  Text(
                            "Complete 1 step",
                            textAlign: TextAlign.center,
                            style: AppTextStyle()
                                .regularText()
                                .copyWith(fontSize: 12.sp, color: AppTheme.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.sp,),
                      LinearProgressIndicator(
                        value: 0.2, // Set to a value between 0.0 and 1.0 for progress, or null for an indeterminate (continuous) indicator.
                        backgroundColor: AppTheme.white,
                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF404180),),
                        minHeight: 10.sp,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      SizedBox(height: 20.sp,),
                      Container(
                        width: 327.sp,
                        height: 90.sp,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(16.sp),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  flex:1,
                                  child: CustomCircleIconButton(
                                    height: 40.sp,
                                    width: 40.sp,
                                    boxColor:  const Color(0xFFEDF9F7),
                                        iconImage: const Image(image: AssetImage(
                                            AssetsImages.profileOutlineIcon
                                        )),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Complete Profile",
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle()
                                            .boldText()
                                            .copyWith(fontSize: 14.sp, color: AppTheme.black),
                                      ),

                                      Text(
                                        "Build your expertise profile to publish when you go live",
                                        textAlign: TextAlign.start,
                                        style: AppTextStyle()
                                            .regularText()
                                            .copyWith(fontSize: 12.sp, color: AppTheme.lightTextColor,
                                            fontWeight: FontWeight.w300,

                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      )

                      // Align(
                      //   alignment: Alignment.bottomRight,
                      //   child: Image.asset(
                      //     AssetsImages.physicianPatientMedicineDoctor,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: 0.5.sh,
                      //   child: Padding(
                      //     padding: EdgeInsets.fromLTRB(17.sp, 5.sp, 17.sp, 25.sp),
                      //     child: Align(
                      //       alignment: Alignment.centerLeft,
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Text(
                      //             "Need Doctor\nRecommendations",
                      //             textAlign: TextAlign.start,
                      //             overflow: TextOverflow.ellipsis,
                      //             maxLines: 2,
                      //             style:
                      //             AppTextStyle().boldText().copyWith(color: AppTheme.white),
                      //           ),
                      //           SizedBox(
                      //             height: 10.sp,
                      //           ),
                      //           CustomFilledButton(
                      //             title: 'Book Now',
                      //             width: 118.sp,
                      //             height: 41.sp,
                      //             btnRadius: 50.sp,
                      //             disableButton: false,
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
