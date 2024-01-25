
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
import 'TransferSuccessfulBottomSheet.dart';



class WithdrawConfirmationBottomSheet {
  withdrawConfirmationBottomSheet(BuildContext context,
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
                  height:Responsive(context).isTabletLandscape? size.height*0.8:Responsive(context).isTabletPortrait? size.height*0.7:size.height * 0.5,
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
                              "Withdraw",
                              textAlign: TextAlign.center,
                              style: AppTextStyle().boldText().copyWith(
                                fontSize:  Responsive(context).isTabletLandscape? 12.sp:null,
                              ),
                            ),
                            CustomCircleIconButton(
                              onTap: () => Navigator.of(context).pop(),
                              height: Responsive(context).isTabletLandscape? 12.sp: 25.sp,
                              width: Responsive(context).isTabletLandscape? 12.sp: 25.sp,
                              boxColor: AppTheme.grey.withOpacity(0.2),
                              icon: AppIcons.close,
                              iconColor: AppTheme.grey,
                              iconSize: Responsive(context).isTabletLandscape? 8.sp:16.sp,
                            ),
                          ],
                        ),


                        Padding(
                          padding:  EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape? 10.sp:30.sp),
                          child: Center(
                            child: Text(
                              "2,500.00 EGP",
                              textAlign: TextAlign.center,
                              style: AppTextStyle().boldText().copyWith(
                                fontSize:Responsive(context).isTabletLandscape?15.sp:32.sp,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height:Responsive(context).isTabletLandscape? 10.sp:20.sp,),

                        buildTransactionRow(
                            context: context,
                            leadingLabel: 'Acc holder', suffixLabel: 'Ibrahim Elfeky',leadingColor: AppTheme.lightTextColor,suffixColor: AppTheme.appTextColor,leadingFontSize:Responsive(context).isTabletLandscape?12.sp:16.sp,suffixFontSize:Responsive(context).isTabletLandscape?10.sp:14.sp,suffixWeight: FontWeight.w400),
                        buildTransactionRow(
                            context: context,
                            leadingLabel: 'IBAN', suffixLabel: 'EG380019000500000000263180002',leadingColor: AppTheme.lightTextColor,suffixColor: AppTheme.appTextColor,leadingFontSize:Responsive(context).isTabletLandscape? 12.sp:16.sp,suffixFontSize:Responsive(context).isTabletLandscape? 10.sp:14.sp,suffixWeight: FontWeight.w400),
                        buildTransactionRow(
                            context: context,
                            leadingLabel: 'Swift code', suffixLabel: 'BOFAUS3N',leadingColor: AppTheme.lightTextColor,suffixColor: AppTheme.appTextColor,leadingFontSize:Responsive(context).isTabletLandscape? 12.sp: 16.sp,suffixFontSize:Responsive(context).isTabletLandscape? 10.sp:14.sp,suffixWeight: FontWeight.w400),




                        SizedBox(height:Responsive(context).isTabletLandscape? 20.sp:80.sp,),

                        CustomFilledButton(
                          borderWidth: 0.1,
                          borderColor: AppTheme.grey.withOpacity(0.2),
                          fontSize:Responsive(context).isTabletLandscape? null:13.sp,
                          // buttonGradients: const LinearGradient(
                          //     colors: [AppTheme.white, AppTheme.white]),

                          textColor: AppTheme.white,
                          title: "Confirm",
                          disableButton: false,
                          onPressed: () {
                            // Navigator.pop(context);
                            TransferSuccessfulBottomSheet().transferSuccessfulBottomSheet(context);
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



