import 'package:doctor_app/UI/Profile/Model/EducationModel.dart';
import 'package:flutter/cupertino.dart';

import '../Model/JobExperienceModel.dart';

class MedicalProfileProvider extends ChangeNotifier {


  TextEditingController experienceController =TextEditingController(text: "0");


  List<JobExperienceModel> jobExperienceModel=[];
  List<EducationModel> educationModel = [];





  updateExperience(value){
    experienceController.text=value;
    notifyListeners();
  }

  increaseExperienceValue(){
    int experienceInNumber=int.parse(experienceController.text);
     experienceInNumber=experienceInNumber+1;
    experienceController.text=experienceInNumber.toString();
    notifyListeners();
  }

  decreaseExperienceValue() {
    int experienceInNumber = int.parse(experienceController.text);

    // Ensure the value doesn't go below 0
    if (experienceInNumber > 0) {
      experienceInNumber = experienceInNumber - 1;
      experienceController.text = experienceInNumber.toString();
      notifyListeners();
    }
  }


  removeExperience(index){
    jobExperienceModel.removeAt(index);
    notifyListeners();

  }




}