import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/HelperFunction/Reponsive.dart';
import '../../utils/constants/AppIcons.dart';
import '../../utils/constants/AssetsImage.dart';
import '../../utils/constants/app_theme.dart';
import '../Button/CustomCircleButton.dart';
import '../Text/TextStyle.dart';


class AppTabBar extends StatelessWidget {
  TabController? tabController;
  double? height;
  Color? buttonBackgroundColor;
  bool showBackButton, isScrollable;
  String? title;
  Widget? actionWidget;
  void Function()? onTap;
  List<Widget>? tabs;

  AppTabBar(
      {this.tabController,
      this.height,
      this.actionWidget,
      this.onTap,
      this.tabs,
      this.buttonBackgroundColor,
      this.title,
      this.isScrollable = false,
      this.showBackButton = true});

  @override
  Widget build(BuildContext context) {
   Responsive(context).setOrientation(context);
    return Container(
      height: height==null ? Responsive(context).isTabletLandscape? 80.sp:170.sp:height,
      width: double.infinity,
      decoration: BoxDecoration(gradient: AppTheme.headerBackgroundGradient1),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(30 / 360),
              alignment: Alignment.topRight,
              child: Image.asset(
                AssetsImages.appLogo,
                width: Responsive(context).isTabletLandscape? 200.sp: 300.49.sp,
                height: Responsive(context).isTabletLandscape? 100.sp: 300.5.sp,
                alignment: const Alignment(1.5, 5),
                fit: BoxFit.contain,
                color: AppTheme.white.withOpacity(0.1),
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        showBackButton
                            ? CustomCircleIconButton(
                                height:  Responsive(context).isTabletLandscape? 20.sp:null,
                                icon: AppIcons.keyboardArrowBack,
                                iconSize:  Responsive(context).isTabletLandscape? 15.sp:null,
                                onTap: onTap ?? () => Navigator.of(context).pop(),
                              )
                            : CustomCircleIconButton(
                                icon: AppIcons.keyboardArrowBack,
                                iconColor: AppTheme.transparent,
                                boxColor: AppTheme.transparent,
                              ),
                        Text(
                          title ?? "",
                          textAlign: TextAlign.center,
                          style: AppTextStyle().boldText().copyWith(color: AppTheme.white,
                          fontSize:  Responsive(context).isTabletLandscape? 13.sp:null,

                          ),
                        ),
                        actionWidget ??
                            CustomCircleIconButton(
                              icon: AppIcons.keyboardArrowBack,
                              iconColor: AppTheme.transparent,
                              boxColor: AppTheme.transparent,
                            ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Responsive(context).isTabletLandscape? 30.sp:50.sp,
                width: double.infinity,
                child: TabBar(
                  controller: tabController,
                  padding: EdgeInsets.zero,
                  isScrollable: isScrollable,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: buttonBackgroundColor ?? AppTheme.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.sp),
                      topLeft: Radius.circular(10.sp),
                    ),
                  ),
                  splashBorderRadius: BorderRadius.circular(20),
                  dividerColor: Colors.transparent,
                  labelColor: AppTheme.appPrimaryColor,
                  unselectedLabelColor: AppTheme.white.withOpacity(0.9),
                  labelStyle: AppTextStyle().mediumText().copyWith(
                    fontSize: Responsive(context).isTabletLandscape? 10.sp:null,
                  ),
                  unselectedLabelStyle: AppTextStyle().mediumText().copyWith(
                    fontSize: Responsive(context).isTabletLandscape? 10.sp:null,
                  ),
                  tabs: tabs ?? [],

                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
