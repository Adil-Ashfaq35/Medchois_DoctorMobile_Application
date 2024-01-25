import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Utils/Constants/RouteConstant.dart';
import '../../../../../component/AppHeader/AppHeader.dart';
import '../../../../../component/Button/CustomFillButton.dart';
import '../../../../../component/Text/TextStyle.dart';
import '../../../../../component/TextField/CustomPinPutBox.dart';
import '../../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../../utils/constants/app_theme.dart';

class ForgetOTPVerificationScreen extends StatefulWidget {
  var data;

  ForgetOTPVerificationScreen({this.data});

  @override
  State<ForgetOTPVerificationScreen> createState() => _ForgetOTPVerificationScreenState();
}

class _ForgetOTPVerificationScreenState extends State<ForgetOTPVerificationScreen> {
  final TextEditingController pinPutController = TextEditingController();

  FocusNode pinPutNode = FocusNode();

  int secondsRemaining = 60;

  Timer? timer;

  codeResendTimer() {
    secondsRemaining = 60;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          timer.cancel();
        });
      }
    });
  }

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
                    topLeft: Radius.circular(32.sp), topRight: Radius.circular(32.sp))),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Enter your verification code",
                        style: AppTextStyle().regularText().copyWith(fontSize:Responsive(context).isTabletLandscape? 12.sp:24.sp),
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Verification code has been sent to ",
                            style: AppTextStyle()
                                .regularText()
                                .copyWith(color: AppTheme.grey, fontSize:Responsive(context).isTabletLandscape? 8.sp: 16.sp),
                            children: <TextSpan>[
                              TextSpan(
                                text: widget.data["is_phone_number"]
                                    ? '${widget.data['user_enter_data']}'.replaceRange(
                                    0, "${widget.data['user_enter_data']}".length - 4, "********")
                                    : widget.data['user_enter_data'],
                                style: AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 10.sp:16.sp),
                              ),
                              TextSpan(text: ', this code will be valid for 15 minutes. '),
                              TextSpan(
                                text: 'Edit',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.of(context).pop(),
                                style: AppTextStyle()
                                    .mediumText()
                                    .copyWith(color: AppTheme.appPrimaryColor,fontSize: Responsive(context).isTabletLandscape?10.sp:null),
                              ),
                            ]),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape? 5.sp:20.sp),
                        child: CustomPinPutBox(
                          controller: pinPutController,
                          node: pinPutNode,
                          onCompleted: (pin) {},
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                              text: timer != null && timer!.isActive
                                  ? "Code Sent. Resend Code in "
                                  : "Didn’t receive the Code? ",
                              style: AppTextStyle()
                                  .regularText()
                                  .copyWith(color: AppTheme.grey, fontSize:Responsive(context).isTabletLandscape?10.sp:16.sp),
                              children: <TextSpan>[
                                TextSpan(
                                  text: timer != null && timer!.isActive
                                      ? "00:$secondsRemaining"
                                      : 'Resend',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => codeResendTimer(),
                                  style: AppTextStyle()
                                      .mediumText()
                                      .copyWith(color: AppTheme.appPrimaryColor,
                                  fontSize: Responsive(context).isTabletLandscape?10.sp:null,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  
                  CustomFilledButton(
                    disableButton: false,
                    title: 'Reset',
                    onPressed: () {
                      setState(() {
                        timer != null && timer!.isActive ? timer!.cancel() : null;
                      });
                      Navigator.of(context).pushReplacementNamed(RouteConstants.changePasswordScreen);
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
