import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../utils/constants/AssetsImage.dart';
import '../../../../utils/constants/app_theme.dart';

class BackgroundScreenGradientAndCircles extends StatelessWidget {
  const BackgroundScreenGradientAndCircles({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(gradient: AppTheme.screenBackgroundGradient),
      padding: EdgeInsets.all(15.sp),
      child: Container(
        width:Responsive(context).isTabletLandscape?0.7.sw:double.infinity,
        height:Responsive(context).isTabletLandscape? 0.5.sh:double.infinity,
        margin: EdgeInsets.only(bottom:Responsive(context).isTabletLandscape? 80.sp:250.sp),
        child: Image.asset(AssetsImages.circleRingsImage, fit:Responsive(context).isTabletLandscape? BoxFit.cover:Responsive(context).isTabletPortrait?BoxFit.cover:BoxFit.contain),
        // child: Container(
        //   padding: EdgeInsets.all(20.sp),
        //   decoration: BoxDecoration(
        //       color: ColorConstants.transparent,
        //       shape: BoxShape.circle,
        //       border: Border.all(color: ColorConstants.white.withOpacity(0.2))),
        //   child: Container(
        //     padding: EdgeInsets.all(20.sp),
        //     decoration: BoxDecoration(
        //         color: ColorConstants.transparent,
        //         shape: BoxShape.circle,
        //         border: Border.all(color: ColorConstants.white.withOpacity(0.2))),
        //     child: Container(
        //       padding: EdgeInsets.all(20.sp),
        //       decoration: BoxDecoration(
        //           color: ColorConstants.transparent,
        //           shape: BoxShape.circle,
        //           border: Border.all(color: ColorConstants.white.withOpacity(0.2))),
        //       child: Container(
        //         padding: EdgeInsets.all(20.sp),
        //         decoration: BoxDecoration(
        //             color: ColorConstants.transparent,
        //             shape: BoxShape.circle,
        //             border: Border.all(color: ColorConstants.white.withOpacity(0.2))),
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
