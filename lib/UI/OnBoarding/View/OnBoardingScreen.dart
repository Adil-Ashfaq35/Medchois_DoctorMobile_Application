
import 'package:animate_do/animate_do.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:show_up_animation/show_up_animation.dart';
import '../../../component/Button/CustomFillButton.dart';
import '../../../component/Text/TextStyle.dart';
import '../../../utils/HelperFunction/Reponsive.dart';
import '../../../utils/constants/AssetsImage.dart';
import '../../../utils/constants/RouteConstant.dart';
import '../../../utils/constants/app_theme.dart';
import 'Widgets/BackgroundScreenGradientAndCircles.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int onBoardingIndex = 0;
  List onBoardingData = [
    {
      "image": AssetsImages.manDoctorImage,
      "rightSideImage": AssetsImages.calenderIcon,
      "leftSideImage": AssetsImages.statusUpIcon,
      "thirdRightImage": AssetsImages.editCalender,
      "title": "Increase Your Bookings",
      "description": "Build your profile and make it easier for patients to see you",
    },
    {
      "image": AssetsImages.doctor2,
      "rightSideImage": AssetsImages.calenderIcon,
      "leftSideImage": AssetsImages.calenderIcon,
      "thirdRightImage": AssetsImages.editCalender,
      "title": "Affordable Prices",
      "description": "Choose a simple payment plan that suits your needs",
    },
    {
      "image": AssetsImages.doctor3,
      "rightSideImage": AssetsImages.callIcon,
      "leftSideImage": AssetsImages.chatIcon,
      "thirdRightImage": AssetsImages.videoIcon,
      "title": "Your data is secured",
      "description": "We protect your uploaded files and keep it private",
    },
  ];

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundScreenGradientAndCircles(),
          Padding(
            padding:
            Responsive(context).isTabletLandscape?
            EdgeInsets.only(top: Responsive(context).isTabletPortrait? 10.sp:Responsive(context).isTabletLandscape? 0.sp: 15.sp,bottom:Responsive(context).isTabletLandscape? 2.sp:0):
                EdgeInsets.all(15.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top:Responsive(context).isTabletPortrait? 10.sp:Responsive(context).isTabletLandscape? 10.sp: 20.sp),
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
                  child: Padding(
                      padding: EdgeInsets.only(bottom:Responsive(context).isTabletLandscape? 0.sp:8.sp),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: EdgeInsets.only(bottom:Responsive(context).isTabletPortrait?220.sp:Responsive(context).isTabletLandscape?0.sp: 310.sp),
                              height: double.infinity,
                              alignment: Alignment.bottomCenter,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  ShowUpAnimation(
                                    curve: Curves.easeInOut,
                                    child: Padding(
                                      padding:  EdgeInsets.only(bottom:Responsive(context).isTabletLandscape? 80.sp:0,top:Responsive(context).isTabletLandscape? 0:30.sp),
                                      child: Image.asset(
                                        onBoardingData[onBoardingIndex]['image'],
                                        fit: BoxFit.contain,
                                        height:Responsive(context).isTabletLandscape? 100.sp: 320.sp,
                                        width:Responsive(context).isTabletLandscape? 0.4.sw: double.infinity,
                                      ),
                                    ),
                                  ),
                                  onBoardingIndex ==1 || onBoardingIndex==2?
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape? 0.sp: 45.sp, horizontal:10.sp ),
                                    child: FadeInUp(
                                      duration: const Duration(milliseconds: 500),
                                      animate: true,
                                      child: Column(
                                        mainAxisAlignment:MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:  EdgeInsets.only(left:Responsive(context).isTabletLandscape? 50.sp: 37.sp,top:Responsive(context).isTabletLandscape?0.sp:10.sp,),
                                              child: Image.asset(
                                                onBoardingData[onBoardingIndex]['rightSideImage'],
                                                height:Responsive(context).isTabletPortrait?40.sp:Responsive(context).isTabletLandscape?30.sp: 45.sp,
                                                width:Responsive(context).isTabletPortrait?40.sp:Responsive(context).isTabletLandscape?30.sp: 45.sp,
                                                fit:Responsive(context).isTabletLandscape?BoxFit.contain: BoxFit.cover,
                                              ),
                                            ),
                                      
                                          ],
                                        ),
                                          Responsive(context).isTabletLandscape?
                                              SizedBox.shrink():
                                          SizedBox(height: 30.sp,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:  EdgeInsets.only(top:Responsive(context).isTabletLandscape?0.sp:20.sp,left:Responsive(context).isTabletLandscape? 20.sp:0 ),
                                                child: Image.asset(
                                                  onBoardingData[onBoardingIndex]['leftSideImage'],
                                                  height:Responsive(context).isTabletPortrait?40.sp:Responsive(context).isTabletLandscape?30.sp: 45.sp,
                                                  width:Responsive(context).isTabletPortrait?40.sp:Responsive(context).isTabletLandscape?30.sp: 45.sp,
                                                  fit:Responsive(context).isTabletLandscape?BoxFit.contain: BoxFit.cover,

                                                ),
                                              ),
                                              Padding(
                                                padding:  EdgeInsets.only(right: Responsive(context).isTabletLandscape? 20.sp:0),
                                                child: Image.asset(
                                                  onBoardingData[onBoardingIndex]['thirdRightImage'],
                                                  height:Responsive(context).isTabletPortrait?40.sp:Responsive(context).isTabletLandscape?30.sp: 45.sp,
                                                  width:Responsive(context).isTabletPortrait?40.sp:Responsive(context).isTabletLandscape?30.sp: 45.sp,
                                                  fit:Responsive(context).isTabletLandscape?BoxFit.contain: BoxFit.cover,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ):
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape?5.sp: 40.sp, horizontal:onBoardingIndex == 1?10.sp: 30.sp),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:onBoardingIndex == 1?MainAxisAlignment.start:MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              onBoardingData[onBoardingIndex]['leftSideImage'],
                                              height:Responsive(context).isTabletPortrait?40.sp:Responsive(context).isTabletLandscape?30.sp: 45.sp,
                                              width:Responsive(context).isTabletPortrait?40.sp:Responsive(context).isTabletLandscape?30.sp: 45.sp,
                                              fit:Responsive(context).isTabletLandscape?BoxFit.contain: BoxFit.cover,
                                            ),
                                            SizedBox(height: 20.sp,),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: onBoardingIndex == 0 ?Responsive(context).isTabletLandscape?30.sp:60.sp : 40.sp,),
                                              child: Image.asset(
                                                onBoardingData[onBoardingIndex]['rightSideImage'],
                                                height:Responsive(context).isTabletPortrait?40.sp:Responsive(context).isTabletLandscape?30.sp: 45.sp,
                                                width:Responsive(context).isTabletPortrait?40.sp:Responsive(context).isTabletLandscape?30.sp: 45.sp,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(

                              width:Responsive(context).isTabletLandscape?0.7.sw:null,
                              height:Responsive(context).isTabletPortrait?250.sp:Responsive(context).isTabletLandscape?110.sp: 343.sp,
                              padding: EdgeInsets.all(Responsive(context).isTabletLandscape?8.sp:15.sp),
                              decoration: BoxDecoration(
                                  color: AppTheme.white,
                                  borderRadius: BorderRadius.all(Radius.circular(16.sp))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        onBoardingData[onBoardingIndex]['title'],
                                        style: AppTextStyle().boldText().copyWith(
                                          fontSize: Responsive(context).isTabletLandscape?8.sp:null,
                                        ),
                                      ),
                                      Responsive(context).isTabletLandscape?
                                          SizedBox(height: 2.sp,):
                                      SizedBox(
                                        height: 8.sp,
                                      ),
                                      Text(
                                        onBoardingData[onBoardingIndex]['description'],
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle()
                                            .regularText()
                                            .copyWith(color: AppTheme.grey, fontSize: Responsive(context).isTabletLandscape?7.sp:16.sp),
                                      ),
                                    ],
                                  ),
                                  DotsIndicator(
                                    onTap: (index) => setState(() => onBoardingIndex = index),
                                    dotsCount: onBoardingData.length,
                                    position: onBoardingIndex,
                                    decorator: DotsDecorator(
                                      color: AppTheme.grey.withOpacity(0.3),
                                      activeColor: AppTheme.appPrimaryColor,
                                      size: Size.square( Responsive(context).isTabletLandscape?5.sp:12.sp),
                                      activeSize: Size.square(Responsive(context).isTabletLandscape?5.sp:12.sp),
                                      spacing: EdgeInsets.all(Responsive(context).isTabletLandscape?5.sp:8.sp),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      CustomFilledButton(
                                        height: Responsive(context).isTabletLandscape?20.sp: null,
                                        disableButton: false,
                                        fontSize: Responsive(context).isTabletLandscape?8.sp:null,
                                        title: onBoardingIndex == 2
                                            ? "Login"
                                            : 'Next',
                                        onPressed: () {
                                          if (onBoardingIndex < onBoardingData.length - 1) {
                                            setState(() {
                                              onBoardingIndex++;
                                            });
                                          } else {
                                            Navigator.of(context).pushNamedAndRemoveUntil(
                                                RouteConstants.loginScreen, (route) => false,
                                                arguments: {'showWelcomeBottomSheet': false});
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        height: 8.sp,
                                      ),
                                      onBoardingIndex == 2
                                          ? Row(
                                        children: [
                                          Expanded(
                                            child: CustomFilledButton(
                                              height: Responsive(context).isTabletLandscape?20.sp:  Responsive(context).isTabletPortrait? 50.sp:null,
                                              borderColor: AppTheme.grey.withOpacity(0.2),
                                              buttonGradients: const LinearGradient(colors: [
                                                AppTheme.white,
                                                AppTheme.white
                                              ]),
                                              btnColor: Colors.white,
                                              textColor: AppTheme.appPrimaryColor,
                                              title: 'Create Account',
                                              fontSize: Responsive(context).isTabletLandscape?8.sp:null,
                                              disableButton: false,
                                              onPressed: () =>
                                                  Navigator.of(context).pushNamed(
                                                    RouteConstants.createAccount,
                                                  ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8.sp,
                                          ),
                                        ],
                                      )
                                          : CustomFilledButton(
                                        height: Responsive(context).isTabletLandscape?20.sp:Responsive(context).isTabletPortrait? 40.sp:56.sp,
                                        borderColor: AppTheme.grey.withOpacity(0.2),
                                        buttonGradients: const LinearGradient(colors: [
                                          AppTheme.white,
                                          AppTheme.white
                                        ]),
                                        textColor: AppTheme.appPrimaryColor,
                                        title: 'Skip',
                                        fontSize: Responsive(context).isTabletLandscape?8.sp:null,
                                        disableButton: false,
                                        onPressed: () => setState(() => onBoardingIndex = 2),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
