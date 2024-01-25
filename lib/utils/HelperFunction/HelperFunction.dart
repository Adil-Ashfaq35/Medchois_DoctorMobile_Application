
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class HelperFunction {

  final ImagePicker picker =ImagePicker();



  // filePicker() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //       type: FileType.custom, allowedExtensions: ['jpg', 'pdf', 'png'], allowMultiple: true);
  //   if (result != null) {
  //     List<File> files = result.paths.map((path) => File(path!)).toList();
  //     print("Select Files: $files");
  //   } else {
  //     // User canceled the picker
  //   }
  // }


  static void fieldFocusChange(BuildContext context , FocusNode current , FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }


  Future<void> filePicker({
    required FileType type,
    required List<String> allowedExtensions,
    required bool allowMultiple,
    required Function(List<File>) onFilesPicked,
  }) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: type,
      allowedExtensions: allowedExtensions,
      allowMultiple: allowMultiple,
    );

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      onFilesPicked(files);
      print("Selected Files: $files");
    } else {
      // User canceled the picker
    }
  }






  Future<void> pickFileFromSource(
      ImageSource source,
      Function(XFile?) onFilePicked,
      ) async {
    try {
      final pickedFile = await picker.pickImage(
        source: source,
      );
      onFilePicked(pickedFile);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}



