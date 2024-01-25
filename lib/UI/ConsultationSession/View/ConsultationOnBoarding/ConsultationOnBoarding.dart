// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'package:show_up_animation/show_up_animation.dart';
//
// import '../../../../component/Button/CustomFillButton.dart';
//
// class ConsultationOnBoardingScreen extends StatefulWidget {
//   const ConsultationOnBoardingScreen({super.key});
//
//   @override
//   State<ConsultationOnBoardingScreen> createState() => _ConsultationOnBoardingScreenState();
// }
//
// class _ConsultationOnBoardingScreenState extends State<ConsultationOnBoardingScreen> {
//   int onBoardingIndex = 0;
//   List onBoardingData = [
//     {
//       "image": AssetsImages.consultationOnBoardingImage1,
//       "rightSideImage": AssetsImages.noNoiseIcon,
//       "leftSideImage": AssetsImages.videoIcon,
//       "title": "Pick a suitable Spot",
//       "description": "Be prepared to open camera if you need to share something with your doctors",
//     },
//     {
//       "image": AssetsImages.consultationOnBoardingImage2,
//       "rightSideImage": AssetsImages.callCallingIcon,
//       "leftSideImage": AssetsImages.noChatMessageIcon,
//       "title": "Talk, Don’t Just Text",
//       "description":
//           "Talk to doctor while texting isn’t enough sometimes for the correct diagnosis",
//     },
//     {
//       "image": AssetsImages.consultationOnBoardingImage3,
//       "rightSideImage": AssetsImages.hospital2Icon,
//       "leftSideImage": AssetsImages.hospital1Icon,
//       "title": "We don’t replace hospitals",
//       "description":
//           "We have the efficient doctors, but some cases need to go to hospital immediatly",
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           BackgroundScreenGradientAndCircles(),
//           Padding(
//             padding: EdgeInsets.all(15.sp),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(top: 40.sp),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         AssetsImages.appLogo,
//                         color: ColorConstants.white,
//                         height: 30.sp,
//                         width: 26.sp,
//                       ),
//                       SizedBox(
//                         width: 10.sp,
//                       ),
//                       Image.asset(
//                         AssetsImages.medchois,
//                         color: ColorConstants.white,
//                         height: 30.sp,
//                         width: 102.sp,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                       padding: EdgeInsets.only(bottom: 8.sp),
//                       child: Stack(
//                         children: [
//                           Align(
//                             alignment: Alignment.bottomCenter,
//                             child: Container(
//                               margin: EdgeInsets.only(bottom: 290.sp),
//                               height: double.infinity,
//                               alignment: Alignment.bottomCenter,
//                               child: Stack(
//                                 children: [
//                                   ShowUpAnimation(
//                                     curve: Curves.easeInOut,
//                                     child: Image.asset(
//                                       onBoardingData[onBoardingIndex]['image'],
//                                       fit: BoxFit.contain,
//                                       height: 330.sp,
//                                       width: double.infinity,
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(vertical: 20.sp, horizontal: 30.sp),
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Padding(
//                                           padding: EdgeInsets.only(
//                                               top: onBoardingIndex == 1 ? 60.sp.sp : 0.sp),
//                                           child: CustomCircleIconButton(
//                                             height: 56.sp,
//                                             width: 56.sp,
//                                             padding: EdgeInsets.all(10.sp),
//                                             iconImage: Image.asset(
//                                               onBoardingData[onBoardingIndex]['leftSideImage'],
//                                               fit: BoxFit.cover,
//                                             ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: EdgeInsets.only(
//                                               top: onBoardingIndex == 1 ? 0.sp : 60.sp),
//                                           child: CustomCircleIconButton(
//                                             height: 56.sp,
//                                             width: 56.sp,
//                                             padding: EdgeInsets.all(10.sp),
//                                             iconImage: Image.asset(
//                                               onBoardingData[onBoardingIndex]['rightSideImage'],
//                                               fit: BoxFit.cover,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Align(
//                             alignment: Alignment.bottomCenter,
//                             child: Container(
//                               height: 343.sp,
//                               padding: EdgeInsets.all(15.sp),
//                               decoration: BoxDecoration(
//                                   color: ColorConstants.white,
//                                   borderRadius: BorderRadius.all(Radius.circular(16.sp))),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Column(
//                                     children: [
//                                       Text(
//                                         onBoardingData[onBoardingIndex]['title'],
//                                         style: AppTextStyle().boldText(),
//                                       ),
//                                       SizedBox(
//                                         height: 8.sp,
//                                       ),
//                                       Text(
//                                         onBoardingData[onBoardingIndex]['description'],
//                                         textAlign: TextAlign.center,
//                                         style: AppTextStyle()
//                                             .regularText()
//                                             .copyWith(color: ColorConstants.grey, fontSize: 16.sp),
//                                       ),
//                                     ],
//                                   ),
//                                   DotsIndicator(
//                                     onTap: (index) => setState(() => onBoardingIndex = index),
//                                     dotsCount: onBoardingData.length,
//                                     position: onBoardingIndex,
//                                     decorator: DotsDecorator(
//                                       color: ColorConstants.grey.withOpacity(0.3),
//                                       activeColor: ColorConstants.appPrimaryColor,
//                                       size: Size.square(12.sp),
//                                       activeSize: Size.square(12.sp),
//                                       spacing: EdgeInsets.all(8.sp),
//                                     ),
//                                   ),
//                                   Column(
//                                     children: [
//                                       CustomFilledButton(
//                                         disableButton: false,
//                                         title: onBoardingIndex == 2 ? "Finish" : 'Next',
//                                         onPressed: () {
//                                           if (onBoardingIndex < onBoardingData.length - 1) {
//                                             setState(() {
//                                               onBoardingIndex++;
//                                             });
//                                           } else {
//                                             Navigator.of(context).pushReplacementNamed(
//                                               RouteConstants.chatConsultationScreen,
//                                             );
//                                           }
//                                         },
//                                       ),
//                                       SizedBox(
//                                         height: 8.sp,
//                                       ),
//                                       CustomFilledButton(
//                                         borderColor: ColorConstants.grey.withOpacity(0.2),
//                                         buttonGradients: LinearGradient(
//                                             colors: [ColorConstants.white, ColorConstants.white]),
//                                         textColor: ColorConstants.appPrimaryColor,
//                                         title: 'Skip',
//                                         disableButton: false,
//                                         onPressed: () => setState(() => onBoardingIndex = 2),
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       )),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
