import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Utils/Constants/AssetsImage.dart';
import '../../../../Utils/Constants/RouteConstant.dart';
import '../../../../component/AppHeader/AppHeader.dart';
import '../../../../component/Button/CustomFillButton.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../utils/constants/app_theme.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Scaffold(
      bottomNavigationBar:Container(
        color: AppTheme.white,
        height:Responsive(context).isTabletLandscape? 30.sp:80.sp,
        child:  Align(
          child: CustomFilledButton(
            height:Responsive(context).isTabletLandscape? 25.sp:50.sp,
            width: 0.9.sw,
            disableButton: false,
            title: 'Setup Bank Account',
            onPressed: () {
              Navigator.pushNamed(context, RouteConstants.addBankDetailScreen);
            },
          ),
        ),

      ) ,
      body: Stack(
        children: [
          AppHeader(
            title: 'Wallet',
          ),

          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: Responsive(context).isTabletLandscape?42.sp:120.sp),
            padding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp): EdgeInsets.all(20.sp),
            decoration: BoxDecoration(color: AppTheme.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Responsive(context).isTabletLandscape?20.sp: 32.sp), topRight: Radius.circular(Responsive(context).isTabletLandscape?20.sp:32.sp))),
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape? 5.sp:30.sp),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                
                    Container(
                      height:Responsive(context).isTabletLandscape? 80.sp:112.sp,
                      width: double.infinity,
                      decoration: BoxDecoration(gradient: AppTheme.headerBackgroundGradient1,
                      borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                           right: 0,
                            child: RotationTransition(
                              turns: const AlwaysStoppedAnimation(10 / 360),
                              alignment: Alignment.topRight,
                              child: Image.asset(
                                AssetsImages.appLogo,
                                width: 150.49.sp,
                                height: 170.5.sp,
                                alignment: const Alignment(2, 5),
                                fit: BoxFit.contain,
                                color: AppTheme.white.withOpacity(0.05),
                              ),
                            ),
                          ),
                
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 10.sp,horizontal: 20.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                     SvgPicture.asset(AssetsImages.wallet),
                                    SizedBox(width: 10.sp,),
                                    Text(
                                      "Available Balance",
                                      style: AppTextStyle()
                                          .regularText()
                                          .copyWith(fontSize:Responsive(context).isTabletLandscape? 10.sp:20.sp,fontWeight: FontWeight.w700, color: AppTheme.white,),
                                    ),
                                  ],
                                ),
                
                                Text(
                                  "2,500.00 EGP",
                                  style: AppTextStyle()
                                      .regularText()
                                      .copyWith(fontSize:Responsive(context).isTabletLandscape? 20.sp:32.sp,fontWeight: FontWeight.bold, color: AppTheme.white,),
                                ),
                
                              ],
                            ),
                          )
                
                        ],
                      ),
                    ),
                
                    /// boday of transaction
                
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.sp,vertical: 10.sp),
                    child: Column(
                      children: [
                        buildTransactionRow(
                            context: context,
                            suffixLabel: 'Edit', leadingLabel: 'Bank Account',leadingColor: AppTheme.appTextColor,suffixColor: AppTheme.appPrimaryColor,leadingFontSize:Responsive(context).isTabletLandscape? 12.sp:18.sp,suffixFontSize:Responsive(context).isTabletLandscape? 10.sp:14.sp,leadingWeight: FontWeight.bold, suffixOnTap: (){}),
                        SizedBox(height: 8.sp,),
                        buildTransactionRow(
                            context: context,
                            suffixLabel: 'QN123 3432 53245', leadingLabel: 'IBAN',leadingColor: AppTheme.lightTextColor,suffixColor: AppTheme.appTextColor,leadingFontSize:Responsive(context).isTabletLandscape? 12.sp: 16.sp,suffixFontSize:Responsive(context).isTabletLandscape? 10.sp:14.sp,leadingWeight: FontWeight.bold),
                        SizedBox(height: 8.sp,),
                        const Divider(color: AppTheme.borderColor,),
                        SizedBox(height: 8.sp,),
                
                
                        /// inner transactions column
                
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height:Responsive(context).isTabletLandscape? 2.sp:20.sp,),
                            Text(
                              "Transactions",
                              style: AppTextStyle()
                                  .regularText()
                                  .copyWith(fontSize:Responsive(context).isTabletLandscape?12.sp:16.sp,fontWeight:FontWeight.bold, color:AppTheme.appTextColor),
                            ),
                
                
                            SizedBox(height:Responsive(context).isTabletLandscape? 10.sp:30.sp,),
                
                            Text(
                              "#23430054",
                              style: AppTextStyle()
                                  .regularText()
                                  .copyWith(fontSize:Responsive(context).isTabletLandscape? 12.sp:16.sp,fontWeight:FontWeight.bold, color:AppTheme.appTextColor),
                            ),
                            SizedBox(height: 4.sp,),
                            buildTransactionRow(
                              context: context,
                              leadingLabel: '12, Apr 2022', suffixLabel: '-23 EGP',leadingColor: AppTheme.lightTextColor,suffixColor: AppTheme.red,leadingFontSize:Responsive(context).isTabletLandscape? 10.sp:13.sp,suffixFontSize:Responsive(context).isTabletLandscape? 12.sp:14.sp,),
                            SizedBox(height:Responsive(context).isTabletLandscape? 8.sp:20.sp,),
                            Text(
                              "#23430054",
                              style: AppTextStyle()
                                  .regularText()
                                  .copyWith(fontSize:Responsive(context).isTabletLandscape? 12.sp:16.sp,fontWeight:FontWeight.bold, color:AppTheme.appTextColor),
                            ),
                            SizedBox(height: 4.sp,),
                            buildTransactionRow(
                              context: context,
                              leadingLabel: '12, Apr 2022', suffixLabel: '-23 EGP',leadingColor: AppTheme.lightTextColor,suffixColor: AppTheme.red,leadingFontSize:Responsive(context).isTabletLandscape? 8.sp: 13.sp,suffixFontSize:Responsive(context).isTabletLandscape? 12.sp:14.sp,),
                
                            SizedBox(height:Responsive(context).isTabletLandscape? 10.sp:20.sp,),
                
                            Text(
                              "#23430054",
                              style: AppTextStyle()
                                  .regularText()
                                  .copyWith(fontSize:Responsive(context).isTabletLandscape? 12.sp:16.sp,fontWeight:FontWeight.bold, color:AppTheme.appTextColor),
                            ),
                            SizedBox(height: 4.sp,),
                            buildTransactionRow(leadingLabel: '12, Apr 2022', suffixLabel: '-23 EGP',leadingColor: AppTheme.lightTextColor,suffixColor: AppTheme.red,leadingFontSize:Responsive(context).isTabletLandscape? 8.sp: 13.sp,suffixFontSize:Responsive(context).isTabletLandscape? 12.sp:14.sp,
                            context: context
                            ),
                
                          ],
                        ),
                
                
                
                
                
                      ],
                    ),
                
                
                
                
                  ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


}
Widget buildTransactionRow({required String leadingLabel, required String suffixLabel, required Color leadingColor,required Color suffixColor, double ?leadingFontSize,double ?suffixFontSize, FontWeight? leadingWeight, FontWeight? suffixWeight , VoidCallback ? suffixOnTap,
required BuildContext context,

}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        leadingLabel,
        style: AppTextStyle()
            .regularText()
            .copyWith(fontSize:leadingFontSize==null? Responsive(context).isTabletLandscape? 10.sp:14.sp:leadingFontSize,fontWeight:leadingWeight?? FontWeight.w400, color:leadingColor),
      ),
      InkWell(
        onTap:suffixOnTap,
        child: Text(
          suffixLabel,
          style: AppTextStyle()
              .regularText()
              .copyWith(fontSize:suffixFontSize==null? Responsive(context).isTabletLandscape? 10.sp:14.sp:suffixFontSize,fontWeight:suffixWeight?? FontWeight.w500, color: suffixColor,),
        ),
      ),
    ],
  );
}
