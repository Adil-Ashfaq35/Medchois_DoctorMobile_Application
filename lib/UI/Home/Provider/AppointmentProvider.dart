import 'package:flutter/cupertino.dart';

class AppointmentProvider extends ChangeNotifier {

  String selectedSessionOfReminder = '';
  String selectedCustomSessionOfReminder = '';


  /// cancel session
  String selectedSessionOfCancelAppointment = '';

  updateSessionReminder(value){
    selectedSessionOfReminder=value;
    notifyListeners();
  }


  updateCustomSessionReminder(value){
    selectedCustomSessionOfReminder=value;
    notifyListeners();
  }

  updateCancelSession(value){
    selectedSessionOfCancelAppointment=value;
    notifyListeners();
  }


}