import 'package:doctor_app/component/BottomSheet/CustomBottomSheet.dart';
import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../component/Button/CustomFillButton.dart';
import '../../../component/Text/TextStyle.dart';
import '../../../utils/constants/AssetsImage.dart';
import '../../../utils/constants/app_theme.dart';
import 'Widget/NegativeFeedbackBottomSheet.dart';


class FeedbackBottomSheet {
  feedbackBottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double rating = 0;
    Responsive(context).setOrientation(context);
    return CustomBottomSheet().customBottomSheet(
        context,
        showDragHandle: true,
        Container(
          height:Responsive(context).isTabletLandscape? size.height*0.9 : size.height * 0.7,
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical:Responsive(context).isTabletLandscape? 0.sp:10.sp),
          decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32.sp), topLeft: Radius.circular(32.sp))),
          child: Column(
            children: [
              Container(
                height:   Responsive(context).isTabletLandscape? 23.sp:40.sp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Container(
                    //   height: 4.sp,
                    //   width: 65.sp,
                    //   decoration: BoxDecoration(
                    //       color: AppTheme.grey.withOpacity(0.2),
                    //       borderRadius: BorderRadius.all(Radius.circular(5.sp))),
                    // ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "How was your consultation?",
                        style: AppTextStyle().regularText().copyWith(fontSize:   Responsive(context).isTabletLandscape? 12.sp:18.sp),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height:   Responsive(context).isTabletLandscape? 30.sp:65.sp,
                                  width: 65.sp,
                                  child: ClipOval(
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(double.infinity),
                                      // Image radius
                                      child: const Image(image: AssetImage(AssetsImages.patientImage),)
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: Responsive(context).isTabletLandscape? 5.sp:  8.sp,
                                ),
                                Text(
                                  "Mohamed Motaz",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 12.sp:18.sp),
                                ),
                                SizedBox(
                                  height: 3.sp,
                                ),
                                Text(
                                  "Patient",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: AppTextStyle().regularText().copyWith(
                                      color: AppTheme.grey.withOpacity(0.8), fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp),
                                ),
                              ],
                            ),
                            RatingBar.builder(
                              unratedColor: AppTheme.grey.withOpacity(0.8),
                              initialRating: 0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemSize:   Responsive(context).isTabletPortrait?30.sp:Responsive(context).isTabletLandscape? 20.sp :45.sp,
                              itemPadding: EdgeInsets.symmetric(horizontal: 5.sp),
                              itemBuilder: (context, _) => Image.asset(
                                AssetsImages.starIcon,
                                height: Responsive(context).isTabletLandscape? 20.sp: 45.sp,
                                width:Responsive(context).isTabletLandscape? 20.sp: 45.sp,
                                color: AppTheme.appYellowColor,
                              ),
                              onRatingUpdate: (ratingValue) {
                                rating = ratingValue;
                                print("Rating: $rating");
                              },
                            ),
                            SizedBox(height:  Responsive(context).isTabletLandscape? 1.sp: 1.sp,),
                            Text(
                              "Your opinion help us to provide\n you the best experience",
                              textAlign: TextAlign.center,
                              style: AppTextStyle().regularText().copyWith(fontSize:   Responsive(context).isTabletPortrait? 8.sp: Responsive(context).isTabletLandscape?5.sp:14.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Responsive(context).isTabletLandscape? 0.sp:30.sp,
                    ),
                    Column(
                      children: [
                        CustomFilledButton(
                          height: Responsive(context).isTabletLandscape? 20.sp:null,
                          fontSize: Responsive(context).isTabletLandscape? 8.sp: null,
                          disableButton: false,
                          title: 'Submit',
                          onPressed: () {
                            if (rating != 0 && rating <= 2.0) {
                              Navigator.of(context).pop();
                              Future.delayed(
                                  const Duration(milliseconds: 500),
                                  () => NegativeFeedbackBottomSheet()
                                      .negativeFeedbackBottomSheet(context));
                            } else if (rating != 0 && rating > 2.0) {
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                        SizedBox(
                          height: Responsive(context).isTabletLandscape? 4.sp:8.sp,
                        ),
                        CustomFilledButton(
                          height: Responsive(context).isTabletLandscape? 20.sp:null,
                          fontSize: Responsive(context).isTabletLandscape? 8.sp: null,
                          disableButton: false,
                          borderColor: AppTheme.grey.withOpacity(0.2),
                          buttonGradients:
                              const LinearGradient(colors: [AppTheme.white, AppTheme.white]),
                          textColor: AppTheme.appPrimaryColor,
                          title: 'Skip',
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
