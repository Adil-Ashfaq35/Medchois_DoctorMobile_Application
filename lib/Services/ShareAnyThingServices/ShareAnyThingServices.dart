import 'package:share_plus/share_plus.dart';

class ShareServices {
  showShareOptions() {
    Share.share('check out my website https://example.com', subject: 'Look what I made!');
  }
}
