

import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UserProfileProvider extends ChangeNotifier {
  TextEditingController? userBODController;
  TextEditingController? userNationality;
  TextEditingController? emailController=TextEditingController(text:"Eman_ahmed@gmail.com");
  TextEditingController? nameController=TextEditingController(text: "Eman Ahmed");
  TextEditingController? userSpokenLanguageController;
  DateTime selectedDate = DateTime.now();
  DateTime? selectDateAndTime;
  String userCountryCode = '+20';
  List userSpokenLanguage = [];


  setUserBOD(String value) {
    userBODController = TextEditingController(text: value);
    notifyListeners();
  }

  setUserNationality(CountryCode value) {
    userCountryCode = value.dialCode!;
    userNationality = TextEditingController(text: value.name);
    notifyListeners();
  }

  setUserSpokenLanguage(String value) {
    userSpokenLanguage.contains(value)
        ? userSpokenLanguage.remove(value)
        : userSpokenLanguage.add(value);
    userSpokenLanguageController = TextEditingController(
        text: userSpokenLanguage.toString().replaceAll("[", "").replaceAll("]", ""));
    print('userSpokenLanguage: $userSpokenLanguage');
    notifyListeners();
  }

  updateDate(newDate){
    selectDateAndTime=newDate;
    notifyListeners();
  }


  final languageData = {
    "languages": [
      {"name": "English", "CountryCode": "GB"},
      {"name": "Spanish", "CountryCode": "es"},
      {"name": "French", "CountryCode": "fr"},
      {"name": "German", "CountryCode": "de"},
      {"name": "Japanese", "CountryCode": "JP"},
      {"name": "Chinese", "CountryCode": "CN"},
      {"name": "Arabic", "CountryCode": "sa"},
      {"name": "Russian", "CountryCode": "RU"},
      {"name": "Hindi", "CountryCode": "IN"},
      {"name": "Portuguese", "CountryCode": "pt"}
    ]
  };
}

filePicker() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom, allowedExtensions: ['jpg', 'pdf', 'png'], allowMultiple: true);
  if (result != null) {
    List<File> files = result.paths.map((path) => File(path!)).toList();
    print("Select Files: $files");
  } else {
    // User canceled the picker
  }
}

