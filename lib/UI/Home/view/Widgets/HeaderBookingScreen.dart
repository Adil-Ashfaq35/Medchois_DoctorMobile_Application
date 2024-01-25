import 'package:doctor_app/Utils/Constants/RouteConstant.dart';
import 'package:doctor_app/component/Text/TextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../component/Button/CustomCircleButton.dart';
import '../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../utils/constants/AssetsImage.dart';
import '../../../../utils/constants/app_theme.dart';


class HeaderBookingScreen extends StatelessWidget {
  TabController? tabController;
   HeaderBookingScreen({super.key, this.tabController});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
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
            Stack(
              children: [
                /// top header section
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 10.sp),
                  child: Container(
                    height: 121.sp,
                    padding: EdgeInsets.symmetric(horizontal: 15.sp),
                    child: Row(
                      crossAxisAlignment:Responsive(context).isTabletLandscape? CrossAxisAlignment.start:CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment:Responsive(context).isTabletLandscape? CrossAxisAlignment.start:CrossAxisAlignment.center,
                          children: [
                            CustomCircleIconButton(
                              height: Responsive(context).isTabletLandscape? 20.sp:48.sp,
                              width: Responsive(context).isTabletLandscape? 20.sp: 48.sp,
                              padding: EdgeInsets.all(2.sp),
                              iconImage: Image.asset(
                                AssetsImages.doctorImage,
                                fit: BoxFit.cover,
                                // color: AppTheme.appPrimaryColor,
                              ),
                            ),
                            SizedBox(
                              width: 10.sp,
                            ),
                            Column(
                              mainAxisAlignment: Responsive(context).isTabletLandscape?MainAxisAlignment.start:MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Good Afternoon",
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle()
                                      .regularText()
                                      .copyWith(fontSize: Responsive(context).isTabletLandscape? 8.sp: 12.sp, color: AppTheme.white),
                                ),
                                Text(
                                  "Dr. Eman Ahmed",
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle()
                                      .boldText()
                                      .copyWith(fontSize: Responsive(context).isTabletLandscape? 10.sp:16.sp, color: AppTheme.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: ()=>Navigator.pushNamed(context, RouteConstants.notificationScreen),
                          child: Container(
                            height: Responsive(context).isTabletLandscape?20.sp:34.sp,
                            width: Responsive(context).isTabletLandscape?20.sp:34.sp,
                            padding: EdgeInsets.all(5.sp),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppTheme.white.withOpacity(0.5))),
                            child: Stack(
                              children: [
                                Image.asset(
                                  AssetsImages.bellIcon,
                                  color: AppTheme.white,
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    height:Responsive(context).isTabletLandscape? 5.sp: 10.sp,
                                    width:Responsive(context).isTabletLandscape? 5.sp: 10.sp,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppTheme.red,
                                        border: Border.all(color: AppTheme.white, width: 1.5)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


                ///
      
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
                        fontSize: Responsive(context).isTabletLandscape? 10.sp:null,
                      ),
                      unselectedLabelStyle: AppTextStyle().mediumText().copyWith(
                        fontSize:  Responsive(context).isTabletLandscape? 10.sp:null,
                      ),
                      tabs: const [
                        // first tab [you can add an icon using the icon property]
                        SizedBox(
                          width: double.infinity,
                          child: Tab(
                            text: 'Upcoming',
                          ),
                        ),

                        SizedBox(
                          width: double.infinity,
                          child: Tab(
                            text: 'Pending',
                          ),
                        ),
                      ],
                    ),
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
