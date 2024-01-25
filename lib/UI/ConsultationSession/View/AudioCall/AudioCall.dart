import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Utils/Constants/AssetsImage.dart';
import '../../../../component/AppNetworkImage/AppNetworkImage.dart';
import '../../../../component/Button/CustomCircleButton.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../utils/constants/app_theme.dart';
import 'LeaveAudioCallBottomSheet.dart';

class AudioCallScreen extends StatelessWidget {
  AudioCallScreen({super.key});

  String imageUrl =
      "https://img.freepik.com/free-photo/portrait-smiling-young-woman-doctor-healthcare-medical-worker-pointing-fingers-left-showing-clini_1258-88433.jpg";

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(gradient: AppTheme.buttonGradient),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RotationTransition(
                  turns: new AlwaysStoppedAnimation(-65 / 360),
                  child: Image.asset(
                    AssetsImages.appLogo,
                    width: double.infinity,
                    height: Responsive(context).isTabletPortrait? 250.sp: Responsive(context).isTabletLandscape? 100.sp: 500.5.sp,
                    fit: Responsive(context).isTabletPortrait? BoxFit.contain:Responsive(context).isTabletLandscape?BoxFit.contain:BoxFit.fitWidth,
                    color: AppTheme.white.withOpacity(0.06),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: RotationTransition(
                    turns: AlwaysStoppedAnimation( Responsive(context).isTabletPortrait?30/360 :20 / 360),
                    child: Image.asset(
                      AssetsImages.appLogo,
                      width: Responsive(context).isTabletPortrait? 200.sp:Responsive(context).isTabletLandscape?100.sp:  250.49.sp,
                      height: Responsive(context).isTabletPortrait? 200.sp:Responsive(context).isTabletLandscape? 100.sp:250.5.sp,
                      alignment: const Alignment(3, 0),
                      fit: BoxFit.fitHeight,
                      color: AppTheme.white.withOpacity(0.06),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(horizontal:10.sp,vertical: 5.sp): EdgeInsets.all(20.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(top:Responsive(context).isTabletLandscape?6.sp:8.sp),
                    child: CustomCircleIconButton(
                      height:Responsive(context).isTabletPortrait? 30.sp:Responsive(context).isTabletLandscape?25.sp:40.sp,
                      width: 40.sp,
                      boxColor: AppTheme.white,
                      padding: EdgeInsets.all(8.sp),
                      iconImage: Image.asset(
                        AssetsImages.messageTextIcon,
                        color: AppTheme.appPrimaryColor,
                      ),
                      // iconColor: AppTheme.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetsImages.appLogo,
                      color: AppTheme.white,
                      height:Responsive(context).isTabletLandscape? 15.sp: 26.69.sp,
                      width:Responsive(context).isTabletLandscape? 15.sp: 25.33.sp,
                    ),
                    SizedBox(
                      width:Responsive(context).isTabletLandscape? 1.sp:10.sp,
                    ),
                    Image.asset(
                      AssetsImages.medchois,
                      color: AppTheme.white,
                      height:Responsive(context).isTabletLandscape? 15.sp: 29.69.sp,
                      width:Responsive(context).isTabletLandscape? 70.sp:102.sp,
                    ),
                  ],
                ),
                SizedBox(height:Responsive(context).isTabletLandscape? 3.sp:0.sp),
                Column(
                  children: [
                    SizedBox(
                      height:Responsive(context).isTabletPortrait? 80.sp:Responsive(context).isTabletLandscape?50.sp:115.sp,
                      width:Responsive(context).isTabletPortrait? 80.sp:Responsive(context).isTabletLandscape? 50.sp:115.sp,
                      child: ClipOval(
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(double.infinity),
                          child: appNetworkImage(
                            imageUrl,
                            double.infinity,
                            double.infinity,
                            BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height:Responsive(context).isTabletLandscape? 4.sp:12.sp,
                    ),
                    Text(
                      "Ayman Ahmed",
                      style: AppTextStyle().mediumText().copyWith(
                            color: AppTheme.white,
                        fontSize: Responsive(context).isTabletPortrait? 12.sp:Responsive(context).isTabletLandscape?8.sp:null,
                          ),
                    ),
                    Text(
                      "Nutrition Consultant",
                      style: AppTextStyle().regularText().copyWith(
                            fontSize: Responsive(context).isTabletPortrait? 12.sp:Responsive(context).isTabletLandscape? 8.sp:14.sp,
                            color: AppTheme.white,
                          ),
                    ),
                  ],
                ),
                SizedBox(),
                SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCircleIconButton(
                      height: Responsive(context).isTabletPortrait? 40.sp:Responsive(context).isTabletLandscape?30.sp:  60.sp,
                      width: 60.sp,
                      boxColor: AppTheme.grey,
                      padding: EdgeInsets.all(12.sp),
                      iconImage: Image.asset(AssetsImages.videoCameraIcon),
                    ),
                    CustomCircleIconButton(
                      height:Responsive(context).isTabletLandscape?40.sp: 80.sp,
                      width: 80.sp,
                      boxColor: AppTheme.red,
                      iconImage: Image.asset(AssetsImages.callEndIcon),
                      padding: EdgeInsets.all(10.sp),
                      onTap: () => LeaveAudioCallBottomSheet().leaveAudioCallBottomSheet(context),
                    ),
                    CustomCircleIconButton(
                      height:Responsive(context).isTabletLandscape? 30.sp:60.sp,
                      width: 60.sp,
                      boxColor: AppTheme.grey,
                      padding: EdgeInsets.all(12.sp),
                      iconImage: Image.asset(AssetsImages.microphoneIcon),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
