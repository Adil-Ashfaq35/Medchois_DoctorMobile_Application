import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/app_theme.dart';

class CustomCheckBox extends StatelessWidget {
  bool value;
  OutlinedBorder? shape;
  Color? activeColor;
  void Function(bool?)? onChange;

  CustomCheckBox({this.value = false, this.onChange, this.shape, this.activeColor});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          checkboxTheme: CheckboxThemeData(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.sp)))),
      child: Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          side: BorderSide(color: AppTheme.grey.withOpacity(0.6)),
          fillColor: MaterialStateProperty.all(activeColor),
          shape: shape,
          activeColor: activeColor ?? AppTheme.appPrimaryColor,
          value: value,
          onChanged: onChange),
    );
    ;
  }
}
