
import 'package:doctor_app/Utils/Constants/RouteConstant.dart';
import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:doctor_app/utils/constants/AssetsImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../component/AppDoubleScrollSpinner/AppDoubleScrollSpinner.dart';
import '../../../../../component/BottomSheet/CustomBottomSheet.dart';
import '../../../../../component/Button/CustomCircleButton.dart';
import '../../../../../component/Button/CustomFillButton.dart';
import '../../../../../component/Text/TextStyle.dart';
import '../../../../../utils/constants/AppIcons.dart';
import '../../../../../utils/constants/app_theme.dart';

import '../../../UserPrescription/View/ManualAddingPrescription/Provider/EPrescriptionProvider.dart';
import '../Withdraw/WalletScreen.dart';



class TransferSuccessfulBottomSheet {
  transferSuccessfulBottomSheet(BuildContext context,
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
                  height:Responsive(context).isTabletLandscape? size.height*0.9:Responsive(context).isTabletPortrait?size.height*0.8 :size.height * 0.6,
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
                              "",
                              textAlign: TextAlign.center,
                              style: AppTextStyle().boldText(),
                            ),
                            CustomCircleIconButton(
                              onTap: () => Navigator.of(context).pop(),
                              height:Responsive(context).isTabletLandscape?12.sp:25.sp,
                              width:Responsive(context).isTabletLandscape? 12.sp: 25.sp,
                              boxColor: AppTheme.grey.withOpacity(0.2),
                              icon: AppIcons.close,
                              iconColor: AppTheme.grey,
                              iconSize:Responsive(context).isTabletLandscape? 8.sp:16.sp,
                            ),
                          ],
                        ),


                        Padding(
                          padding:  EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape?5.sp:20.sp),
                          child: Image(
                            height:Responsive(context).isTabletLandscape? 40.sp:125.sp,
                            width:Responsive(context).isTabletLandscape? 40.sp:125.sp,
                            image: const AssetImage(
                              AssetsImages.successImage,
                            ),
                          ),
                        ),
                        SizedBox(height:Responsive(context).isTabletLandscape? 10.sp:20.sp,),
                        Text(
                          "Transferred Successfully!",
                          textAlign: TextAlign.center,
                          style: AppTextStyle().boldText().copyWith(
                            fontSize: Responsive(context).isTabletLandscape? 12.sp:null,
                          ),
                        ),
                        SizedBox(height: 5.sp,),

                        Text(
                          "2500 EGP transferred to your bank account",
                          textAlign: TextAlign.center,
                          style: AppTextStyle().regularText().copyWith(
                            color: AppTheme.lightTextColor,
                            fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp,
                          ),
                        ),

                        SizedBox(height:Responsive(context).isTabletLandscape? 5.sp:20.sp,),


                        Container(
                          height: 24.sp,
                          width: 0.7.sw,
                          decoration: BoxDecoration(
                             color: AppTheme.lightFilledColor,
                            borderRadius: BorderRadius.circular(8.sp),
                          ),
                          child:Center(
                            child: Text(
                              "It takes 2 to 3 business days",
                              textAlign: TextAlign.center,
                              style: AppTextStyle().regularText().copyWith(
                                color: AppTheme.appTextColor,
                                fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height:Responsive(context).isTabletLandscape?10.sp:Responsive(context).isTabletPortrait?50.sp:80.sp,),

                        CustomFilledButton(
                          borderWidth: 0.1,
                          borderColor: AppTheme.grey.withOpacity(0.2),
                          fontSize:Responsive(context).isTabletLandscape? null:13.sp,
                          // buttonGradients: const LinearGradient(
                          //     colors: [AppTheme.white, AppTheme.white]),

                          textColor: AppTheme.white,
                          title: "Done",
                          disableButton: false,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),


                      ],
                    ),
                  ),
                ),
              );
            }), animationController: animationController);
  }
}



