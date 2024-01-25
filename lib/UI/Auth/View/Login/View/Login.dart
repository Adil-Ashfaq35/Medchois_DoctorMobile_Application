import 'package:doctor_app/Utils/Constants/RouteConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_auth/local_auth.dart';

import '../../../../../Utils/Constants/AssetsImage.dart';
import '../../../../../component/AppHeader/AppHeader.dart';
import '../../../../../component/Button/CustomFillButton.dart';
import '../../../../../component/ShowToast/ShowToast.dart';
import '../../../../../component/Text/TextStyle.dart';
import '../../../../../component/TextField/CustomTextField.dart';
import '../../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../../utils/constants/AppIcons.dart';
import '../../../../../utils/constants/app_theme.dart';


//ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
   var data;

  LoginScreen({super.key, this.data});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  bool isObscure = true;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();


  @override
  void initState() {

    Future.delayed(const Duration(milliseconds: 300),(){
      if( widget.data!=null && widget.data["is_show_flash"]==true){
        ShowToast().showFlushBar(
          context,
          message: widget.data["message"],
          actionButtonOnTap: () {},
          leadingIcon: AssetsImages.verifiedIcon,
          showActionButton: false,
          showCloseButton: true, actionButtonText: '',
        ).show(context);
      }
    });



    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Scaffold(
      body: Stack(
        children: [
          AppHeader(
            title: 'Login',
            onTap:()=> Navigator.pushNamed(context, RouteConstants.onBoardingScreen),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: Responsive(context).isTabletLandscape?42.sp:120.sp),
            padding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp): EdgeInsets.all(20.sp),
            decoration: BoxDecoration(color: AppTheme.white,
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
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome Back, Ibrahim 👋",
                              style: AppTextStyle().boldText().copyWith(
                                  fontSize:Responsive(context).isTabletLandscape? 10.sp:24.sp


                              ),
                            ),
                            Text(
                              "Enter your password to proceed",
                              textAlign: TextAlign.center,
                              style: AppTextStyle()
                                  .regularText()
                                  .copyWith(color: AppTheme.grey, fontSize:Responsive(context).isTabletLandscape? 8.sp: 16.sp,
                              fontWeight: FontWeight.w200,
                              ),
                            ),Responsive(context).isTabletLandscape?SizedBox(
                              height:5.sp,
                            ):
                            SizedBox(
                              height: 20.sp,
                            ),

                            Text(
                              "Email or Phone number",
                              textAlign: TextAlign.center,
                              style: AppTextStyle().regularText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp,fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 3.sp,
                            ),
                            CustomTextFormField(
                              controller: emailController,
                              hintText: "Email or Phone number",
                              inputType: TextInputType.text,
                              textCapitalization: TextCapitalization.sentences,
                              suffixIconConstraints: BoxConstraints.tight(Size(50.sp, 30.sp)),
                              validator: (value) =>
                              value!.isEmpty ? "Email or Phone number" : null,
                              contentPadding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(vertical: 5.sp,horizontal: 5.sp): null,
                            ),

                            SizedBox(height:Responsive(context).isTabletLandscape? 8.sp:20.sp,),

                            Text(
                              "Password",
                              textAlign: TextAlign.center,
                              style: AppTextStyle().regularText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp: 14.sp,fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 3.sp,
                            ),
                            CustomTextFormField(
                              controller: passwordController,
                              hintText: "Your Password",
                              isObscure: isObscure,
                              inputType: TextInputType.text,
                              textCapitalization: TextCapitalization.sentences,
                              suffixIconConstraints: BoxConstraints.tight(Size(50.sp, 20.sp)),
                              contentPadding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(vertical: 5.sp,horizontal: 5.sp): null,
                              suffixWidget: InkWell(
                                onTap: () =>
                                    setState(() {
                                      isObscure = !isObscure;
                                    }),
                                child: Icon(
                                  isObscure ? AppIcons.eyeClose : AppIcons.eye,
                                  size:Responsive(context).isTabletLandscape? 12.sp: 20.sp,
                                  color: AppTheme.grey,
                                ),
                              ),
                              validator: (value) =>
                              value!.isEmpty ? "Please Your Password" : null,
                            ),
                            SizedBox(
                              height: 8.sp,
                            ),
                            InkWell(
                              onTap: () =>
                                  Navigator.of(context).pushNamed(
                                    RouteConstants.forgetPasswordScreen,
                                  ),
                              child: Text(
                                "Forget Password?",
                                textAlign: TextAlign.center,
                                style: AppTextStyle().regularText().copyWith(
                                    color: AppTheme.appPrimaryColor, fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height:Responsive(context).isTabletLandscape? 8.sp:40.sp,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomFilledButton(
                              height: Responsive(context).isTabletLandscape? 30.sp:null,
                              disableButton: false,
                              title: 'Login',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {

                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      RouteConstants.allNavScreen, (route) => false,
                                      arguments: {'showWelcomeBottomSheet': false});
                                }
                              },
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              final LocalAuthentication auth = LocalAuthentication();

                              final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
                              final bool canAuthenticate = canAuthenticateWithBiometrics || await auth.isDeviceSupported();

                              },
                            child: Container(
                              width:Responsive(context).isTabletLandscape? 40.sp:68.sp,
                              height:Responsive(context).isTabletLandscape? 30.sp:56.sp,
                              margin: EdgeInsets.only(left: 20.sp),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                                  border: Border.all(color: AppTheme.grey.withOpacity(0.5))),
                              child: Icon(
                                AppIcons.fingerprint,
                                color: AppTheme.appPrimaryColor,
                                size:Responsive(context).isTabletLandscape? 20.sp:32.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
