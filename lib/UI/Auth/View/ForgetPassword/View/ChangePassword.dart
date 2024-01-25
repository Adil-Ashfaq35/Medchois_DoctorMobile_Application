import 'package:doctor_app/Utils/Constants/RouteConstant.dart';
import 'package:doctor_app/component/AppHeader/AppHeader.dart';
import 'package:doctor_app/component/Button/CustomFillButton.dart';
import 'package:doctor_app/component/Text/TextStyle.dart';
import 'package:doctor_app/utils/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/Button/CustomCheckBox.dart';
import '../../../../../component/Extensions/Extensions.dart';
import '../../../../../component/PasswordStrengthIndicator/PasswordStrengthIndicator.dart';
import '../../../../../component/TextField/CustomTextField.dart';
import '../../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../../utils/constants/AppIcons.dart';



class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var formKey = new GlobalKey<FormState>();
  String previousPassword = "12345678";

  bool isPasswordObscure = true,
      isConfirmPasswordObscure = true,
      minimumCharacterComplete = false,
      specialCharacterComplete = false,
      numberCharacterComplete = false,
      previousPasswordComplete = false;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Scaffold(
      body: Stack(
        children: [
          AppHeader(
            title: 'Change Password',
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: Responsive(context).isTabletLandscape?37.sp:120.sp),
            padding: EdgeInsets.all(Responsive(context).isTabletLandscape?10.sp:20.sp),
            decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Responsive(context).isTabletLandscape?20.sp: 32.sp), topRight: Radius.circular(Responsive(context).isTabletLandscape?20.sp:32.sp))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 8.sp,
                              ),
                              Text(
                                "Password",
                                textAlign: TextAlign.center,
                                style: AppTextStyle().regularText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp),
                              ),
                              SizedBox(
                                height: 3.sp,
                              ),
                              CustomTextFormField(
                                controller: passwordController,
                                hintText: "Your Password",
                                isObscure: isPasswordObscure,
                                inputType: TextInputType.text,
                                textCapitalization: TextCapitalization.sentences,
                                suffixIconConstraints: BoxConstraints.tight(Size(50.sp,Responsive(context).isTabletLandscape? 20.sp:30.sp)),
                                onChange: (value) =>
                                    setState(() {
                                      if (value.length >= 8) {
                                        minimumCharacterComplete = true;
                                      } else {
                                        minimumCharacterComplete = false;
                                      }
                                      if (AppExtensions().specialCharacter(value)) {
                                        specialCharacterComplete = true;
                                      } else {
                                        specialCharacterComplete = false;
                                      }

                                      if (AppExtensions().isNumericCharacter(value)) {
                                        numberCharacterComplete = true;
                                      } else {
                                        numberCharacterComplete = false;
                                      }
                                      if (value != previousPassword && value.length >= 8) {
                                        previousPasswordComplete = true;
                                      } else {
                                        previousPasswordComplete = false;
                                      }
                                    }),
                                suffixWidget: InkWell(
                                  onTap: () =>
                                      setState(() {
                                        isPasswordObscure = !isPasswordObscure;
                                      }),
                                  child: Icon(
                                    isPasswordObscure ? AppIcons.eyeClose : AppIcons.eye,
                                    size:Responsive(context).isTabletLandscape? 15.sp:20.sp,
                                    color: AppTheme.grey,
                                  ),
                                ),
                                validator: (value) =>
                                value!.isEmpty ? "Please enter new password" : null,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 3.sp),
                                child: CustomPasswordStrengthIndicator(
                                  password: passwordController.text.trim(),
                                ),
                              ),
                              Container(
                                height: 20.sp,
                                margin: EdgeInsets.symmetric(vertical: 8.sp),
                                child: Row(
                                  children: [
                                    CustomCheckBox(
                                      value: minimumCharacterComplete,
                                      activeColor: minimumCharacterComplete
                                          ? AppTheme.appLightGreenColor
                                          : AppTheme.transparent,
                                      shape: CircleBorder(),
                                    ),
                                    Expanded(
                                        child: Text(
                                          "Minimum 8 characters ",
                                          style: AppTextStyle().regularText().copyWith(
                                              color: minimumCharacterComplete
                                                  ? AppTheme.appLightGreenColor
                                                  : AppTheme.grey,
                                              fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp),
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16.sp,
                                child: Row(
                                  children: [
                                    CustomCheckBox(
                                      value: specialCharacterComplete,
                                      activeColor: specialCharacterComplete
                                          ? AppTheme.appLightGreenColor
                                          : AppTheme.transparent,
                                      shape: CircleBorder(),
                                    ),
                                    Expanded(
                                        child: Text(
                                          "At least one special character",
                                          style: AppTextStyle().regularText().copyWith(
                                              color: specialCharacterComplete
                                                  ? AppTheme.appLightGreenColor
                                                  : AppTheme.grey,
                                              fontSize:Responsive(context).isTabletLandscape? 8.sp: 14.sp),
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                height: 16.sp,
                                margin: EdgeInsets.symmetric(vertical: 8.sp),
                                child: Row(
                                  children: [
                                    CustomCheckBox(
                                      value: numberCharacterComplete,
                                      activeColor: numberCharacterComplete
                                          ? AppTheme.appLightGreenColor
                                          : AppTheme.transparent,
                                      shape: CircleBorder(),
                                    ),
                                    Expanded(
                                        child: Text(
                                          "At least one number",
                                          style: AppTextStyle().regularText().copyWith(
                                              color: numberCharacterComplete
                                                  ? AppTheme.appLightGreenColor
                                                  : AppTheme.grey,
                                              fontSize:Responsive(context).isTabletLandscape? 8.sp: 14.sp),
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16.sp,
                                child: Row(
                                  children: [
                                    CustomCheckBox(
                                      value: previousPasswordComplete,
                                      activeColor: previousPasswordComplete
                                          ? AppTheme.appLightGreenColor
                                          : AppTheme.transparent,
                                      shape: CircleBorder(),
                                    ),
                                    Expanded(
                                        child: Text(
                                          "Can’t be the same as previous",
                                          style: AppTextStyle().regularText().copyWith(
                                              color: previousPasswordComplete
                                                  ? AppTheme.appLightGreenColor
                                                  : AppTheme.grey,
                                              fontSize:Responsive(context).isTabletLandscape? 8.sp: 14.sp),
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 12.sp,
                              ),
                              Text(
                                "Confirm Password",
                                textAlign: TextAlign.center,
                                style: AppTextStyle().regularText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp),
                              ),
                              SizedBox(
                                height: 3.sp,
                              ),
                              CustomTextFormField(
                                controller: confirmPasswordController,
                                hintText: "Confirm Password",
                                isObscure: isConfirmPasswordObscure,
                                inputType: TextInputType.text,
                                textCapitalization: TextCapitalization.sentences,
                                suffixIconConstraints: BoxConstraints.tight(Size(50.sp,Responsive(context).isTabletLandscape?20.sp: 30.sp)),
                                onChange: (value) =>
                                    setState(() {
                                      if (value.length >= 8) {
                                        minimumCharacterComplete = true;
                                      } else {
                                        minimumCharacterComplete = false;
                                      }
                                    }),
                                suffixWidget: InkWell(
                                  onTap: () =>
                                      setState(() {
                                        isConfirmPasswordObscure = !isConfirmPasswordObscure;
                                      }),
                                  child: Icon(
                                    isConfirmPasswordObscure ? AppIcons.eyeClose : AppIcons.eye,
                                    size:Responsive(context).isTabletLandscape? 10.sp:20.sp,
                                    color: AppTheme.grey,
                                  ),
                                ),
                                validator: (value) =>
                                value!.isEmpty ? "Please enter confirm password" : null,
                              ),
                              Responsive(context).isTabletLandscape?
                                  SizedBox(height: 30.sp,):SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                CustomFilledButton(
                  disableButton: false,
                  title: 'Change Password',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Navigator.of(context).pop();
                      Navigator.pushNamed(context, RouteConstants.loginScreen,arguments: {"is_show_flash":true,"message":"Password Changed Successfully"});




                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
