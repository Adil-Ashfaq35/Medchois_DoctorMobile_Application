

import 'dart:io';

import 'package:doctor_app/utils/constants/AppIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/app_theme.dart';

class AuthProvider extends ChangeNotifier {




  /// --------------------create account part---------------------


  /// Controllers

  var formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  String countryCode = '+20';
  bool agree = false; /// boolean for checkbox


  /// checkbox update

  UpdateCheckBox(){
    agree = !agree;
    notifyListeners();
  }


  /// selected file list

  List<File> selectedFiles=[];  /// file upload


  /// selected files update state

  updateFiles(List<File> files){
    selectedFiles =files;
    notifyListeners();
  }


  /// get the name of file

  String getFileName(File file) {
    return file.path.split('/').last;
  }

  /// get file extension

  String getFileExtension(File file) {
    return file.path.split('.').last.toLowerCase();
  }


  /// get icon according

  Icon getFileIcon(String extension) {

    switch (extension) {
      case 'pdf':
        return Icon(AppIcons.pdf, color: AppTheme.red,size: 30.sp,);
      case 'png':
        return Icon(AppIcons.imageFile,color: AppTheme.red,size: 30.sp,);
    // Add more cases for other file types as needed
      default:
        return Icon(AppIcons.imageFile,color: AppTheme.red, size: 30.sp, );
    }
  }



}