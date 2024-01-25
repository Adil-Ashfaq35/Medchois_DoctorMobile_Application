
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class Responsive{

  late BuildContext context;

  Responsive(this.context) ;



  bool get isTabletPortrait {
    return ResponsiveBreakpoints.of(context).isTablet && MediaQuery.of(context).orientation == Orientation.portrait;
  }

  bool get isTabletLandscape {
    return ResponsiveBreakpoints.of(context).isTablet && MediaQuery.of(context).orientation == Orientation.landscape;
  }

  setOrientation(BuildContext context) {
      if (ResponsiveBreakpoints.of(context).isTablet) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      } else {
        SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      }
  }


}