import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../component/BottomSheet/CustomBottomSheet.dart';
import '../../../../component/Button/CustomCircleButton.dart';
import '../../../../component/Button/CustomFillButton.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../utils/constants/AppIcons.dart';
import '../../../../utils/constants/app_theme.dart';


class HistoryDetailBottomSheet {
  historyDetailBottomSheet(BuildContext context,
      {AnimationController? animationController, String? date}) {
    Size size = MediaQuery.of(context).size;
    Responsive(context).setOrientation(context);

    List prescriptionDataList = [
      {
        "name": "Diagnose",
        "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      },
      {"name": "Diagnotic", "description": "X-Ray - Magnetic resonance"},
    ];
    List recommendedMedicinesList = [
      {"name": "Duetact - 500gm", "description": "1 tablet - After Launch - for 7 days"},
      {"name": "Duetact - 500gm", "description": "1 tablet - After Launch - for 7 days"},
    ];
    String imageUrl =
        "https://images.pexels.com/photos/159211/headache-pain-pills-medication-159211.jpeg";

    return CustomBottomSheet().customBottomSheet(
        context,
        Container(
          height:Responsive(context).isTabletLandscape? size.height*0.9 : size.height * 0.85,
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
          decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32.sp), topLeft: Radius.circular(32.sp))),
          child: Column(
            children: [
              Container(
                height:Responsive(context).isTabletLandscape? 25.sp:40.sp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 4.sp,
                      width: 65.sp,
                      decoration: BoxDecoration(
                          color: AppTheme.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(5.sp))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          date!,
                          textAlign: TextAlign.center,
                          style: AppTextStyle().boldText().copyWith(
                            fontSize: Responsive(context).isTabletLandscape? 13.sp:null,
                          ),
                        ),
                        CustomCircleIconButton(
                          onTap: () => Navigator.of(context).pop(),
                          height:Responsive(context).isTabletLandscape? 15.sp:25.sp,
                          width: 25.sp,
                          boxColor: AppTheme.grey.withOpacity(0.2),
                          icon: AppIcons.close,
                          iconColor: AppTheme.grey,
                          iconSize:Responsive(context).isTabletLandscape? 8.sp:16.sp,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height:Responsive(context).isTabletLandscape? 10.sp:20.sp,
                  ),
                  Column(
                    children: List.generate(
                        prescriptionDataList.length,
                        (index) => Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(15.sp),
                              margin: EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape? 2.sp:8.sp),
                              decoration: BoxDecoration(
                                color: AppTheme.white,
                                border: Border.all(
                                    color: AppTheme.grey.withOpacity(0.15), width: 0.8),
                                borderRadius: BorderRadius.all(Radius.circular(12.sp)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    prescriptionDataList[index]['name'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    style: AppTextStyle().boldText().copyWith(fontSize:Responsive(context).isTabletLandscape? 12.sp: 18.sp),
                                  ),
                                  SizedBox(
                                    height: 3.sp,
                                  ),
                                  Text(
                                    prescriptionDataList[index]['description'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    textAlign: TextAlign.start,
                                    style: AppTextStyle().regularText().copyWith(
                                        color: AppTheme.grey.withOpacity(0.8),
                                        fontSize:Responsive(context).isTabletLandscape? 8.sp:16.sp),
                                  ),
                                ],
                              ),
                            )),
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  Container(
                    padding: EdgeInsets.all(15.sp),
                    decoration: BoxDecoration(
                      color: AppTheme.white,
                      border: Border.all(color: AppTheme.grey.withOpacity(0.15), width: 0.8),
                      borderRadius: BorderRadius.all(Radius.circular(12.sp)),
                    ),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(
                        "Recommended Medicines",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: AppTextStyle().boldText().copyWith(fontSize:Responsive(context).isTabletLandscape? 12.sp:18.sp),
                      ),
                      Column(
                        children: List.generate(
                            recommendedMedicinesList.length,
                            (index) => Container(
                                  width: double.infinity,
                                  height:Responsive(context).isTabletLandscape? 35.sp:72.sp,
                                  padding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(horizontal: 15,): EdgeInsets.all(15.sp),
                                  margin: EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape? 3.sp:8.sp),
                                  decoration: BoxDecoration(
                                    color: AppTheme.grey.withOpacity(0.1),
                                    border: Border.all(
                                        color: AppTheme.grey.withOpacity(0.15), width: 0.8),
                                    borderRadius: BorderRadius.all(Radius.circular(12.sp)),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height:Responsive(context).isTabletLandscape? 20.sp:40.sp,
                                        width: 40.sp,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                                          child: Image.network(imageUrl,),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.sp,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              recommendedMedicinesList[index]['name'],
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              textAlign: TextAlign.start,
                                              style: AppTextStyle()
                                                  .mediumText()
                                                  .copyWith(fontSize:Responsive(context).isTabletLandscape? 12.sp: 14.sp),
                                            ),
                                            Text(
                                              recommendedMedicinesList[index]['description'],
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              textAlign: TextAlign.start,
                                              style: AppTextStyle().regularText().copyWith(
                                                  color: AppTheme.grey.withOpacity(0.8),
                                                  fontSize:Responsive(context).isTabletLandscape? 8.sp:12.sp),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                      )
                    ]),
                  ),
                ],
              )),
              CustomFilledButton(
                disableButton: false,
                borderColor: AppTheme.grey.withOpacity(0.2),
                buttonGradients:
                    const LinearGradient(colors: [AppTheme.white, AppTheme.white]),
                textColor: AppTheme.appPrimaryColor,
                title: 'Close',
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
        animationController: animationController);
  }
}
