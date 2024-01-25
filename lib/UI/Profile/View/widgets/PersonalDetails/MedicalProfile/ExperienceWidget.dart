import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../component/Text/TextStyle.dart';
import '../../../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../../../utils/constants/AssetsImage.dart';
import '../../../../../../utils/constants/app_theme.dart';
import '../../../../Model/JobExperienceModel.dart';

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({
    super.key,
    required this.jobExperienceModel,
  });

  final JobExperienceModel jobExperienceModel;

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return ListTile(
      titleAlignment: ListTileTitleAlignment.center,
      leading: Container(
        height: 25.sp,
        width: 25.sp,
        decoration:    BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(jobExperienceModel.iconPath),
            )
        ),
      ),
      title:  RichText(
        text: TextSpan(
            text: "${jobExperienceModel.jobTitle} ",
            style: AppTextStyle().regularText().copyWith(
                color: AppTheme.appTextColor, fontSize: Responsive(context).isTabletLandscape? 12.sp: 15.sp),
            children: <TextSpan>[
              TextSpan(
                text: 'at',
                style: AppTextStyle().mediumText().copyWith(
                    color: AppTheme.lightTextColor,
                    fontSize:Responsive(context).isTabletLandscape? 10.sp:14.sp),
              ),
              TextSpan(
                text: ' ${jobExperienceModel.companyName}',
                style: AppTextStyle().mediumText().copyWith(
                    color: AppTheme.appTextColor,
                    fontSize:Responsive(context).isTabletLandscape? 10.sp:14.sp),
              ),
            ]),
      ),
      subtitle: Text(jobExperienceModel.jobLocation,style: AppTextStyle().regularText().copyWith(color: AppTheme.lightTextColor,fontSize:Responsive(context).isTabletLandscape?8.sp:12.sp,fontWeight: FontWeight.w300),),
    );
  }
}