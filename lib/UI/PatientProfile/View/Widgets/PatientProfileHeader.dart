import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:doctor_app/utils/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../component/Button/CustomCircleButton.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../utils/constants/AppIcons.dart';
import '../../../../utils/constants/AssetsImage.dart';

class PatientProfileHeader extends StatelessWidget {
  TabController? tabController;
  String? imageUrl;

  PatientProfileHeader({super.key, this.tabController, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      background: Container(
        height:Responsive(context).isTabletLandscape?100.sp:400.sp,
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppTheme.headerBackgroundGradient1),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top:Responsive(context).isTabletLandscape? 50.sp:120.sp),
              child: Align(
                alignment: Alignment.center,
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(-30 / 360),
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetsImages.appLogo,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.contain,
                    color: AppTheme.white.withOpacity(0.06),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp),
                    child: Column(
                      children: [
                        SizedBox(
                          height:Responsive(context).isTabletLandscape? 30.sp:80.sp,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomCircleIconButton(
                                icon: AppIcons.keyboardArrowBack,
                                onTap: () => Navigator.of(context).pop(),
                              ),
                              Text(
                                "Patient Profile",
                                textAlign: TextAlign.center,
                                style:
                                    AppTextStyle().boldText().copyWith(color: AppTheme.white,
                                    fontSize: Responsive(context).isTabletLandscape? 13.sp: null,
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
                          padding: EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape? 5.sp:40.sp),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height:Responsive(context).isTabletLandscape? 30.sp:110.sp,
                                width:Responsive(context).isTabletLandscape? 30.sp:110.sp,
                                child: ClipOval(
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(double.infinity),
                                    // Image radius
                                    child: Image.asset(
                                      AssetsImages.patientImage,
                                    fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Bassel Mahdy",
                                    style: AppTextStyle().mediumText().copyWith(
                                          fontSize:Responsive(context).isTabletLandscape? 8.sp:20.sp,
                                          color: AppTheme.white,
                                        ),
                                  ),
                                  SizedBox(
                                    height:Responsive(context).isTabletLandscape? 2.sp:8.sp,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(AppIcons.male,color: AppTheme.white,),
                                      SizedBox(width: 5.sp,),
                                      Text(
                                        "Male",
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle()
                                            .regularText()
                                            .copyWith(color: AppTheme.white, fontSize:Responsive(context).isTabletLandscape? 7.sp:16.sp),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape? 5.sp:12.sp, horizontal: 20.sp),
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
                                          "66 Kg",
                                          style: AppTextStyle().mediumText().copyWith(
                                                fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp,
                                                color: AppTheme.white,
                                              ),
                                        ),
                                        SizedBox(
                                          height:Responsive(context).isTabletLandscape? 2.sp:5.sp,
                                        ),
                                        Text(
                                          "Weight",
                                          textAlign: TextAlign.center,
                                          style: AppTextStyle().regularText().copyWith(
                                              color: AppTheme.white, fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:Responsive(context).isTabletLandscape? 15.sp: 25.sp,
                                      child: const VerticalDivider(color: AppTheme.white),
                                    ),
                                    Column(
                                      // crossAxisAlignment: CrossAxisAlignment.c,
                                      children: [
                                        Text(
                                          "170 cm",
                                          style: AppTextStyle().mediumText().copyWith(
                                                fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp,
                                                color: AppTheme.white,
                                              ),
                                        ),
                                        SizedBox(
                                          height:Responsive(context).isTabletLandscape? 2.sp: 5.sp,
                                        ),
                                        Text(
                                          "Height",
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
                                          "13 %",
                                          style: AppTextStyle().mediumText().copyWith(
                                                fontSize:Responsive(context).isTabletLandscape? 8.sp: 14.sp,
                                                color: AppTheme.white,
                                              ),
                                        ),
                                        SizedBox(
                                          height:Responsive(context).isTabletLandscape? 2.sp:5.sp,
                                        ),
                                        Text(
                                          "Fats",
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
                  height:Responsive(context).isTabletLandscape? 30.sp:56.sp,
                  child: TabBar(
                    controller: tabController,
                    padding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      color: AppTheme.appScreenBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12.sp),
                        topLeft: Radius.circular(12.sp),
                      ),
                    ),
                    labelColor: AppTheme.appPrimaryColor,
                    unselectedLabelColor: AppTheme.white.withOpacity(0.5),
                    labelStyle: AppTextStyle().mediumText().copyWith(
                      fontSize: Responsive(context).isTabletLandscape? 10.sp: null,
                    ),
                    unselectedLabelStyle: AppTextStyle().mediumText().copyWith(
                      fontSize: Responsive(context).isTabletLandscape? 10.sp: null,
                    ),
                    tabs: const [
                      // first tab [you can add an icon using the icon property]
                      SizedBox(
                        width: double.infinity,
                        child: Tab(
                          iconMargin: EdgeInsets.zero,
                          text: 'Symptoms',
                        ),
                      ),

                      SizedBox(
                        width: double.infinity,
                        child: Tab(
                          iconMargin: EdgeInsets.zero,
                          text: 'Medical Info',
                        ),
                      ),

                      SizedBox(
                        width: double.infinity,
                        child: Tab(
                          iconMargin: EdgeInsets.zero,
                          text: 'Diagnosis',
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
