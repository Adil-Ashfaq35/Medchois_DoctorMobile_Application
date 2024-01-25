import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../component/Button/CustomCircleButton.dart';
import '../../../../../../utils/constants/AppIcons.dart';
import '../../../../../../utils/constants/AssetsImage.dart';
import '../../../../../../utils/constants/app_theme.dart';
import '../../../component/Text/TextStyle.dart';
import '../../../utils/HelperFunction/Reponsive.dart';
import '../Widgets/PatientMenuBody.dart';


class PatientSessionMenuScreen extends StatelessWidget {
  const PatientSessionMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return  Scaffold(
      body:  Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(gradient: AppTheme.headerBackgroundGradient1),
            padding: EdgeInsets.only(bottom:Responsive(context).isTabletLandscape? 60.sp: 120.sp),
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(-30 / 360),
              child: Image.asset(
                AssetsImages.appLogo,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.contain,
                color: AppTheme.white.withOpacity(0.06),
              ),
            ),
          ),
          Container(
            height:Responsive(context).isTabletLandscape? 80.sp: 290.sp,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10.sp,vertical:Responsive(context).isTabletLandscape? 20.sp:20.sp),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height:Responsive(context).isTabletLandscape? 20.sp: 80.sp,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment:  Responsive(context).isTabletLandscape?CrossAxisAlignment.start: CrossAxisAlignment.center,
                      children: [
                        CustomCircleIconButton(
                          icon: AppIcons.keyboardArrowBack,
                          onTap: () => Navigator.of(context).pop(),
                        ),
                        Text(
                          "Session Details",
                          textAlign: TextAlign.center,
                          style:
                          AppTextStyle().boldText().copyWith(color: AppTheme.white,
                            fontSize: Responsive(context).isTabletLandscape? 14.sp: null,
                          ),
                        ),
                        SizedBox(
                          height: 40.sp,
                          width: 40.sp,
                        )
                      ],
                    ),
                  ),

                  SizedBox(height:Responsive(context).isTabletLandscape? 5.sp:20.sp,),

                  Column(
                    children: [
                      SizedBox(
                        height:Responsive(context).isTabletLandscape? 30.sp:104.sp,
                        width: 104.sp,
                        child: Stack(
                          children: [
                            ClipOval(
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(double.infinity),
                                child: const Image(
                                  image: AssetImage(AssetsImages.patientImage),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Mohamed Motaz",
                        textAlign: TextAlign.center,
                        style: AppTextStyle().boldText().copyWith(color: AppTheme.white,fontSize:Responsive(context).isTabletLandscape? 12.sp:20.sp),
                      ),
                      SizedBox(height:Responsive(context).isTabletLandscape? 1.sp:8.sp,),
                      Text(
                        "12, Apr 2020  . 100 EGP",
                        textAlign: TextAlign.center,
                        style: AppTextStyle().regularText().copyWith(color: AppTheme.white,fontSize:Responsive(context).isTabletLandscape? 5.sp:10.sp),
                      ),


                    ],
                  ),
                ],
              ),
            ),
          ),

          PatientMenuBody(),

        ],
      ),

    );
  }
}
