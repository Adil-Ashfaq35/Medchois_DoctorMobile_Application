import 'package:animate_do/animate_do.dart';
import 'package:country_flags/country_flags.dart';
import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_up_animation/show_up_animation.dart';
import '../../../component/Button/CustomFillButton.dart';
import '../../../component/Text/TextStyle.dart';
import '../../../utils/constants/AppIcons.dart';
import '../../../utils/constants/AssetsImage.dart';
import '../../../utils/constants/RouteConstant.dart';
import '../../../utils/constants/app_theme.dart';
import 'Widgets/BackgroundScreenGradientAndCircles.dart';

class InitialSelectLanguage extends StatefulWidget {
  InitialSelectLanguage({super.key});

  @override
  State<InitialSelectLanguage> createState() => _InitialSelectLanguageState();
}

class _InitialSelectLanguageState extends State<InitialSelectLanguage> {
  String languageSelect = "en";

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Scaffold(
        body: Stack(
          children: [
            const BackgroundScreenGradientAndCircles(),
            Padding(
              padding: EdgeInsets.all(Responsive(context).isTabletLandscape?8.sp:15.sp),
              child: FadeInUp(
                duration:const Duration(milliseconds: 1000),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: Responsive(context).isTabletPortrait? 10.sp:Responsive(context).isTabletLandscape? 0.sp: 60.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetsImages.appLogo,
                            color: AppTheme.white,
                            height:Responsive(context).isTabletLandscape? 25.sp: 49.69.sp,
                            width:Responsive(context).isTabletLandscape? 20.sp:43.33.sp,
                          ),
                          Responsive(context).isTabletLandscape?
                          SizedBox.shrink():SizedBox(
                            width: 10.sp,
                          ),
                          Image.asset(
                            AssetsImages.medchois,
                            color: AppTheme.white,
                            height:Responsive(context).isTabletLandscape? 20.sp: 49.69.sp,
                            width:Responsive(context).isTabletLandscape? 100.sp:165.sp,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ShowUpAnimation(
                          delayStart: const Duration(milliseconds: 250),
                          animationDuration: const Duration(seconds: 1),
                          curve: Curves.bounceIn,
                          direction: Direction.vertical,
                          offset: 5,
                          child: Padding(
                              padding: EdgeInsets.only(bottom:Responsive(context).isTabletLandscape? 0.sp:8.sp),
                              child: Stack(
                                children: [
                                  Responsive(context).isTabletLandscape?
                                  Padding(
                                    padding:  EdgeInsets.only(bottom: 60.sp),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        margin: EdgeInsets.only(bottom:Responsive(context).isTabletPortrait?200.sp:Responsive(context).isTabletLandscape?0.sp: 320.sp),
                                        // height: double.infinity,
                                        child: Image.asset(
                                          AssetsImages.doctorsImage,
                                          height: 130.sp,
                                          width: 0.4.sw,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ):Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      margin: EdgeInsets.only(bottom:Responsive(context).isTabletPortrait?200.sp:Responsive(context).isTabletLandscape?0.sp: 320.sp),
                                      height: double.infinity,
                                      child: Image.asset(
                                        AssetsImages.doctorsImage,
                                        height: 250.sp,
                                        width: double.infinity,
                                        fit:Responsive(context).isTabletLandscape? BoxFit.contain:BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      width:Responsive(context).isTabletLandscape?0.7.sw:null,
                                      height:Responsive(context).isTabletPortrait?250.sp:Responsive(context).isTabletLandscape?100.sp: 343.sp,
                                     padding: EdgeInsets.all(Responsive(context).isTabletLandscape?8.sp:15.sp),
                                      decoration: BoxDecoration(
                                          color: AppTheme.whiteColor,
                                          borderRadius: BorderRadius.all(Radius.circular(16.sp))),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Select Language | اختر اللغة",
                                            style: AppTextStyle().boldText().copyWith(
                                              fontSize: Responsive(context).isTabletLandscape?10.sp:null,
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              InkWell(
                                                onTap: () => setState(() => languageSelect = "en"),
                                                child: Container(
                                                  height:Responsive(context).isTabletPortrait? 40.sp:Responsive(context).isTabletLandscape? 18.sp:null,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical:Responsive(context).isTabletPortrait? 10.sp:Responsive(context).isTabletLandscape?3.sp:20.sp, horizontal: 15.sp),
                                                  decoration: BoxDecoration(
                                                      color: languageSelect == 'en'
                                                          ? AppTheme.appPrimaryColor
                                                          .withOpacity(0.1)
                                                          : AppTheme.grey.withOpacity(0.1),
                                                      border: Border.all(
                                                          width: 1.2,
                                                          color: languageSelect == 'en'
                                                              ? AppTheme.appPrimaryColor
                                                              : AppTheme.transparent),
                                                      borderRadius:
                                                      BorderRadius.all(Radius.circular(16.sp))),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          CountryFlag.fromCountryCode(
                                                            'US',
                                                            height:Responsive(context).isTabletLandscape?8.sp: 24.sp,
                                                            width: 40.sp,
                                                            borderRadius: 4.sp,
                                                          ),
                                                          SizedBox(
                                                            width: 8.sp,
                                                          ),
                                                          Text(
                                                            "English",
                                                            style: AppTextStyle()
                                                                .regularText()
                                                                .copyWith(
                                                                fontWeight: languageSelect == 'en'
                                                                    ? FontWeight.bold
                                                                    : FontWeight.w500,
                                                              fontSize: Responsive(context).isTabletLandscape?8.sp:null,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      languageSelect == 'en'
                                                          ? Icon(
                                                        AppIcons.radioButton,
                                                        color: AppTheme.appPrimaryColor,
                                                      )
                                                          : Icon(
                                                        AppIcons.emptyCircle,
                                                        color: AppTheme.grey,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height:Responsive(context).isTabletLandscape? 3.sp: 8.sp,
                                              ),
                                              InkWell(
                                                onTap: () => setState(() => languageSelect = "eg"),
                                                child: Container(
                                                  height:Responsive(context).isTabletPortrait? 40.sp:Responsive(context).isTabletLandscape? 18.sp:null,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: Responsive(context).isTabletPortrait? 10.sp:Responsive(context).isTabletLandscape?3.sp:20.sp, horizontal: 15.sp),
                                                  decoration: BoxDecoration(
                                                      color: languageSelect == 'eg'
                                                          ? AppTheme.appPrimaryColor
                                                          .withOpacity(0.1)
                                                          : AppTheme.grey.withOpacity(0.1),
                                                      border: Border.all(
                                                          width: 1.2,
                                                          color: languageSelect == 'eg'
                                                              ? AppTheme.appPrimaryColor
                                                              : AppTheme.transparent),
                                                      borderRadius:
                                                      BorderRadius.all(Radius.circular(16.sp))),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          CountryFlag.fromCountryCode(
                                                            'eg',
                                                            height:Responsive(context).isTabletLandscape? 8.sp: 24.sp,
                                                            width: 40.sp,
                                                            borderRadius: 4.sp,
                                                          ),
                                                          SizedBox(
                                                            width: 8.sp,
                                                          ),
                                                          Text(
                                                            "العربية",
                                                            style: AppTextStyle()
                                                                .regularText()
                                                                .copyWith(
                                                                fontWeight: languageSelect == 'eg'
                                                                    ? FontWeight.bold
                                                                    : FontWeight.w500,
                                                              fontSize: Responsive(context).isTabletLandscape?8.sp:null,


                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      languageSelect == 'eg'
                                                          ? Icon(
                                                        AppIcons.radioButton,
                                                        color: AppTheme.appPrimaryColor,
                                                      )
                                                          : Icon(
                                                        AppIcons.emptyCircle,
                                                        color: AppTheme.grey,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          CustomFilledButton(
                                            height: Responsive(context).isTabletPortrait? 40.sp:Responsive(context).isTabletLandscape?18.sp:null,
                                            title: 'Get started',
                                            fontSize:Responsive(context).isTabletLandscape?8.sp:null,
                                            disableButton: false,
                                            onPressed: () =>
                                                Navigator.of(context)
                                                    .pushNamedAndRemoveUntil(
                                                    RouteConstants.onBoardingScreen, (route) => false),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ))),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
