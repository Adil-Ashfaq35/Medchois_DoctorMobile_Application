import 'package:country_flags/country_flags.dart';
import 'package:doctor_app/UI/Profile/Provider/MedicalProfileProvider.dart';
import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../component/BottomSheet/CustomBottomSheet.dart';
import '../../../../../../component/Button/CustomCircleButton.dart';
import '../../../../../../component/Button/CustomFillButton.dart';
import '../../../../../../component/Text/TextStyle.dart';
import '../../../../../../utils/constants/AppIcons.dart';
import '../../../../../../utils/constants/app_theme.dart';

class DeleteConfirmationBottomSheet {
  deleteConfirmationBottomSheet(BuildContext context, {AnimationController? animationController, required int index}) {
    Size size = MediaQuery.of(context).size;
    Responsive(context).setOrientation(context);
    return CustomBottomSheet().customBottomSheet(
        context,
        showDragHandle: true,
        Container(
          height:Responsive(context).isTabletLandscape? size.height*0.9:size.height * 0.4,
          decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32.sp), topLeft: Radius.circular(32.sp))),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select Type",
                      textAlign: TextAlign.center,
                      style: AppTextStyle().boldText().copyWith(
                        fontSize: Responsive(context).isTabletLandscape? 13.sp: null,
                      ),
                    ),
                    CustomCircleIconButton(
                      onTap: () => Navigator.of(context).pop(),
                      height:Responsive(context).isTabletLandscape? 12.sp:25.sp,
                      width:Responsive(context).isTabletLandscape? 12.sp:25.sp,
                      boxColor: AppTheme.grey.withOpacity(0.2),
                      icon: AppIcons.close,
                      iconColor: AppTheme.grey,
                      iconSize:Responsive(context).isTabletLandscape? 8.sp:16.sp,
                    ),
                  ],
                ),

                SizedBox(height:Responsive(context).isTabletLandscape? 15.sp:50.sp,),

                Text(
                  "Are you sure you want to delete this experience?",
                  textAlign: TextAlign.left,
                  style: AppTextStyle().regularText().copyWith(fontSize:Responsive(context).isTabletLandscape? 10.sp:14.sp,color: AppTheme.appTextColor,fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 36.sp,),
                CustomFilledButton(
                  borderColor: AppTheme.grey.withOpacity(0.2),
                  buttonGradients: const LinearGradient(colors: [
                    AppTheme.white,
                    AppTheme.white
                  ]),
                  textColor: AppTheme.white,
                  title: 'Delete',
                  btnColor: AppTheme.redColor,
                  disableButton: false,
                  onPressed: () => {
                  context.read<MedicalProfileProvider>().removeExperience(index),
                    Navigator.pop(context)
                  }),
                SizedBox(height:Responsive(context).isTabletLandscape? 15.sp:25.sp,),
                CustomFilledButton(
                    borderColor: AppTheme.grey.withOpacity(0.2),
                    buttonGradients: const LinearGradient(colors: [
                      AppTheme.white,
                      AppTheme.white
                    ]),
                    textColor: AppTheme.appPrimaryColor,
                    title: 'Cancel',
                    disableButton: false,
                    onPressed: () => {}),
              ],
            ),
          ),
        ),
        animationController: animationController);
  }
}