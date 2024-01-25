import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../Utils/Constants/RouteConstant.dart';
import '../../../../../../component/Button/CustomFillButton.dart';
import '../../../../../../component/Text/TextStyle.dart';
import '../../../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../../../utils/constants/AppIcons.dart';
import '../../../../../../utils/constants/app_theme.dart';
import '../../../../Provider/MedicalProfileProvider.dart';

class CertificateScreen extends StatefulWidget {
  const CertificateScreen({super.key});

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MedicalProfileProvider>(
        builder: (context,medicalProfileProvider,_){
        return Column(
          children: [
          ListTile(
          titleAlignment: ListTileTitleAlignment.center,
          title:  RichText(
            text: TextSpan(
                text: "Plant Based ",
                style: AppTextStyle().regularText().copyWith(
                    color: AppTheme.appTextColor, fontSize: 12.sp),
                children: <TextSpan>[
                  TextSpan(
                    text: 'from ',
                    style: AppTextStyle().mediumText().copyWith(
                        color: AppTheme.lightTextColor,
                        fontSize: 12.sp),
                  ),
                  TextSpan(
                    text: 'Coursera',
                    style: AppTextStyle().mediumText().copyWith(
                        color: AppTheme.appTextColor,
                        fontSize: 12.sp),
                  ),

                ]),
          ),
          subtitle: Text("Germany",style: AppTextStyle().regularText().copyWith(color: AppTheme.appTextColor,fontSize:15.sp,fontWeight: FontWeight.w300),),
        ),


            SizedBox(height:30.sp),


            CustomFilledButton(
                borderColor: AppTheme.grey,
                borderWidth: 1,
                buttonGradients: const LinearGradient(colors: [
                  AppTheme.white,
                  AppTheme.white
                ]),
                buttonIcon: AppIcons.add,
                buttonIconColor: AppTheme.appPrimaryColor,
                btnColor: AppTheme.appScreenBackgroundColor,
                textColor: AppTheme.appPrimaryColor,
                fontSize: Responsive(context).isTabletLandscape? 10.sp:null,
                title: 'Add Certificate',
                disableButton: false,
                onPressed: () {
                   Navigator.pushNamed(context, RouteConstants.addCertificate);
                }),
          ],
        );
      }
    );
  }
}
