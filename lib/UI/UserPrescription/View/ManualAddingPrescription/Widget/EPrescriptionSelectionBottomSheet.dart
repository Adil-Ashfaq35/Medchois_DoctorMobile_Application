
import 'package:doctor_app/Utils/Constants/RouteConstant.dart';
import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:doctor_app/utils/constants/AssetsImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../component/BottomSheet/CustomBottomSheet.dart';
import '../../../../../component/Button/CustomCircleButton.dart';

import '../../../../../component/Text/TextStyle.dart';
import '../../../../../utils/constants/AppIcons.dart';
import '../../../../../utils/constants/app_theme.dart';
import '../../../../Profile/View/widgets/profileSection.dart';
import '../Provider/EPrescriptionProvider.dart';


class EPrescriptionSelectionBottomSheet {
  ePrescriptionSelectionBottomSheet(BuildContext context,
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
                  height:Responsive(context).isTabletLandscape? size.height*0.9:Responsive(context).isTabletPortrait?size.height*0.5 :size.height * 0.3,
                  decoration: BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(32.sp),
                          topLeft: Radius.circular(32.sp))),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Add Prescription",
                              textAlign: TextAlign.center,
                              style: AppTextStyle().boldText().copyWith(
                                fontSize: Responsive(context).isTabletLandscape?12.sp:null,
                              ),
                            ),
                            CustomCircleIconButton(
                              onTap: () => Navigator.of(context).pop(),
                              height:Responsive(context).isTabletLandscape? 15.sp: 25.sp,
                              width: 25.sp,
                              boxColor: AppTheme.grey.withOpacity(0.2),
                              icon: AppIcons.close,
                              iconColor: AppTheme.grey,
                              iconSize:Responsive(context).isTabletLandscape? 8.sp: 16.sp,
                            ),
                          ],
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 10.sp),
                          child: Column(
                            children: [
                              ProfileSection(
                                onTap: (){
                                  Navigator.pushNamed(context, RouteConstants.addEPrescriptionScreen);
                                },
                                iconPath:AssetsImages.documentOutlined, label: 'E - Prescription',
                                iconColor: AppTheme.black,
                                iconSize:Responsive(context).isTabletLandscape? 15.sp:25.sp,
                              ),

                              SizedBox(height:Responsive(context).isTabletLandscape? 2.sp: 10.sp,),



                              ProfileSection(
                                onTap: (){},
                                iconPath:AssetsImages.uploadFromPhoneClassic, label: 'Upload Image',
                                iconColor: AppTheme.black,
                                iconSize:Responsive(context).isTabletLandscape? 15.sp:25.sp,
                              ),
                              SizedBox(height:Responsive(context).isTabletLandscape? 2.sp: 10.sp,),

                              ProfileSection(
                                onTap: (){},
                                iconPath:AssetsImages.cameraIconSvg, label: 'Take an image',
                                iconColor: AppTheme.black,
                                iconSize:Responsive(context).isTabletLandscape? 15.sp:25.sp,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }), animationController: animationController);
  }
}



