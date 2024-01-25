import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../component/Button/CustomCircleButton.dart';
import '../../../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../../../utils/constants/AppIcons.dart';
import '../../../../../../utils/constants/AssetsImage.dart';
import '../../../../../../utils/constants/app_theme.dart';
import 'PersonalDetailBody.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return  Scaffold(
      body:  Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: AppTheme.headerBackgroundGradient1),
            padding: EdgeInsets.only(bottom: 100.sp),
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
            height:Responsive(context).isTabletLandscape? 100.sp:250.sp,
            width: double.infinity,
            padding: EdgeInsets.all(15.sp),
            child:
                Responsive(context).isTabletLandscape?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCircleIconButton(
                      icon: AppIcons.keyboardArrowBack,
                      onTap: () => Navigator.of(context).pop(),
                    ),
                    SizedBox(
                      height:Responsive(context).isTabletLandscape? 35.sp:104.sp,
                      width: 104.sp,
                      child: Stack(
                        children: [
                          ClipOval(
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(double.infinity),
                              child:  Image(
                                image: AssetImage(AssetsImages.doctorImage),
                                fit:Responsive(context).isTabletLandscape? BoxFit.contain:Responsive(context).isTabletPortrait?BoxFit.contain:BoxFit.none,
                              ),
                            ),
                          ),
                          Responsive(context).isTabletLandscape?
                          Positioned(
                            right: 10.sp,
                            bottom: 0,
                            child: CustomCircleIconButton(
                              height:20.sp,
                              width:40.sp,
                              iconImage: SvgPicture.asset(AssetsImages.editIcon,
                                fit: BoxFit.cover,
                                height: 8.sp,
                              ),
                            ),
                          ):

                          Align(
                            alignment: Alignment.bottomRight,
                            child: CustomCircleIconButton(
                              height:32.sp,
                              width:32.sp,
                              padding: EdgeInsets.all(6.sp),
                              iconImage: SvgPicture.asset(AssetsImages.editIcon),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox.shrink(),
                  ],
                ):
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: CustomCircleIconButton(
                    icon: AppIcons.keyboardArrowBack,
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ),
                SizedBox(
                  height:Responsive(context).isTabletLandscape? 50.sp:104.sp,
                  width: 104.sp,
                  child: Stack(
                    children: [
                      ClipOval(
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(double.infinity),
                          child:  Image(
                           image: AssetImage(AssetsImages.doctorImage),
                            fit:Responsive(context).isTabletLandscape? BoxFit.contain:Responsive(context).isTabletPortrait?BoxFit.contain:BoxFit.none,
                          ),
                        ),
                      ),
                      Responsive(context).isTabletLandscape?
                      Positioned(
                        right: 10.sp,
                        bottom: 0,
                        child: CustomCircleIconButton(
                          height:30.sp,
                          width:30.sp,
                          iconImage: SvgPicture.asset(AssetsImages.editIcon,
                          fit: BoxFit.cover,
                            height: 15.sp,
                          ),
                        ),
                      ):

                      Align(
                        alignment: Alignment.bottomRight,
                        child: CustomCircleIconButton(
                          height:32.sp,
                          width:32.sp,
                          padding: EdgeInsets.all(6.sp),
                          iconImage: SvgPicture.asset(AssetsImages.editIcon),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          PersonalDetailBody()
        ],
      ),

    );
  }
}
