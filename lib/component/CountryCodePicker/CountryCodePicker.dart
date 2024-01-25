import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/app_theme.dart';


class CustomCountryCodePicker extends StatelessWidget {
  String? initialSelectCountry;
  bool? hideMainText, showFlagMain;
  void Function(CountryCode)? onChange;

  CustomCountryCodePicker(
      {@required this.initialSelectCountry,
        this.onChange,
        this.hideMainText = false,
        this.showFlagMain = true});

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      padding: EdgeInsets.zero,
      initialSelection: initialSelectCountry,
      flagWidth: 24.sp,
      showFlagMain: showFlagMain,
      showCountryOnly: true,
      hideMainText: hideMainText!,
      onChanged: onChange,
      flagDecoration: const BoxDecoration(shape: BoxShape.circle),
      searchStyle: const TextStyle(color: AppTheme.appTextColor),
      searchDecoration: InputDecoration(
        hintText: 'Search for Country',
        contentPadding: EdgeInsets.all(3.sp),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: AppTheme.grey.withOpacity(0.5)),
            borderRadius: BorderRadius.all(Radius.circular(6.sp))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppTheme.grey.withOpacity(0.5)),
            borderRadius: BorderRadius.all(Radius.circular(6.sp))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppTheme.grey.withOpacity(0.5)),
            borderRadius: BorderRadius.all(Radius.circular(6.sp))),
      ),
    );
  }
}
