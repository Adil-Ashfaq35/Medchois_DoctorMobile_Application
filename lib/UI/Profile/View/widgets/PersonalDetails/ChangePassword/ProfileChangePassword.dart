import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Utils/Constants/RouteConstant.dart';
import '../../../../../../component/AppHeader/AppHeader.dart';
import '../../../../../../component/Button/CustomFillButton.dart';
import '../../../../../../component/Text/TextStyle.dart';
import '../../../../../../component/TextField/CustomTextField.dart';
import '../../../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../../../utils/constants/AppIcons.dart';
import '../../../../../../utils/constants/app_theme.dart';


class ProfileChangePasswordScreen extends StatefulWidget {
  ProfileChangePasswordScreen({super.key});

  @override
  State<ProfileChangePasswordScreen> createState() => _ProfileChangePasswordScreenState();
}

class _ProfileChangePasswordScreenState extends State<ProfileChangePasswordScreen> {
  var formKey = new GlobalKey<FormState>();

  bool isObscure = true;

  final TextEditingController passwordController = TextEditingController();

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
                        height: 15.sp,
                      ),
                      Text(
                        "Current Password",
                        textAlign: TextAlign.center,
                        style: AppTextStyle().regularText().copyWith(fontSize: Responsive(context).isTabletLandscape? 12.sp:14.sp),
                      ),
                      SizedBox(
                        height: 3.sp,
                      ),
                      Form(
                        key: formKey,
                        child: CustomTextFormField(
                          // controller: passwordController,
                          hintText: "Your Password",
                          isObscure: isObscure,
                          inputType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          suffixIconConstraints: BoxConstraints.tight(Size(50.sp, Responsive(context).isTabletLandscape? 20.sp:30.sp)),
                          suffixWidget: InkWell(
                            onTap: () => setState(() {
                              isObscure = !isObscure;
                            }),
                            child: Icon(
                              isObscure ? AppIcons.eyeClose : AppIcons.eye,
                              size: Responsive(context).isTabletLandscape? 12.sp:20.sp,
                              color: AppTheme.grey,
                            ),
                          ),
                          validator: (value) =>
                              value!.isEmpty ? "Please enter current password" : null,
                        ),
                      ),
                      SizedBox(
                        height: 8.sp,
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context)
                            .pushNamed(RouteConstants.forgetOtpVerificationScreen, arguments: {
                          "is_phone_number": true,
                          "user_enter_data": '+201234567899',
                        }),
                        child: Text(
                          "Forget Password?",
                          textAlign: TextAlign.center,
                          style: AppTextStyle()
                              .regularText()
                              .copyWith(color: AppTheme.appPrimaryColor, fontSize: Responsive(context).isTabletLandscape? 10.sp:14.sp),
                        ),
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                    ],
                  ),
                  CustomFilledButton(
                    disableButton: false,
                    buttonGradients:  const LinearGradient(
                      begin: Alignment(-0.75, 0.66),
                      end: Alignment(0.75, -0.66),
                      colors: [Color(0xFF6667AB), Color(0xFF63C0FD)],
                    ),
                    btnColor: Colors.blue,
                    title: 'Next',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.of(context)
                            .pushReplacementNamed(RouteConstants.setNewPasswordScreen, arguments: {
                          'button_text': "Save Changes",
                          'button_onTap': () => Navigator.of(context).pop(),
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
