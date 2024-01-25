import 'package:doctor_app/component/AppHeader/AppHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Utils/Constants/RouteConstant.dart';
import '../../../../../../component/Button/CustomFillButton.dart';
import '../../../../../../component/CountryCodePicker/CountryCodePicker.dart';
import '../../../../../../component/Text/TextStyle.dart';
import '../../../../../../component/TextField/CustomTextField.dart';
import '../../../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../../../utils/constants/AppIcons.dart';
import '../../../../../../utils/constants/app_theme.dart';


class ChangePhoneNumberScreen extends StatelessWidget {
  ChangePhoneNumberScreen({super.key});

  TextEditingController phoneNumberController = TextEditingController();
  String countryCode = '+20';
  var formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Scaffold(
      body: Stack(
        children: [
          AppHeader(
            title: 'Phone Number',
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: Responsive(context).isTabletLandscape?42.sp:120.sp),
            padding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(horizontal:20.sp,vertical: 5.sp): EdgeInsets.all(20.sp),
            decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Responsive(context).isTabletLandscape?20.sp: 32.sp), topRight: Radius.circular(Responsive(context).isTabletLandscape?20.sp:32.sp))),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height:Responsive(context).isTabletLandscape? 10.sp:20.sp,
                      ),
                      Text(
                        "Phone Number",
                        textAlign: TextAlign.center,
                        style: AppTextStyle().regularText().copyWith(fontSize:Responsive(context).isTabletLandscape? 10.sp: 14.sp),
                      ),
                      SizedBox(
                        height: 3.sp,
                      ),
                      Form(
                        key: formKey,
                        child: CustomTextFormField(
                          controller: phoneNumberController,
                          hintText: "Phone Number",
                          inputType: TextInputType.number,
                          textCapitalization: TextCapitalization.sentences,
                          prefixWidget: SizedBox(
                            width:Responsive(context).isTabletLandscape? 60.sp:120.sp,
                            height:Responsive(context).isTabletLandscape? 24.sp: 48.sp,
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
                        height: 15.sp,
                      ),
                    ],
                  ),
                  CustomFilledButton(
                    disableButton: false,
                    title: 'Verify',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.of(context).pushNamed(
                            RouteConstants.changePhoneNumberOTPVerification,
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
