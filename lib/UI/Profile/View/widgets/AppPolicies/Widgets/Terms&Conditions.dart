import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../component/Button/CustomFillButton.dart';
import '../../../../../../component/Text/TextStyle.dart';
import '../../../../../../utils/constants/app_theme.dart';

class TermsAndConditions extends StatelessWidget {
  TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
              Text(
                "Our terms & conditions",
                style: AppTextStyle().regularText().copyWith(fontSize: Responsive(context).isTabletLandscape? 13.sp:20.sp),
              ),
              Text(
                "Make sure you read our terms& conditions well ",
                textAlign: TextAlign.center,
                style: AppTextStyle()
                    .regularText()
                    .copyWith(color: AppTheme.grey, fontSize:Responsive(context).isTabletLandscape? 12.sp:14.sp),
              ),
              SizedBox(
                height:Responsive(context).isTabletLandscape? 7.sp:20.sp,
              ),
              Text(
                "text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n\n"
                "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                textAlign: TextAlign.justify,
                style: AppTextStyle()
                    .regularText()
                    .copyWith(color: AppTheme.grey, fontSize:Responsive(context).isTabletLandscape? 10.sp:16.sp),
              ),
                        ],
                      ),
            )),
        Padding(
          padding: EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape?0.sp:10.sp),
          child: CustomFilledButton(
            borderColor: AppTheme.grey.withOpacity(0.3),
            buttonGradients: LinearGradient(colors: [
              AppTheme.appScreenBackgroundColor,
              AppTheme.appScreenBackgroundColor
            ]),
            textColor: AppTheme.appPrimaryColor,
            title: 'Download as PDF',
            disableButton: false,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
