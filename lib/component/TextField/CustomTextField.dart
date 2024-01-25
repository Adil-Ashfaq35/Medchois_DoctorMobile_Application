import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/HelperFunction/Reponsive.dart';
import '../../utils/constants/app_theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? obscureCharacter;
  final bool isEnable, isObscure, autofocus, isDense;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final FocusNode? node;
  EdgeInsetsGeometry? contentPadding;
  void Function(String)? onChange;
  String? Function(String?)? validator;
  void Function()? onTap;
  final Function? onFieldSubmit, onEditingComplete;
  final TextInputAction? inputAction;
  final bool readOnly;
  final bool ?expands;
  final Widget? suffixWidget, prefixWidget;
  final VoidCallback? onPressedLeadingIcon;
  final String? labelText;
  final double? borderRadius;
  final int maxLines;
  final String? initialValue;
  final Color? cursorColor, fillColor, textFieldTextColor;
  final Color? labelColor;
  final Color? borderColor;
  final int? numberLength;
  final String? counterText;
  final TextCapitalization? textCapitalization;
  final AutovalidateMode? autoValidateMode;
  final TextStyle? hintStyle;
  final BoxConstraints? boxConstraints;
  BoxConstraints? prefixIconConstraints, suffixIconConstraints;

  CustomTextFormField(
      {this.validator,
        this.borderRadius,
        this.borderColor,
        this.textFieldTextColor,
        this.initialValue,
        this.cursorColor,
        this.fillColor,
        this.boxConstraints,
        this.prefixIconConstraints,
        this.suffixIconConstraints,
        this.numberLength,
        this.inputAction,
        this.isEnable = true,
        this.isObscure = false,
        this.autofocus = false,
        this.obscureCharacter,
        this.onFieldSubmit,
        this.prefixWidget,
        this.hintText,
        this.inputType,
        this.controller,
        this.expands,
        this.node,
        this.onChange,
        this.suffixWidget,
        this.readOnly = false,
        this.onPressedLeadingIcon,
        this.labelText,
        this.maxLines = 1,
        this.onTap,
        this.contentPadding,
        this.counterText,
        this.onEditingComplete,
        this.textCapitalization,
        this.labelColor,
        this.isDense = true,
        this.autoValidateMode,
        this.hintStyle});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return TextFormField(
      autovalidateMode: autoValidateMode,
      style: TextStyle(
          fontSize: Responsive(context).isTabletLandscape? 8.sp:15.sp, color: AppTheme.appTextColor, fontWeight: FontWeight.w400,
      ),
      cursorColor: cursorColor ?? AppTheme.appPrimaryColor,
      autofocus: autofocus,
      enabled: isEnable,
      obscureText: isObscure,
      focusNode: node,
      onTap: onTap,
      expands:expands?? false,
      onFieldSubmitted: onFieldSubmit as void Function(String)?,
      initialValue: initialValue,
      controller: controller,
      textAlign: TextAlign.start,
      textInputAction: inputAction,
      keyboardType: inputType,
      maxLines: maxLines,
      readOnly: readOnly,
      maxLength: numberLength,
      textCapitalization: textCapitalization ?? TextCapitalization.words,
      onEditingComplete: onEditingComplete as void Function()?,
      decoration: InputDecoration(
          isDense: isDense,
          counter: const SizedBox(),
          prefixIcon: prefixWidget,
          prefixIconConstraints: prefixIconConstraints,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          counterText: counterText,
          fillColor: fillColor ?? AppTheme.transparent,
          counterStyle: const TextStyle(color: AppTheme.appPrimaryColor),
          suffixIcon: suffixWidget,
          suffixIconConstraints: suffixIconConstraints,
          hintText: hintText,
          constraints: boxConstraints,
          labelText: labelText,
          labelStyle: TextStyle(
              color: AppTheme.appPrimaryColor, fontSize:Responsive(context).isTabletLandscape? 5.sp:15.sp, fontWeight: FontWeight.w400),
          hintStyle: hintStyle ??
              TextStyle(color: AppTheme.grey.withOpacity(0.5), fontSize:Responsive(context).isTabletLandscape?5.sp:12.sp, height: 1.5),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor ?? AppTheme.grey.withOpacity(0.5)),
              borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 6.sp))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor ?? AppTheme.grey.withOpacity(0.5)),
              borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 6.sp))),
          focusedBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: borderColor ?? AppTheme.appPrimaryColor.withOpacity(0.5)),
              borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 6.sp))),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor ?? AppTheme.grey.withOpacity(0.5)),
              borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 6.sp))),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(8.sp))),
          errorStyle: TextStyle(color: AppTheme.red, height: 1.1, fontSize:Responsive(context).isTabletLandscape?8.sp:13.sp),
          errorMaxLines: 3,
          contentPadding: contentPadding ??  EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape? 5.sp:8.sp, horizontal:Responsive(context).isTabletLandscape? 5.sp:8.sp),
          alignLabelWithHint: true,
          filled: true),
      validator: validator,
      onChanged: onChange,
      onSaved: (String? val) {
        controller!.text = val!;
      },
    );
  }
}
