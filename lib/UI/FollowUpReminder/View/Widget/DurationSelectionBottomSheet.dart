
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import '../../../../component/AppDoubleScrollSpinner/AppDoubleScrollSpinner.dart';
import '../../../../component/BottomSheet/CustomBottomSheet.dart';
import '../../../../component/Button/CustomFillButton.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../utils/constants/app_theme.dart';
import '../../Provider/FollowUpProvider.dart';


class DurationSelectionBottomSheet {
  durationSelectionBottomSheet(BuildContext context,
      {AnimationController? animationController}) {
    Size size = MediaQuery.of(context).size;
    Responsive(context).setOrientation(context);
    return CustomBottomSheet().customBottomSheet(context,
        Consumer<FollowUpProvider>(
            builder: (context, appointmentProvider, _) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  height:Responsive(context).isTabletLandscape? size.height*1:size.height * 0.6,
                  padding: EdgeInsets.symmetric(vertical: 10.sp),
                  decoration: BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(32.sp),
                          topLeft: Radius.circular(32.sp))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding:
                          EdgeInsets.symmetric(vertical: 8.sp, horizontal: 14.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Frequencey",
                                textAlign: TextAlign.center,
                                style:
                                AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 13.sp:20.sp),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(Icons.close)),
                            ],
                          )),
                      SizedBox(
                        height:Responsive(context).isTabletLandscape? 0.0001.sh: 0.025.sh,
                      ),
                Center(
                  child: DualScrollSpinner(
                    leftItems: List.generate(30, (index) => (index + 1).toString()),
                    rightItems: const ['Day',],
                    onItemSelected: (leftIndex, rightIndex) {
                      // Handle the selected item
                      // print("Selected: ${leftIndex + 1} - ${rightItems[rightIndex]}");
                    },
                  ),
                ),
                      SizedBox(height:Responsive(context).isTabletLandscape? 5.sp:30.sp,),

                      Padding(
                        padding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(horizontal:20,) :EdgeInsets.all(20.sp),
                        child: CustomFilledButton(
                          borderWidth: 0.1,
                          borderColor: AppTheme.grey.withOpacity(0.2),
                          fontSize: 13.sp,
                          // buttonGradients: const LinearGradient(
                          //     colors: [AppTheme.white, AppTheme.white]),

                          textColor: AppTheme.white,
                          title: "Save",
                          disableButton: false,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }), animationController: animationController);
  }
}




