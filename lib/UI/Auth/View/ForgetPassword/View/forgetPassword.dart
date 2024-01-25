
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Utils/Constants/RouteConstant.dart';
import '../../../../../component/AppHeader/AppHeader.dart';
import '../../../../../component/Button/CustomFillButton.dart';
import '../../../../../component/CountryCodePicker/CountryCodePicker.dart';
import '../../../../../component/Text/TextStyle.dart';
import '../../../../../component/TextField/CustomTextField.dart';
import '../../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../../utils/constants/AppIcons.dart';
import '../../../../../utils/constants/app_theme.dart';



class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController phoneNumberController = TextEditingController();

  String countryCode = '+20';
  bool agree = false;
  bool isObscure = true;

  final TextEditingController passwordController = TextEditingController();
  var formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Scaffold(
      body: Stack(
        children: [
          AppHeader(
            title: 'Reset Password',
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: Responsive(context).isTabletLandscape?37.sp:120.sp),
            padding: EdgeInsets.all(20.sp),
            decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Responsive(context).isTabletLandscape?20.sp: 32.sp), topRight: Radius.circular(Responsive(context).isTabletLandscape?20.sp:32.sp))),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height:Responsive(context).isTabletLandscape? 6.sp:30.sp,),
                      Text(
                        "Phone Number",
                        textAlign: TextAlign.center,
                        style: AppTextStyle().regularText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height:Responsive(context).isTabletLandscape? 5.sp:10.sp,
                      ),
                      Form(
                        key: formKey,
                        child: CustomTextFormField(
                          controller: phoneNumberController,
                          hintText: "Phone Number",
                          inputType: TextInputType.number,
                          textCapitalization: TextCapitalization.sentences,
                          prefixWidget: SizedBox(
                            width:Responsive(context).isTabletLandscape? 50.sp: 120.sp,
                            height:Responsive(context).isTabletLandscape? 30.sp: 48.sp,
                            child: Row(
                              children: [
                                CustomCountryCodePicker(
                                  initialSelectCountry: countryCode,
                                  onChange: (selectCountryCodeValue) {
                                    countryCode = selectCountryCodeValue.dialCode!;
                                    print("Select Country Code: $countryCode");
                                  },
                                ),
                                Icon(
                                  AppIcons.arrowDown,
                                  color: AppTheme.grey,
                                ),
                                Container(
                                  height: 20.sp,
                                  width: 1,
                                  padding: EdgeInsets.symmetric(horizontal: 5.sp),
                                  color: AppTheme.grey,
                                ),
                              ],
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter the phone number";
                            } else if (value.length < 10) {
                              return "Please valid phone number";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height:Responsive(context).isTabletLandscape? 20.sp:0.4.sh,
                      ),
                      // InkWell(
                      //   onTap: () => Navigator.of(context).pushNamed(RouteConstants.emailLoginScreen),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Image.asset(
                      //         AssetsImages.smsIcon,
                      //         scale: 2.5.sp,
                      //       ),
                      //       SizedBox(
                      //         width: 5.sp,
                      //       ),
                      //       Text(
                      //         "Use email address",
                      //         textAlign: TextAlign.center,
                      //         style: AppTextStyle().mediumText().copyWith(
                      //           color: AppTheme.appPrimaryColor,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                  CustomFilledButton(
                    // height: Responsive(context).isTabletLandscape? 36.sp:null,
                    disableButton: false,
                    title: 'Send',

                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.of(context).pushNamed(
                            RouteConstants.forgetOtpVerificationScreen,
                            arguments: {
                              "is_phone_number": true,
                              "user_enter_data": "$countryCode${phoneNumberController.text}",
                            });
                      }
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
