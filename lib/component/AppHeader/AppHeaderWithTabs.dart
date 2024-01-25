import 'package:doctor_app/Utils/Constants/RouteConstant.dart';
import 'package:doctor_app/component/Text/TextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../component/Button/CustomCircleButton.dart';
import '../../../../utils/constants/AssetsImage.dart';
import '../../../../utils/constants/app_theme.dart';
import '../../../utils/constants/AppIcons.dart';
import '../../utils/HelperFunction/Reponsive.dart';


class AppHeaderWithTabs extends StatelessWidget {
  TabController? tabController;
  VoidCallback ?onTap;
  String? title;
  bool showLeading;
  int tabsLength;
  List<String> tabLabelNames;
  AppHeaderWithTabs({super.key, this.tabController, this.onTap, this.title,required this.showLeading,required this.tabsLength,required this.tabLabelNames});

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
                    showLeading?
                    CustomCircleIconButton(
                      icon: AppIcons.keyboardArrowBack,
                      onTap: onTap ?? () => Navigator.of(context).pop(),
                    ):const SizedBox.shrink(),
                    Text(
                      title ?? "",
                      textAlign: TextAlign.center,
                      style: AppTextStyle().boldText().copyWith(color: AppTheme.white,
                      fontSize: Responsive(context).isTabletLandscape?16.sp:null,

                      ),
                    ),

                    Container(),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: Responsive(context).isTabletLandscape? 30.sp: 50.sp,
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
                  labelStyle: AppTextStyle().mediumText().copyWith(
                    fontSize:  Responsive(context).isTabletLandscape? 10.sp:null,
                  ),
                  unselectedLabelStyle: AppTextStyle().mediumText().copyWith(
                    fontSize:  Responsive(context).isTabletLandscape? 10.sp:null,
                  ),
                  tabs:  List.generate(
                    tabsLength,
                        (index) => Tab(
                      iconMargin: EdgeInsets.zero,
                      text: tabLabelNames[index],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
