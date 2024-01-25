import 'dart:io';

import 'package:doctor_app/Routes/router_generator.dart';
import 'package:doctor_app/Utils/Constants/RouteConstant.dart';
import 'package:doctor_app/utils/HelperFunction/HelperFunction.dart';
import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Utils/Constants/AssetsImage.dart';
import '../../../../component/AppHeader/AppHeader.dart';

import '../../../../component/Button/CustomFillButton.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../component/TextField/CustomTextField.dart';
import '../../../../utils/constants/app_theme.dart';


class AddArticle extends StatelessWidget {
  const AddArticle({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Scaffold(
      bottomNavigationBar:Container(
        color: AppTheme.white,
        height: Responsive(context).isTabletLandscape?30.sp:80.sp,
        child:  Align(
          child: Padding(
            padding: Responsive(context).isTabletLandscape? EdgeInsets.all(8.0):EdgeInsets.zero,
            child: CustomFilledButton(
              height: 50.sp,
              width: 0.9.sw,
              disableButton: false,
              title: 'Continue to Article',
              onPressed: () {
                Navigator.pushNamed(context, RouteConstants.writeArticleDescription);
              },
            ),
          ),
        ),

      ) ,
      body: Stack(
        children: [
          AppHeader(
            title: 'Add Article',
          ),

          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: Responsive(context).isTabletLandscape?45.sp:120.sp),
            padding: Responsive(context).isTabletLandscape? EdgeInsets.fromLTRB(20.sp, 20.sp, 20.sp, 0): EdgeInsets.all(20.sp),
            decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.sp), topRight: Radius.circular(32.sp))),
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: Responsive(context).isTabletLandscape?5.sp:30.sp),
              child: SingleChildScrollView(
                physics: Responsive(context).isTabletLandscape?  BouncingScrollPhysics():NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title",
                      textAlign: TextAlign.center,
                      style: AppTextStyle()
                          .regularText()
                          .copyWith(fontSize: Responsive(context).isTabletLandscape?8.sp:14.sp,fontWeight: FontWeight.w500, color: AppTheme.appTextColor,),
                    ),
                    SizedBox(height: 5.sp,),
                
                    CustomTextFormField(
                     // controller: passwordController,
                      hintText: "",
                      inputType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      suffixIconConstraints: BoxConstraints.tight(Size(50.sp,Responsive(context).isTabletLandscape? 20.sp:30.sp)),
                      suffixWidget: InkWell(
                        onTap:(){}),
                      validator: (value) =>
                      value!.isEmpty ? "Please Enter Title" : null,
                    ),
                
                
                
                    SizedBox(height: Responsive(context).isTabletLandscape?20.sp:40.sp,),
                
                
                    Text(
                      "Featured Image",
                      textAlign: TextAlign.center,
                      style: AppTextStyle()
                          .regularText()
                          .copyWith(fontSize: Responsive(context).isTabletLandscape?8.sp:14.sp,fontWeight: FontWeight.w500, color: AppTheme.appTextColor,),
                    ),
                    SizedBox(height: 10.sp,),
                    DottedBorder(
                      borderType: BorderType.RRect,
                      color: AppTheme.grey,
                      strokeWidth: 0.8,
                      dashPattern: const [7, 4],
                      radius: Radius.circular(8.sp),
                      child: InkWell(
                          onTap: () async => await HelperFunction().filePicker(
                        allowedExtensions: ['jpg', 'pdf', 'png'],
                        allowMultiple: false,
                        type: FileType.custom,
                        onFilesPicked: (List<File> files) {
                          // selectedFiles = files;
                        },
                      ),
                        child: Container(
                          height:Responsive(context).isTabletLandscape?80.sp:115.sp,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 10.sp),
                          decoration: BoxDecoration(
                            color: AppTheme.grey.withOpacity(0.08),
                            borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                AssetsImages.cloudUploadIcon,
                                height: 24.sp,
                                width: 24.sp,
                              ),
                              Text(
                                "Upolad File from gallery",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: AppTextStyle()
                                    .boldText()
                                    .copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp: 14.sp, color: AppTheme.appPrimaryColor),
                              ),
                              Text(
                                "Support JPG, PNG and PDF ",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: AppTextStyle().regularText().copyWith(
                                    fontSize:Responsive(context).isTabletLandscape? 8.sp:12.sp, color: AppTheme.grey.withOpacity(0.8)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),


                    SizedBox(height: 20.sp,),
                
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
