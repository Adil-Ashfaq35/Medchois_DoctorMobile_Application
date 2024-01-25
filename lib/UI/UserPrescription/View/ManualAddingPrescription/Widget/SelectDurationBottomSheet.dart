
import 'package:doctor_app/Utils/Constants/RouteConstant.dart';
import 'package:doctor_app/utils/constants/AssetsImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../component/AppDoubleScrollSpinner/AppDoubleScrollSpinner.dart';
import '../../../../../component/BottomSheet/CustomBottomSheet.dart';
import '../../../../../component/Button/CustomCircleButton.dart';
import '../../../../../component/Button/CustomFillButton.dart';
import '../../../../../component/Text/TextStyle.dart';
import '../../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../../utils/constants/AppIcons.dart';
import '../../../../../utils/constants/app_theme.dart';
import '../../../../Profile/View/widgets/profileSection.dart';
import '../Provider/EPrescriptionProvider.dart';


class SelectDurationBottomSheet {
  selectDurationBottomSheet(BuildContext context,
      {AnimationController? animationController}) {
    Size size = MediaQuery.of(context).size;
    Responsive(context).setOrientation(context);
    return CustomBottomSheet().customBottomSheet(context,
        showDragHandle: true,
        Consumer<EPrescriptionProvider>(
            builder: (context, appointmentProvider, _) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  height:Responsive(context).isTabletPortrait?size.height*0.7 :Responsive(context).isTabletLandscape? size.height*0.9:size.height * 0.5,
                  decoration: BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(32.sp),
                          topLeft: Radius.circular(32.sp))),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Select Duration",
                              textAlign: TextAlign.center,
                              style: AppTextStyle().boldText().copyWith(
                                fontSize: Responsive(context).isTabletLandscape? 10.sp:null,
                              ),
                            ),
                            CustomCircleIconButton(
                              onTap: () => Navigator.of(context).pop(),
                              height:Responsive(context).isTabletLandscape? 15.sp: 25.sp,
                              width: 25.sp,
                              boxColor: AppTheme.grey.withOpacity(0.2),
                              icon: AppIcons.close,
                              iconColor: AppTheme.grey,
                              iconSize:Responsive(context).isTabletLandscape? 8.sp:16.sp,
                            ),
                          ],
                        ),


                        Center(
                          child: DualScrollSpinner(
                            leftItems: List.generate(30, (index) => (index + 1).toString()),
                            rightItems: const ['Daily','Weekly','Monthly'],
                            onItemSelected: (leftIndex, rightIndex) {
                              // Handle the selected item
                              // print("Selected: ${leftIndex + 1} - ${rightItems[rightIndex]}");
                            },
                          ),
                        ),

                        SizedBox(height:Responsive(context).isTabletLandscape? 20.sp:40.sp,),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.sp),
                          child: CustomFilledButton(
                            borderWidth: 0.1,
                            borderColor: AppTheme.grey.withOpacity(0.2),
                            fontSize: 13.sp,
                            // buttonGradients: const LinearGradient(
                            //     colors: [AppTheme.white, AppTheme.white]),

                            textColor: AppTheme.white,
                            title: "Set Duration",
                            disableButton: false,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              );
            }), animationController: animationController);
  }
}



