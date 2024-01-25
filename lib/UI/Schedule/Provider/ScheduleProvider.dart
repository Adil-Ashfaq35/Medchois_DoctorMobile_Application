import 'package:flutter/cupertino.dart';

class ScheduleProvider extends ChangeNotifier {



    bool _isChecked = false;
    String? _selectedSession;

    bool get isChecked => _isChecked;
    String? get selectedSession => _selectedSession;

    void sessionSelectionUpdate(bool value, String label) {
      _isChecked = value;
      if (value) {
        _selectedSession = label;
      } else {
        _selectedSession = null;
      }
      notifyListeners();
    }
}

