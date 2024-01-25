import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:doctor_app/utils/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../component/Button/CustomCircleButton.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../utils/constants/AppIcons.dart';
import '../../../../utils/constants/AssetsImage.dart';

class DoctorSubscriberHeader extends StatelessWidget {
  TabController? tabController;
  String? imageUrl;

  DoctorSubscriberHeader({super.key, this.tabController, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      background: Container(
        height: 150.sp,
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppTheme.headerBackgroundGradient1),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(20 / 360),
                alignment: Alignment.topRight,
                child: Image.asset(
                  AssetsImages.appLogo,
                  width: 300.49.sp,
                  height: 210.5.sp,
                  alignment: const Alignment(2, 5),
                  fit: BoxFit.contain,
                  color: AppTheme.white.withOpacity(0.07),
                ),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 20.sp),
                    child: Column(
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
                                "Subscribers",
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
                        Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: Responsive(context).isTabletPortrait? 5.sp:10.sp),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape?5.sp: 15.sp, horizontal: 40.sp),
                                    decoration: BoxDecoration(
                                        color: AppTheme.white.withOpacity(0.15),
                                        borderRadius: BorderRadius.all(Radius.circular(16.sp))),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          // crossAxisAlignment: CrossAxisAlignment.c,
                                          children: [
                                            Text(
                                              "2000 Egp",
                                              style: AppTextStyle().mediumText().copyWith(
                                                fontSize:Responsive(context).isTabletLandscape? 8.sp: 14.sp,
                                                color: AppTheme.white,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.sp,
                                            ),
                                            Text(
                                              "Earnings",
                                              textAlign: TextAlign.center,
                                              style: AppTextStyle().regularText().copyWith(
                                                  color: AppTheme.white, fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height:Responsive(context).isTabletLandscape? 15.sp:25.sp,
                                          child: const VerticalDivider(color: AppTheme.white),
                                        ),
                                        Column(
                                          // crossAxisAlignment: CrossAxisAlignment.c,
                                          children: [
                                            Text(
                                              "24 ",
                                              style: AppTextStyle().mediumText().copyWith(
                                                fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp,
                                                color: AppTheme.white,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.sp,
                                            ),
                                            Text(
                                              "Subscribers",
                                              textAlign: TextAlign.center,
                                              style: AppTextStyle().regularText().copyWith(
                                                  color: AppTheme.white, fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height:Responsive(context).isTabletLandscape? 30.sp: 56.sp,
                  child: TabBar(
                    controller: tabController,
                    padding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12.sp),
                        topLeft: Radius.circular(12.sp),
                      ),
                    ),
                    labelColor: AppTheme.appPrimaryColor,
                    unselectedLabelColor: AppTheme.white.withOpacity(0.5),
                    labelStyle: AppTextStyle().mediumText().copyWith(
                      fontSize: Responsive(context).isTabletLandscape?10.sp:null,
                    ),
                    unselectedLabelStyle: AppTextStyle().mediumText().copyWith(
                      fontSize: Responsive(context).isTabletLandscape?10.sp:null,
                    ),
                    tabs: const [
                      // first tab [you can add an icon using the icon property]
                      SizedBox(
                        width: double.infinity,
                        child: Tab(
                          iconMargin: EdgeInsets.zero,
                          text: 'Monthly',
                        ),
                      ),

                      SizedBox(
                        width: double.infinity,
                        child: Tab(
                          iconMargin: EdgeInsets.zero,
                          text: 'Quarterly',
                        ),
                      ),

                      SizedBox(
                        width: double.infinity,
                        child: Tab(
                          iconMargin: EdgeInsets.zero,
                          text: 'Yearly',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
