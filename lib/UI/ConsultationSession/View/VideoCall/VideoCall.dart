import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../Utils/Constants/AssetsImage.dart';
import '../../../../component/AppNetworkImage/AppNetworkImage.dart';
import '../../../../component/Button/CustomCircleButton.dart';
import '../../../../utils/constants/app_theme.dart';
import 'LeaveVideoCallBottomSheet.dart';

class VideoCallScreen extends StatefulWidget {
  VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  String doctorImageUrl =
      "https://www.shutterstock.com/shutterstock/videos/1062413938/thumb/1.jpg?ip=x480";

  String patientImageUrl =
      "https://img.freepik.com/premium-photo/asian-female-patient-with-happiness-lying-bed-hospital_33413-1834.jpg";
  bool showIcon = true;

  disableIcon() {
    Future.delayed(
        Duration(seconds: 3),
        () => setState(() {
              showIcon = false;
            }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    disableIcon();
  }

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Scaffold(
      body: InkWell(
        onTap: () {
          setState(() {
            showIcon = true;
            disableIcon();
          });
        },
        child: Stack(
          children: [
            appNetworkImage(
              doctorImageUrl,
              double.infinity,
              double.infinity,
              BoxFit.cover,
            ),
            Padding(
              padding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(horizontal:20.sp ): EdgeInsets.all(20.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  showIcon
                      ? Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.all( Responsive(context).isTabletLandscape?5.sp: 12.sp),
                            child: CustomCircleIconButton(
                              height:  Responsive(context).isTabletLandscape? 20.sp: 40.sp,
                              width:  Responsive(context).isTabletLandscape? 20.sp:40.sp,
                              boxColor: AppTheme.white,
                              padding: EdgeInsets.all(8.sp),
                              iconImage: Image.asset(
                                AssetsImages.messageTextIcon,
                                color: AppTheme.appPrimaryColor,
                              ),
                              // iconColor: AppTheme.white,
                            ),
                          ),
                        )
                      : SizedBox(),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ClipRRect(
                          child: appNetworkImage(
                            patientImageUrl,
                            Responsive(context).isTabletLandscape?80.sp: 130.sp,
                            Responsive(context).isTabletLandscape? 100.sp:165.sp,
                            BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                        ),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      showIcon
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomCircleIconButton(
                                  height:  Responsive(context).isTabletLandscape? 30.sp: 60.sp,
                                  width:  Responsive(context).isTabletLandscape? 30.sp:60.sp,
                                  boxColor: AppTheme.grey,
                                  padding: EdgeInsets.all( Responsive(context).isTabletLandscape?8.sp: 12.sp),
                                  iconImage: Image.asset(AssetsImages.videoCameraIcon),
                                  iconSize: Responsive(context).isTabletLandscape?30.sp:null,
                                ),
                                CustomCircleIconButton(
                                  height:  Responsive(context).isTabletLandscape? 40.sp: 80.sp,
                                  width:  Responsive(context).isTabletLandscape? 40.sp:80.sp,
                                  boxColor: AppTheme.red,
                                  iconImage: Image.asset(AssetsImages.callEndIcon),
                                  padding: EdgeInsets.all( Responsive(context).isTabletLandscape?8.sp: 12.sp),
                                  onTap: () => LeaveVideoCallBottomSheet()
                                      .leaveVideoCallBottomSheet(context),
                                ),
                                CustomCircleIconButton(
                                  height:  Responsive(context).isTabletLandscape? 30.sp: 60.sp,
                                  width:  Responsive(context).isTabletLandscape? 30.sp:60.sp,
                                  boxColor: AppTheme.grey,
                                  padding: EdgeInsets.all(Responsive(context).isTabletLandscape?8.sp: 12.sp),
                                  iconImage: Image.asset(AssetsImages.microphoneIcon),
                                ),
                              ],
                            )
                          : SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
