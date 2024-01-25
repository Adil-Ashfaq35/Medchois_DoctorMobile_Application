
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class FollowUpProvider extends ChangeNotifier {

  bool toggleDate=false;
  bool toggleTime=false;
  String selectedDate = '';
  String selectedTime = '';

  bool showDatePicker=true;
  bool showTimePicker=true;


  DateFormat format = DateFormat('dd MMM, yyyy');


  updateDateToggle(value){
    toggleDate=value;
    notifyListeners();
  }
  updateTimeToggle(value){
    toggleTime=value;
    notifyListeners();
  }

  updateDateSelection(DateRangePickerSelectionChangedArgs args){
    selectedDate= DateFormat('dd MMM, yyyy').format(args.value).toString();
    notifyListeners();
  }

  updateTimeSelection(DateTime time){
    selectedTime= DateFormat('h:mm a').format(time);
    notifyListeners();
  }

  updateShowDatePicker(value){
    showDatePicker=value;
    notifyListeners();
  }
 updateShowTimePicker(value){
   showTimePicker=value;
    notifyListeners();
  }




}