import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../component/AppHeader/AppHeader.dart';
import '../../../../../../component/Button/CustomFillButton.dart';
import '../../../../../../component/Text/TextStyle.dart';
import '../../../../../../component/TextField/CustomPinPutBox.dart';
import '../../../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../../../utils/constants/app_theme.dart';

class ChangePhoneNumberOTPVerification extends StatefulWidget {
  var data;

  ChangePhoneNumberOTPVerification({this.data});

  @override
  State<ChangePhoneNumberOTPVerification> createState() => _ChangePhoneNumberOTPVerificationState();
}

class _ChangePhoneNumberOTPVerificationState extends State<ChangePhoneNumberOTPVerification> {
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
  void dispose() {
    super.dispose();
    // TODO: implement dispose
    timer?.cancel();
  }
  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Scaffold(
      body: Stack(
        children: [
          AppHeader(
            title: 'Verify Number',
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
                      Text(
                        "Enter your verification code",
                        style: AppTextStyle().regularText().copyWith(fontSize:Responsive(context).isTabletLandscape? 15.sp:24.sp),
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Verification code has been sent to ",
                            style: AppTextStyle()
                                .regularText()
                                .copyWith(color: AppTheme.grey, fontSize:Responsive(context).isTabletLandscape? 13.sp:16.sp),
                            children: <TextSpan>[
                              TextSpan(
                                text: widget.data["is_phone_number"]
                                    ? '${widget.data['user_enter_data']}'.replaceRange(
                                        0, "${widget.data['user_enter_data']}".length - 4, "********")
                                    : widget.data['user_enter_data'],
                                style: AppTextStyle().mediumText().copyWith(fontSize: 16.sp),
                              ),
                              const TextSpan(text: ', this code will be valid for 15 minutes. '),
                              TextSpan(
                                text: 'Edit',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.of(context).pop(),
                                style: AppTextStyle()
                                    .mediumText()
                                    .copyWith(color: AppTheme.appPrimaryColor),
                              ),
                            ]),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 20.sp),
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
                                  .copyWith(color: AppTheme.grey, fontSize:Responsive(context).isTabletLandscape? 12.sp:16.sp),
                              children: <TextSpan>[
                                TextSpan(
                                  text: timer != null && timer!.isActive
                                      ? "00:$secondsRemaining"
                                      : 'Resend',
                                  recognizer: TapGestureRecognizer()..onTap = () => codeResendTimer(),
                                  style: AppTextStyle()
                                      .mediumText()
                                      .copyWith(color: AppTheme.appPrimaryColor,
                                      fontSize: Responsive(context).isTabletLandscape? 13.sp:null,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  CustomFilledButton(
                    disableButton: false,
                    title: 'Verify',
                    onPressed: () {
                      setState(() {
                        timer != null && timer!.isActive ? timer!.cancel() : null;
                      });
                      Navigator.of(context).pop();
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
