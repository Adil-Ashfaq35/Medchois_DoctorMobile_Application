// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../../Utils/Constants/RouteConstant.dart';
// import '../../../../../component/AppHeader/AppHeader.dart';
// import '../../../../../component/Button/CustomFillButton.dart';
// import '../../../../../component/Text/TextStyle.dart';
// import '../../../../../component/TextField/CustomTextField.dart';
// import '../../../../../utils/constants/AppIcons.dart';
// import '../../../../../utils/constants/app_theme.dart';
//
//
// class LoginPassword extends StatefulWidget {
//   var data;
//
//   LoginPassword({this.data});
//
//   @override
//   State<LoginPassword> createState() => _LoginPasswordState();
// }
//
// class _LoginPasswordState extends State<LoginPassword> {
//   var formKey = new GlobalKey<FormState>();
//
//   bool isObscure = true;
//
//   final TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           AppHeader(
//             title: 'Login',
//           ),
//           Container(
//             alignment: Alignment.topLeft,
//             margin: EdgeInsets.only(top: 120.sp),
//             padding: EdgeInsets.all(20.sp),
//             decoration: BoxDecoration(
//                 color: AppTheme.white,
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(32.sp), topRight: Radius.circular(32.sp))),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Form(
//                         key: formKey,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Welcome Back, Ibrahim 👋",
//                               style: AppTextStyle().regularText().copyWith(fontSize: 24.sp),
//                             ),
//                             Text(
//                               "Enter your password to proceed",
//                               textAlign: TextAlign.center,
//                               style: AppTextStyle()
//                                   .regularText()
//                                   .copyWith(color: AppTheme.grey, fontSize: 16.sp),
//                             ),
//                             SizedBox(
//                               height: 20.sp,
//                             ),
//                             Text(
//                               "Password",
//                               textAlign: TextAlign.center,
//                               style: AppTextStyle().regularText().copyWith(fontSize: 14.sp),
//                             ),
//                             SizedBox(
//                               height: 3.sp,
//                             ),
//                             CustomTextFormField(
//                               controller: passwordController,
//                               hintText: "Your Password",
//                               isObscure: isObscure,
//                               inputType: TextInputType.text,
//                               textCapitalization: TextCapitalization.sentences,
//                               suffixIconConstraints: BoxConstraints.tight(Size(50.sp, 30.sp)),
//                               suffixWidget: InkWell(
//                                 onTap: () =>
//                                     setState(() {
//                                       isObscure = !isObscure;
//                                     }),
//                                 child: Icon(
//                                   isObscure ? AppIcons.eyeClose : AppIcons.eye,
//                                   size: 20.sp,
//                                   color: AppTheme.grey,
//                                 ),
//                               ),
//                               validator: (value) =>
//                               value!.isEmpty ? "Please enter new password" : null,
//                             ),
//                             SizedBox(
//                               height: 8.sp,
//                             ),
//                             InkWell(
//                               onTap: () =>
//                                   Navigator.of(context).pushNamed(
//                                       RouteConstants.forgetOtpVerificationScreen,
//                                       arguments: {
//                                         "is_phone_number": widget.data['is_phone_number'],
//                                         "user_enter_data": widget.data['user_enter_data'],
//                                       }),
//                               child: Text(
//                                 "Forget Password?",
//                                 textAlign: TextAlign.center,
//                                 style: AppTextStyle().regularText().copyWith(
//                                     color: AppTheme.appPrimaryColor, fontSize: 14.sp),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 40.sp,
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: CustomFilledButton(
//                               disableButton: false,
//                               title: 'Login',
//                               onPressed: () {
//                                 if (formKey.currentState!.validate()) {
//                                   Navigator.of(context).pushNamedAndRemoveUntil(
//                                       RouteConstants.homeScreen, (route) => false,
//                                       arguments: {'showWelcomeBottomSheet': false});
//                                 }
//                               },
//                             ),
//                           ),
//                           Container(
//                             width: 68.sp,
//                             height: 56.sp,
//                             margin: EdgeInsets.only(left: 20.sp),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.all(Radius.circular(8.sp)),
//                                 border: Border.all(color: AppTheme.grey.withOpacity(0.5))),
//                             child: Icon(
//                               AppIcons.fingerprint,
//                               color: AppTheme.appPrimaryColor,
//                               size: 32.sp,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
