import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Utils/Constants/AssetsImage.dart';
import '../../../../../Utils/Constants/RouteConstant.dart';
import '../../../../../component/AppNetworkImage/AppNetworkImage.dart';
import '../../../../../component/Button/CustomCircleButton.dart';
import '../../../../../component/Text/TextStyle.dart';
import '../../../../../utils/constants/AppIcons.dart';
import '../../../../../utils/constants/app_theme.dart';
import '../../AudioCall/AudioCallBottomSheet.dart';
import '../../VideoCall/VideoCallBottomSheet.dart';


class ChatConsultationHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Container(
      height:Responsive(context).isTabletLandscape? 60.sp:165.sp,
      width: double.infinity,
      decoration: BoxDecoration(gradient: AppTheme.headerBackgroundGradient1),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: RotationTransition(
              turns: new AlwaysStoppedAnimation(25 / 360),
              alignment: Alignment.topRight,
              child: Image.asset(
                AssetsImages.appLogo,
                width:Responsive(context).isTabletLandscape? 50.sp: 200.49.sp,
                height:Responsive(context).isTabletLandscape? 50.sp: 230.5.sp,
                alignment: const Alignment(2, 5),
                fit: BoxFit.contain,
                color: AppTheme.white.withOpacity(0.15),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // CustomCircleIconButton(
                      //   icon: AppIcons.keyboardArrowBack,
                      //   onTap: () => Navigator.of(context).pushNamed(
                      //       RouteConstants.sessionDetailScreen,
                      //       arguments: {"comeFromCallSession": true}),
                      // ),
                      SizedBox(
                        width: 8.sp,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height:Responsive(context).isTabletLandscape? 20.sp:35.sp,
                            width:Responsive(context).isTabletLandscape? 20.sp:35.sp,
                            child: ClipOval(
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(double.infinity),
                                child: appNetworkImage(
                                    "https://www.shutterstock.com/image-photo/profile-photo-attractive-family-doc-600nw-1724693776.jpg",
                                    double.infinity,
                                    double.infinity,
                                    BoxFit.cover),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.sp,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Eman Ahmed",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                style: AppTextStyle()
                                    .mediumText()
                                    .copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp, color: AppTheme.white),
                              ),
                              Text(
                                "Weight Consultant",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                style: AppTextStyle()
                                    .regularText()
                                    .copyWith(color: AppTheme.white, fontSize:Responsive(context).isTabletLandscape? 8.sp:12.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomCircleIconButton(
                        iconImage: Image.asset(
                          AssetsImages.videoCameraIcon,
                          color: AppTheme.appPrimaryColor,
                          height: Responsive(context).isTabletLandscape? 10.sp:null,
                        ),
                        padding: EdgeInsets.all(6.sp),
                        onTap: () => VideoCallBottomSheet().videoCallBottomSheet(context),
                      ),
                      SizedBox(
                        width: 8.sp,
                      ),
                      CustomCircleIconButton(

                        icon: AppIcons.phone,
                        iconSize:Responsive(context).isTabletLandscape? 10.sp:null,
                        onTap: () => AudioCallBottomSheet().audioCallBottomSheet(context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
