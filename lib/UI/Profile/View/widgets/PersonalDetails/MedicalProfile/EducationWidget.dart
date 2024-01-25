import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../component/Text/TextStyle.dart';
import '../../../../../../utils/constants/app_theme.dart';
import '../../../../Model/EducationModel.dart';
import '../../../../Model/JobExperienceModel.dart';

class EducationWidget extends StatelessWidget {
  const EducationWidget({
    super.key,
    required this.educationModel,
  });

  final EducationModel educationModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.center,
      leading: Container(
        height: 30.sp,
        width: 30.sp,
        decoration:    BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: AssetImage(educationModel.iconPath),
              fit: BoxFit.cover,
            )
        ),
      ),
      subtitle:  RichText(
        text: TextSpan(
            text: "${educationModel.educationLocation}  ",
            style: AppTextStyle().regularText().copyWith(
                color: AppTheme.lightTextColor, fontSize: 12.sp),
            children: <TextSpan>[
              TextSpan(
                text: '⚬',
                style: AppTextStyle().mediumText().copyWith(
                    color: AppTheme.lightTextColor,
                    fontSize: 12.sp),
              ),
              TextSpan(
                text: ' ${educationModel.startDate}',
                style: AppTextStyle().mediumText().copyWith(
                    color: AppTheme.lightTextColor,
                    fontSize: 12.sp),
              ),
              TextSpan(
                text: ' -',
                style: AppTextStyle().mediumText().copyWith(
                    color: AppTheme.lightTextColor,
                    fontSize: 12.sp),
              ),
              TextSpan(
                text: ' ${educationModel.endDate}',
                style: AppTextStyle().mediumText().copyWith(
                    color: AppTheme.lightTextColor,
                    fontSize: 12.sp),
              ),
            ]),
      ),
      title: Text(educationModel.universityName,style: AppTextStyle().regularText().copyWith(color: AppTheme.appTextColor,fontSize:15.sp,fontWeight: FontWeight.w300),),
    );
  }
}