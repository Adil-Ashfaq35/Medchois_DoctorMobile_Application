import 'package:doctor_app/utils/constants/AppIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Utils/Constants/AssetsImage.dart';
import '../../../../Utils/Constants/RouteConstant.dart';
import '../../../../component/AppHeader/AppHeader.dart';
import '../../../../component/Button/CustomFillButton.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../component/TextField/CustomTextField.dart';
import '../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../utils/constants/app_theme.dart';
import '../Widget/InfoBottomSheet.dart';
import '../Widget/WithdrawConfirmationBottomSheet.dart';

class AddBankDetailScreen extends StatelessWidget {
  const AddBankDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Scaffold(
      bottomNavigationBar:Container(
        color: AppTheme.white,
        height:Responsive(context).isTabletLandscape? 30.sp: 80.sp,
        child:  Align(
          child: CustomFilledButton(
            height:Responsive(context).isTabletLandscape? 25.sp: 50.sp,
            width: 0.9.sw,
            disableButton: false,
            title: 'Submit',
            onPressed: () {
              WithdrawConfirmationBottomSheet().withdrawConfirmationBottomSheet(context);
              // Navigator.pushNamed(context, RouteConstants.writeArticleDescription);
            },
          ),
        ),

      ) ,
      body: Stack(
        children: [
          AppHeader(
            title: 'Bank Account',
          ),

          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: Responsive(context).isTabletLandscape?42.sp:120.sp),
            padding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp): EdgeInsets.all(20.sp),
            decoration: BoxDecoration(color: AppTheme.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Responsive(context).isTabletLandscape?20.sp: 32.sp), topRight: Radius.circular(Responsive(context).isTabletLandscape?20.sp:32.sp))),
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape? 10.sp:30.sp),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                
                    Row(
                      children: [
                        Text(
                          "Swift Code",
                          style: AppTextStyle()
                              .regularText()
                              .copyWith(fontSize:Responsive(context).isTabletLandscape? 10.sp:16.sp,fontWeight:FontWeight.bold, color:AppTheme.appTextColor),
                        ),
                        SizedBox(width: 5.sp,),
                        InkWell(
                             onTap: (){
                               InfoBottomSheet().infoBottomSheet(context, infoText: """
To locate your SWIFT/BIC code, check any paper or digital banking statements, or look at your account details on your online banking profile. You can also search for your BIC code using a digital SWIFT/BIC search tool by providing your country and bank location data.
                               """);
                             },
                            child: const Icon(AppIcons.info,color: AppTheme.appPrimaryColor,)),
                      ],
                    ),
                
                    SizedBox(height: 10.sp,),
                
                    CustomTextFormField(
                      hintText: "Enter Swift Code",
                      inputType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      suffixIconConstraints: BoxConstraints.tight(Size(50.sp,Responsive(context).isTabletLandscape? 20.sp: 30.sp)),
                      suffixWidget: InkWell(
                          onTap:(){}),
                      validator: (value) =>
                      value!.isEmpty ? "Please Enter Title" : null,
                    ),
                
                
                
                    SizedBox(height:Responsive(context).isTabletLandscape? 10.sp:20.sp,),
                
                
                    Row(
                      children: [
                        Text(
                          "Account Holder Name",
                          style: AppTextStyle()
                              .regularText()
                              .copyWith(fontSize:Responsive(context).isTabletLandscape?10.sp:16.sp,fontWeight:FontWeight.bold, color:AppTheme.appTextColor),
                        ),
                      ],
                    ),
                
                    SizedBox(height: 10.sp,),
                
                    CustomTextFormField(
                      hintText: "Enter Swift Code",
                      inputType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      suffixIconConstraints: BoxConstraints.tight(Size(50.sp,Responsive(context).isTabletLandscape? 20.sp:30.sp)),
                      suffixWidget: InkWell(
                          onTap:(){}),
                      validator: (value) =>
                      value!.isEmpty ? "Please Enter Title" : null,
                    ),
                
                
                
                    SizedBox(height:Responsive(context).isTabletLandscape? 10.sp:20.sp,),
                
                
                    Row(
                      children: [
                        Text(
                          "IBAN Number",
                          style: AppTextStyle()
                              .regularText()
                              .copyWith(fontSize:Responsive(context).isTabletLandscape? 10.sp:16.sp,fontWeight:FontWeight.bold, color:AppTheme.appTextColor),
                        ),
                        SizedBox(width: 5.sp,),
                        InkWell(
                             onTap: ()=>InfoBottomSheet().infoBottomSheet(context, infoText: """
• You can usually find your IBAN number on the top right-hand side of your bank statement.
                
• If you can’t locate your IBAN, you should be able to generate it online via your bank’s internet banking service or by using an IBAN calculator tool.
                             """),
                            child: const Icon(AppIcons.info,color: AppTheme.appPrimaryColor,)),
                      ],
                    ),
                
                    SizedBox(height: 10.sp,),
                
                    CustomTextFormField(
                      hintText: "Enter Swift Code",
                      inputType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      suffixIconConstraints: BoxConstraints.tight(Size(50.sp,Responsive(context).isTabletLandscape? 20.sp:30.sp)),
                      suffixWidget: InkWell(
                          onTap:(){}),
                      validator: (value) =>
                      value!.isEmpty ? "Please Enter Title" : null,
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
