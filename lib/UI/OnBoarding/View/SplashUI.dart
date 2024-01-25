import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../../../utils/HelperFunction/Reponsive.dart';
import '../../../utils/constants/AssetsImage.dart';
import '../../../utils/constants/RouteConstant.dart';


class AppSplashUI extends StatefulWidget {
  const AppSplashUI({super.key});

  @override
  State<AppSplashUI> createState() => _AppSplashUIState();
}

class _AppSplashUIState extends State<AppSplashUI> {
  bool startNextAnimation = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        startNextAnimation = true;
      });
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushNamedAndRemoveUntil(RouteConstants.initialSelectLanguage, (route) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Responsive(context).setOrientation(context);
    return Scaffold(
      backgroundColor: const Color(0xff0F1022),
      body: !startNextAnimation
          ? Center(
        child: Container(
          height: 180.sp,
          width: 180.sp,
          padding: EdgeInsets.all(40.sp),
          child: Image.asset(AssetsImages.appLogo),
        ),
      )
          : Center(
        child: SizedBox(
          height: 70.sp,
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.4,
                padding: EdgeInsets.only(left: size.width * 0.2),
                child: AnimatedSplashScreen(
                  splash: AssetsImages.appLogo,
                  backgroundColor: const Color(0xff0F1022),
                  splashIconSize: 60.sp,
                  centered: false,
                  nextScreen: const SizedBox(),
                  disableNavigation: true,
                  duration: 4000,
                  splashTransition: SplashTransition.fadeTransition,
                  pageTransitionType: PageTransitionType.rightToLeftWithFade,
                ),
              ),
              Container(
                width: size.width * 0.6,
                padding: EdgeInsets.only(top: 8.sp),
                child: AnimatedSplashScreen(
                  splash: AssetsImages.medchois,
                  centered: false,
                  backgroundColor: const Color(0xff0F1022),
                  splashIconSize: 45.sp,
                  duration: 3500,
                  nextScreen: const SizedBox(),
                  disableNavigation: true,
                  splashTransition: SplashTransition.slideTransition,
                  pageTransitionType: PageTransitionType.rightToLeft,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
