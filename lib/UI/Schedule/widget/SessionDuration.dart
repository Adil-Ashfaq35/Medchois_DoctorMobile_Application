

import 'package:doctor_app/UI/Schedule/Provider/ScheduleProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../component/Text/TextStyle.dart';
import '../../../utils/HelperFunction/Reponsive.dart';
import '../../../utils/constants/app_theme.dart';

class SessionDurationSelection extends StatelessWidget {
  final String label;
  const SessionDurationSelection({
    super.key,
    required this.isChecked,
    required this.label,
  });

  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    ScheduleProvider scheduleProvider = context.read<ScheduleProvider>();
    // Check if the current option is selected
    bool isSelected = scheduleProvider.selectedSession == label;
    return Container(
      width:Responsive(context).isTabletLandscape? 70.sp: 99.sp,
      height:Responsive(context).isTabletLandscape? 30.sp: 48.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        border: Border.all(color: isSelected? Colors.blue:Colors.transparent),
        color:isSelected? const Color(0xFFEDF9F7): const Color(0xFFF5F7FA),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          Checkbox(
            value: isChecked,
            onChanged: (value) {
              context.read<ScheduleProvider>().sessionSelectionUpdate(value!, label);
            },
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: AppTextStyle().regularText().copyWith(color: AppTheme.appTextColor,fontWeight: FontWeight.w500, fontSize:Responsive(context).isTabletLandscape? 8.sp:13.sp),
          ),

        ],
      ),
    );
  }
}