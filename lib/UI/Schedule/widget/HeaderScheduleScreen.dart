import 'package:doctor_app/Utils/Constants/RouteConstant.dart';
import 'package:doctor_app/component/Text/TextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../component/Button/CustomCircleButton.dart';
import '../../../../utils/constants/AssetsImage.dart';
import '../../../../utils/constants/app_theme.dart';
import '../../../utils/constants/AppIcons.dart';


class HeaderScheduleScreen extends StatelessWidget {
  TabController? tabController;
  VoidCallback ?onTap;
  String? title;
  HeaderScheduleScreen({super.key, this.tabController, this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      background: Container(
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
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(left: 15.sp,right: 15.sp,bottom: 30.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // CustomCircleIconButton(
                    //   icon: AppIcons.keyboardArrowBack,
                    //   onTap: onTap ?? () => Navigator.of(context).pop(),
                    // ),
                    Text(
                      title ?? "",
                      textAlign: TextAlign.center,
                      style: AppTextStyle().boldText().copyWith(color: AppTheme.white),
                    ),

                    Container(),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 50.sp,
                child: TabBar(
                  controller: tabController,
                  padding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.sp),
                      topLeft: Radius.circular(10.sp),
                    ),
                  ),
                  labelColor: AppTheme.appPrimaryColor,
                  unselectedLabelColor: AppTheme.white.withOpacity(0.5),
                  labelStyle: AppTextStyle().mediumText(),
                  unselectedLabelStyle: AppTextStyle().mediumText(),
                  tabs: const [
                    // first tab [you can add an icon using the icon property]
                    SizedBox(
                      width: double.infinity,
                      child: Tab(
                        iconMargin: EdgeInsets.zero,
                        text: 'Calendar',
                      ),
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: Tab(
                        iconMargin: EdgeInsets.zero,
                        text: 'Schedule',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
