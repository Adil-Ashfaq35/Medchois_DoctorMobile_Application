import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../component/AppHeader/AppHeader.dart';
import '../../../../component/Button/CustomFillButton.dart';
import '../../../../component/TextField/CustomTextField.dart';
import '../../../../utils/constants/app_theme.dart';


class WriteArticleDescription extends StatelessWidget {
   WriteArticleDescription({super.key});

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
            margin: EdgeInsets.only(top: Responsive(context).isTabletLandscape?37.sp:120.sp),
            padding: EdgeInsets.all(20.sp),
            decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.sp), topRight: Radius.circular(32.sp))),
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 5.sp),
              child:  SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      hintText: "Description",
                      inputType: TextInputType.multiline,
                      borderColor: Colors.transparent,
                      maxLines: 25,
                      textCapitalization: TextCapitalization.sentences,
                      suffixIconConstraints: BoxConstraints.tight(Size(50.sp, 30.sp)),
                      suffixWidget: InkWell(
                          onTap:(){}),
                      validator: (value) =>
                      value!.isEmpty ? "Please Enter Title" : null,
                    ),
                
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


