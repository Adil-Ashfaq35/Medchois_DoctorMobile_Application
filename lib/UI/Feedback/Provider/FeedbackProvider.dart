import 'package:flutter/material.dart';

class FeedbackProvider extends ChangeNotifier {
  Map<dynamic, dynamic> negativeFeedbackReason = {
    "reason": "",
    "comment": null,
  };

  setNegativeFeedbackReasonReason(String? reason, {bool comment = false, String? otherComment}) {
    if (!comment) {
      negativeFeedbackReason['reason'] = reason!;
    } else {
      negativeFeedbackReason['comment'] = otherComment!;
    }

    print("Reason: $negativeFeedbackReason");
    notifyListeners();
  }
}
