import 'dart:io';
import 'package:doctor_app/UI/Auth/View/Login/View/widgets/successBottomSheet.dart';
import 'package:doctor_app/component/Button/CustomCheckBox.dart';
import 'package:doctor_app/component/Button/CustomFillButton.dart';
import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../../Utils/Constants/AssetsImage.dart';
import '../../../../component/AppHeader/AppHeader.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../component/TextField/CustomTextField.dart';
import '../../../../utils/HelperFunction/HelperFunction.dart';
import '../../../../utils/constants/app_theme.dart';
import '../../Provider/AuthProvider.dart';


class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return  Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
        return Scaffold(
          body: Stack(
            children: [
              AppHeader(
                title: 'Create Account',
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
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome to Medchoice",
                            style: AppTextStyle().boldText().copyWith(fontSize:Responsive(context).isTabletLandscape? 12.sp: 24.sp,),
                          ),
                          Text(
                            "send us an email with your information and we’ll contact you in 48 hours.",
                            textAlign: TextAlign.left,
                            style: AppTextStyle()
                                .regularText()
                                .copyWith(color: AppTheme.grey, fontSize:Responsive(context).isTabletLandscape? 8.sp:15.sp,
                                  fontWeight: FontWeight.w400
                            ),
                          ),
                          SizedBox(
                            height:Responsive(context).isTabletLandscape? 8.sp: 20.sp,
                          ),
                          Text(
                            "Full Name",
                            textAlign: TextAlign.center,
                            style: AppTextStyle().regularText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp: 14.sp,fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 3.sp,
                          ),


                          CustomTextFormField(
                          //  controller: emailController,
                            hintText: "Full Name",
                            inputType: TextInputType.emailAddress,
                            contentPadding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(vertical: 5.sp,horizontal: 5.sp): null,
                            validator: (value) =>
                           EmailValidator.validate(value!) ? null : "Please enter a valid email",
                           // onFieldSubmit: ()=> HelperFunction.fieldFocusChange(),
                          ),


                          SizedBox(height:Responsive(context).isTabletLandscape? 10.sp:20.sp,),

                          Text(
                            "Email Address",
                            textAlign: TextAlign.center,
                            style: AppTextStyle().regularText().copyWith(fontSize:Responsive(context).isTabletLandscape?8.sp: 14.sp,fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 3.sp,
                          ),


                          CustomTextFormField(
                            //  controller: emailController,
                            hintText: "Your email Address",
                            inputType: TextInputType.emailAddress,

                            contentPadding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(vertical: 5.sp,horizontal: 5.sp): null,
                            validator: (value) =>
                            EmailValidator.validate(value!) ? null : "Please enter a valid email",
                          ),


                          SizedBox(height:Responsive(context).isTabletLandscape? 8.sp:20.sp,),


                          Text(
                            "Add Medical Licence(pdf,PNG,jpg)",
                            textAlign: TextAlign.center,
                            style: AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp,fontWeight: FontWeight.w500),
                          ),


                          SizedBox(height: 20.sp,),

                          authProvider.selectedFiles.isNotEmpty?
                          
                          Column(
                            children: [
                              Row(
                                children: [
                                  authProvider.getFileIcon(authProvider.getFileExtension(authProvider.selectedFiles[0])),
                                  SizedBox(width: 10.sp,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("${authProvider.getFileName(authProvider.selectedFiles[0])}"),
                                      SizedBox(height: 8.sp,),
                                      SizedBox(
                                          height: 7.sp,
                                          width: 0.7.sw,
                                          child: LinearProgressIndicator(color: AppTheme.appPrimaryColor,backgroundColor: AppTheme.lightFilledColor,value: 0.2,
                                            minHeight: 10.sp,
                                            borderRadius: BorderRadius.circular(10.r),

                                          ))
                                    ],
                                  )
                                ],
                              )
                            ],
                          ):SizedBox.shrink(),


                          SizedBox(height:Responsive(context).isTabletLandscape? 20.sp:40.sp,),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap:() async => await HelperFunction().filePicker(
                                  allowedExtensions: ['jpg', 'pdf', 'png'],
                                  allowMultiple: false,
                                  type: FileType.custom,
                                  onFilesPicked: (List<File> files) {
                                    authProvider.updateFiles(files);
                                  },
                                ),
                                child: Container(
                                  height:Responsive(context).isTabletLandscape? 30.sp:50.sp,
                                  width:Responsive(context).isTabletLandscape? 120.sp:150.sp,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image(
                                          height:Responsive(context).isTabletLandscape? 10.sp:30.sp,
                                          width: 30.sp,
                                          image: const AssetImage(AssetsImages.uploadIcon),),
                                        SizedBox(width:Responsive(context).isTabletLandscape? 1.sp:10.sp,),
                                         Text("Upload File",style: TextStyle(
                                          color: Colors.blue,
                                          fontSize:Responsive(context).isTabletLandscape? 8.sp:13.sp,
                                        ),),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap:() async => await HelperFunction().pickFileFromSource(
                                    ImageSource.camera, (p0) =>(){
                                      setState(() {});
                                    }),
                                child: Container(
                                  height:Responsive(context).isTabletLandscape? 30.sp:50.sp,
                                  width:Responsive(context).isTabletLandscape? 120.sp:150.sp,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image(
                                          height:Responsive(context).isTabletLandscape?10.sp:30.sp,
                                          width: 30.sp,
                                          image: const AssetImage(AssetsImages.cameraIcon),),
                                        SizedBox(width:Responsive(context).isTabletLandscape? 1.sp:10.sp,),
                                         Text("Capture File",style: TextStyle(
                                          color: Colors.blue,
                                          fontSize:Responsive(context).isTabletLandscape? 8.sp:13.sp,
                                        ),),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),


                          SizedBox(height:Responsive(context).isTabletLandscape? 10.sp:30.sp,),






                          Row(
                            children: [
                              CustomCheckBox(
                                value: authProvider.agree,
                                onChange: (value) => authProvider.UpdateCheckBox(),
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                      text: "Agree to ",
                                      style: AppTextStyle().regularText().copyWith(
                                          color: AppTheme.grey, fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Terms & conditions',
                                          style: AppTextStyle().mediumText().copyWith(
                                              color: AppTheme.appPrimaryColor,
                                              fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp),
                                        ),
                                      ]),
                                ),
                              )
                            ],
                          ),

                          SizedBox(
                            height: 15.sp,
                          ),

                        ],
                      ),
                      CustomFilledButton(
                        height: Responsive(context).isTabletLandscape? 30.sp:null,
                        disableButton: false,
                        title: 'Send Email',
                        fontSize: Responsive(context).isTabletLandscape? 10.sp:null,
                        onPressed: () {
                          WelcomeBottomSheet().welcomeBottomSheet(context);
                          // if (formKey.currentState!.validate()) {
                          //   Navigator.of(context)
                          //       .pushNamed(RouteConstants.loginPasswordScreen, arguments: {
                          //     "is_phone_number": true,
                          //     "user_enter_data": "$countryCode${phoneNumberController.text}",
                          //   });
                          // }
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
    );
  }
}
