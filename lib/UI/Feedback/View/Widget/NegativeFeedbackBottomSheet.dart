import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../component/BottomSheet/CustomBottomSheet.dart';
import '../../../../component/Button/CustomFillButton.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../component/TextField/CustomTextField.dart';
import '../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../utils/constants/AppIcons.dart';
import '../../../../utils/constants/AssetsImage.dart';
import '../../../../utils/constants/app_theme.dart';
import '../../Provider/FeedbackProvider.dart';

class NegativeFeedbackBottomSheet {
  negativeFeedbackBottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Responsive(context).setOrientation(context);
    List negativeFeedbackReasonData = [
      'Patient was insufficient',
      'Patient was rude',
      'Patient didn\'t attend',
      'Other problems',
    ];
    TextEditingController otherCommentController = TextEditingController();
    return CustomBottomSheet().customBottomSheet(context,
        showDragHandle: true,
        Consumer<FeedbackProvider>(builder: (context, feedbackProvider, _) {
      return Container(
        height: feedbackProvider.negativeFeedbackReason['reason'] == "other problems"
            ? Responsive(context).isTabletLandscape? size.height*1:size.height * 0.85
            : Responsive(context).isTabletLandscape? size.height*1:size.height * 0.65,
        padding: EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape? 5.sp:10.sp),
        decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(32.sp), topLeft: Radius.circular(32.sp))),
        child: Column(
          children: [
            Container(
              height:Responsive(context).isTabletLandscape? 15.sp:40.sp,
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      style: AppTextStyle().regularText().copyWith(fontSize:Responsive(context).isTabletLandscape? 10.sp: 18.sp),
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
                    child: Column(
                      children: [
                        SizedBox(
                          height:Responsive(context).isTabletLandscape? 5.sp:10.sp,
                        ),
                        SizedBox(
                          height:Responsive(context).isTabletLandscape? 50.sp:120.sp,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height:Responsive(context).isTabletLandscape? 30.sp: 65.sp,
                                      width:Responsive(context).isTabletLandscape? 30.sp:65.sp,
                                      child: ClipOval(
                                        child: SizedBox.fromSize(
                                          size: const Size.fromRadius(double.infinity),
                                          // Image radius
                                          child:  const Image(image: AssetImage(AssetsImages.patientImage),)
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.sp,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Mohamed Motaz",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          textAlign: TextAlign.start,
                                          style:
                                              AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 12.sp:18.sp),
                                        ),
                                        SizedBox(
                                          height:Responsive(context).isTabletLandscape? 0.sp:3.sp,
                                        ),
                                        Text(
                                          "Patient",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          textAlign: TextAlign.start,
                                          style: AppTextStyle().regularText().copyWith(
                                              color: AppTheme.grey.withOpacity(0.8),
                                              fontSize:Responsive(context).isTabletLandscape? 6.sp:14.sp),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              RatingBar.builder(
                                unratedColor: AppTheme.grey.withOpacity(0.8),
                                initialRating: 0,
                                minRating: 1,
                                direction: Axis.horizontal,
                                itemCount: 5,
                                itemSize:Responsive(context).isTabletLandscape? 15.sp:30.sp,
                                itemPadding: EdgeInsets.symmetric(horizontal: 3.sp),
                                itemBuilder: (context, _) => Image.asset(
                                  AssetsImages.starIcon,
                                  height:Responsive(context).isTabletLandscape?15.sp:30.sp,
                                  width: 30.sp,
                                  color: AppTheme.appYellowColor,
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                              Divider(
                                color: AppTheme.grey.withOpacity(0.4),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                          padding: MediaQuery.of(context).viewInsets,
                          child: Padding(
                            padding: EdgeInsets.all(15.sp),
                            child: Column(
                              children: [
                                Column(
                                  children: List.generate(
                                      negativeFeedbackReasonData.length,
                                      (index) => InkWell(
                                            onTap: () {
                                              feedbackProvider.setNegativeFeedbackReasonReason(
                                                  negativeFeedbackReasonData[index]
                                                      .toString()
                                                      .toLowerCase());
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape? 3.sp:8.sp),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "${negativeFeedbackReasonData[index]}",
                                                    textAlign: TextAlign.start,
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: AppTextStyle()
                                                        .mediumText()
                                                        .copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp),
                                                  ),
                                                  feedbackProvider.negativeFeedbackReason['reason'] == negativeFeedbackReasonData[index].toString().toLowerCase()
                                                      ? const Icon(
                                                          AppIcons.radioButton,
                                                          color: AppTheme.appPrimaryColor,
                                                        )
                                                      : Icon(
                                                          AppIcons.emptyCircle,
                                                          color:
                                                              AppTheme.grey.withOpacity(0.3),
                                                        ),
                                                ],
                                              ),
                                            ),
                                          )),
                                ),
                                feedbackProvider.negativeFeedbackReason['reason'] ==
                                        "other problems"
                                    ? CustomTextFormField(
                                        autofocus: true,
                                        controller: otherCommentController,
                                        hintText: 'Describe your problem',
                                        maxLines: 4,
                                        borderRadius: 8.sp,
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(horizontal: 15.sp):EdgeInsets.all(15.sp),
                    child: CustomFilledButton(
                      height:Responsive(context).isTabletLandscape? 25.sp: null,
                      disableButton: false,
                      title: 'Submit',
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }));
  }
}
