import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Services/ShareAnyThingServices/ShareAnyThingServices.dart';
import '../../../../component/Button/CustomCircleButton.dart';
import '../../../../component/Button/CustomFillButton.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../utils/constants/AppIcons.dart';
import '../../../../utils/constants/AssetsImage.dart';
import '../../../../utils/constants/app_theme.dart';


class BlogArticleDetailsScreen extends StatelessWidget {
  BlogArticleDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Stack(
        children: [
          SizedBox(
            height: 280.sp,
            width: double.infinity,
            child: Stack(
              children: [
                Image.network(
                    "https://media.istockphoto.com/id/1300036753/photo/falling-antibiotics-healthcare-background.jpg?s=612x612&w=0&k=20&c=oquxJiLqE33ePw2qML9UtKJgyYUqjkLFwxT84Pr-WPk=",
                fit: BoxFit.cover,
                  width: double.infinity,
                  height:  Responsive(context).isTabletLandscape?280.sp:280.sp,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical:Responsive(context).isTabletLandscape? 20.sp:40.sp),
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomCircleIconButton(

                          icon: AppIcons.keyboardArrowBack,
                          onTap: () => Navigator.of(context).pop(),
                        ),
                        Text(
                          "Article Details",
                          textAlign: TextAlign.center,
                          style: AppTextStyle()
                              .mediumText()
                              .copyWith(color: AppTheme.white, fontSize:Responsive(context).isTabletLandscape? 12.sp:22.sp),
                        ),
                        CustomCircleIconButton(
                          iconImage: SvgPicture.asset(AssetsImages.editIcon),
                          iconColor: AppTheme.primaryColor,
                          boxColor: AppTheme.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: Responsive(context).isTabletLandscape?80.sp:250.sp),
            decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.sp), topRight: Radius.circular(32.sp))),
            child: Column(
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 4.sp),
                          margin: EdgeInsets.symmetric(vertical: 10.sp),
                          decoration: BoxDecoration(
                              color: AppTheme.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.all(Radius.circular(20.sp))),
                          child: Text(
                            "Nutrition",
                            style: AppTextStyle()
                                .regularText()
                                .copyWith(color: AppTheme.appPrimaryColor, fontSize:Responsive(context).isTabletLandscape? 5.sp:12.sp),
                          ),
                        ),
                      ),
                      Text(
                        "12 home trends from 2020 that need to disappear",
                        style: AppTextStyle()
                            .mediumText()
                            .copyWith(color: AppTheme.black, fontSize:Responsive(context).isTabletLandscape? 12.sp:18.sp),
                      ),
                      SizedBox(
                        height: 5.sp,
                      ),
                      Text(
                        "10 Mins read . OCT 9, 2019 ",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTextStyle()
                            .regularText()
                            .copyWith(color: AppTheme.grey.withOpacity(0.8), fontSize:Responsive(context).isTabletLandscape? 5.sp:12.sp),
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Text(
                        "In this article, we’ll describe 11 cognitive distortions that humans tend to get stuck in. This list was developed by David Burns, MD, psychiatrist, pioneer of cognitive behavioral therapy, Stanford University professor, and author of the best-selling books Feeling Good \n\n"
                        "In this article, we’ll describe 11 cognitive distortions that humans tend to get stuck in. This list was developed by David Burns, MD, psychiatrist.\n\n"
                        "In this article, we’ll describe 11 cognitive distortions that humans tend to get stuck in. This list was developed by David Burns, MD, psychiatrist, pioneer of cognitive behavioral therapy, Stanford University professor, and author of the best-selling books Feeling Good \n\n",
                        style: AppTextStyle()
                            .regularText()
                            .copyWith(color: AppTheme.appTextColor, fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp),
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      // Text(
                      //   "Author",
                      //   style: AppTextStyle()
                      //       .mediumText()
                      //       .copyWith(color: AppTheme.appPurpleColor, fontSize: 16.sp),
                      // ),
                      // SizedBox(
                      //   height: 8.sp,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Row(
                      //       children: [
                      //         SizedBox(
                      //           height: 33.sp,
                      //           width: 33.sp,
                      //           child: ClipOval(
                      //             child: SizedBox.fromSize(
                      //               size: const Size.fromRadius(double.infinity),
                      //               // Image radius
                      //               child: Image.network(
                      //                   "https://www.shutterstock.com/image-photo/profile-photo-attractive-family-doc-600nw-1724693776.jpg",
                      //                  fit: BoxFit.cover,
                      //                   ),
                      //             ),
                      //           ),
                      //         ),
                      //         SizedBox(
                      //           width: 8.sp,
                      //         ),
                      //         Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Text(
                      //               "Ayman Ahmed",
                      //               overflow: TextOverflow.ellipsis,
                      //               maxLines: 1,
                      //               textAlign: TextAlign.start,
                      //               style: AppTextStyle().mediumText().copyWith(fontSize: 12.sp),
                      //             ),
                      //             SizedBox(
                      //               height: 1.sp,
                      //             ),
                      //             Text(
                      //               "Nutritionist Consultant",
                      //               overflow: TextOverflow.ellipsis,
                      //               maxLines: 1,
                      //               textAlign: TextAlign.start,
                      //               style: AppTextStyle().regularText().copyWith(
                      //                   color: AppTheme.grey.withOpacity(0.8),
                      //                   fontSize: 12.sp),
                      //             ),
                      //           ],
                      //         ),
                      //       ],
                      //     ),
                      //     // CustomFilledButton(
                      //     //   height: 38.sp,
                      //     //   width: 127.sp,
                      //     //   borderColor: AppTheme.grey.withOpacity(0.3),
                      //     //   buttonGradients: const LinearGradient(colors: [
                      //     //     AppTheme.white,
                      //     //     AppTheme.white,
                      //     //   ]),
                      //     //   textColor: AppTheme.appPrimaryColor,
                      //     //   title: 'Visit Profile',
                      //     //   disableButton: false,
                      //     //   fontFamily: englishRegular,
                      //     //   onPressed: () {},
                      //     // ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 15.sp,
                      // ),
                    ],
                  ),
                )),
                // Container(
                //   height: 70.sp,
                //   padding: EdgeInsets.all(15.sp),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     boxShadow: [
                //       BoxShadow(
                //         color: AppTheme.grey.withOpacity(0.2),
                //         offset: const Offset(0.0, -3.0), //(x,y)
                //         blurRadius: 8.0,
                //       ),
                //     ],
                //   ),
                //   child: Column(
                //     children: [
                //       Row(
                //         children: [
                //           Expanded(
                //             child: CustomFilledButton(
                //               height: 38.sp,
                //               buttonGradients: LinearGradient(colors: [
                //                 AppTheme.grey.withOpacity(0.15),
                //                 AppTheme.grey.withOpacity(0.15)
                //               ]),
                //               textColor: AppTheme.black,
                //               title: 'Share',
                //               disableButton: false,
                //               fontFamily: englishRegular,
                //               imageButtonIcon: Image.asset(
                //                 AssetsImages.exportIcon,
                //                 height: 20.sp,
                //                 width: 20.sp,
                //                 color: AppTheme.black,
                //               ),
                //               onPressed: () => ShareServices().showShareOptions(),
                //             ),
                //           ),
                //           SizedBox(
                //             width: 10.sp,
                //           ),
                //           Expanded(
                //             child: CustomFilledButton(
                //               height: 38.sp,
                //               buttonGradients: LinearGradient(colors: [
                //                 AppTheme.grey.withOpacity(0.15),
                //                 AppTheme.grey.withOpacity(0.15)
                //               ]),
                //               textColor: AppTheme.black,
                //               title: 'Save',
                //               disableButton: false,
                //               fontFamily: englishRegular,
                //               imageButtonIcon: Image.asset(
                //                 AssetsImages.saveAddIcon,
                //                 height: 20.sp,
                //                 width: 20.sp,
                //                 color: AppTheme.black,
                //               ),
                //               onPressed: () {},
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
