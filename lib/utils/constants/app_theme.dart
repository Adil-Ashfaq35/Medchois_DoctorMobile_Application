import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static const Color darkBackgroundColor = Color(0xFF181C1E);
  static const Color darkCardColor = Color(0xFF262F34);
  static const Color darkLightColor = Color(0xFF656D77);
  static const Color lightBackgroundColor = Colors.white;
  static const Color propertyContainer = Color(0xFF0096FB);
  static const Color lightCardColor = Color(0xFFF4F8FA);
  static const Color paymentBtnColor = Color(0xFF138EC3);
  static const Color primaryColor = Color(0xFF26B3F0);
  static const Color secondaryColor = Color(0xFF2C91D4);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color unselectedItemColor = Color(0xFF787878);
  static const Color redColor = Color(0xFFD73A49);
  static const Color btnColor = Color(0xFF348CEB);
  static const Color lightTextColor = Color(0xFF92929F);
  static const Color fieldTextColor = Color(0xFFF2F2F2);
  static const Color unselectedDarkColor = Color(0xFF808080);
  static const Color greyTextColor = Color(0xFFC8C8C8);
  static const Color blackColor = Color(0xFF000000);
  static const Color bottomSheetCloseButtonBgColor = Color(0xffC8C9D0);
  static const Color splashColor = Color(0x1F000000);
  static const Color arabicColor = Color(0xFF005371);
  static const Color yellowColor = Color(0xFFFFB501);
  static const Color searchIcon = Color(0xFF005371);
  static const Color greenColor = Color(0xFF05CC61);
  static const Color borderColor = Color(0xFFE4E4E7);
  static const Color lightTxtColor = Color(0xFF92929F);
  static const Color lightFilledColor = Color(0xFFF5F7FA);

  static const Color kGrey = Colors.grey;
  static const Color kBlack = Colors.black;
  static const Color transparent = Colors.transparent;
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color blue = Colors.blue;
  static const Color grey = Colors.grey;
  static const Color red = Colors.red;
  static const Color appPrimaryColor = Color(0xff2C91D4);
  static const Color appLightGreenColor = Color(0xff18C9BF);
  static const Color appTextColor = Color(0xFF14212D);
  static const Color appScreenBackgroundColor = Color(0xffF5F7FA);
  static const Color appBrownColor = Color(0xff805B19);
  static const Color appYellowColor = Color(0xffFDBE4C);
  static const Color appGreenColor = Color(0xff1BA10F);
  static const Color appPurpleColor = Color(0xff6667AB);
  static const Color appSecondaryColor = Colors.white;
  static const Color appButtonColor1 = Color(0xff6667AB);
  static const Color appButtonColor2 = Color(0xff63C0FD);
  static const Color doctorExamColor = Color(0x0C18C9BF);
  static const Color appNeutralColor = Colors.white;




  static LinearGradient rootLinearGradient = LinearGradient(
    colors: [
      const Color(0xFF959595).withOpacity(0.6),
      const Color(0xFFCC4BD5).withOpacity(0.3),
      const Color(0xFFAA9387).withOpacity(0.3),
      const Color(0xFFE6B772).withOpacity(0.4),
      const Color(0xFFFFBB56).withOpacity(0.2),
    ],
    begin: FractionalOffset.bottomLeft,
    end: FractionalOffset.topCenter,
  );



  /// homepage gradient

  static LinearGradient homePageHeaderGradient = const LinearGradient(
    begin: Alignment(0.81, -0.58),
    end: Alignment(-0.81, 0.58),
    colors: [Color(0xFF6667AB), Color(0xFF63C0FD)],
  );

  static Gradient? buttonGradient = LinearGradient(
      colors: [appButtonColor2, appPrimaryColor.withOpacity(0.8)]);

  static const Gradient screenBackgroundGradient =
      RadialGradient(center: Alignment.center, radius: 1.2, stops: [
    0.3,
    1,
  ], colors: [
    Color(0xff63C0FD),
    Color(0xff6667AB)
  ]);

  static Shadow textShadow = const Shadow(
    color: AppTheme.darkLightColor,
    offset: Offset(1, 1),
  );

  static Gradient? headerBackgroundGradient1 = LinearGradient(
      colors: [appButtonColor1.withOpacity(0.8), appButtonColor2]);

  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: GoogleFonts.inter().fontFamily,
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      primaryColorLight: Colors.white,
      splashColor: splashColor,
      brightness: Brightness.light,
      highlightColor: splashColor,
      focusColor: primaryColor,
      iconTheme: const IconThemeData(color: Colors.black),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          letterSpacing: 1,
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        displayMedium: TextStyle(
          fontSize: 18.sp,
          color: Colors.black,
        ),
        displaySmall: TextStyle(
          fontSize: 15.sp,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        bodyLarge: TextStyle(
          fontSize: 12.sp,
          color: Colors.black,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: 14.sp,
        ),
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: btnColor,
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          shape: RoundedRectangleBorder(
              //to set border radius to button
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: primaryColor),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(
            secondary: const Color(0xFF79A6DC),
            brightness: Brightness.light,
          )
          .copyWith(secondary: primaryColor)
          .copyWith(secondary: primaryColor)
          .copyWith(background: lightBackgroundColor)
          .copyWith(error: redColor),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      fontFamily: GoogleFonts.inter().fontFamily,
      canvasColor: darkBackgroundColor,
      primaryColor: darkBackgroundColor,
      unselectedWidgetColor: Colors.blueGrey.withOpacity(0.4),
      scaffoldBackgroundColor: darkBackgroundColor,
      primaryColorLight: const Color(0xFF2D333A),
      focusColor: const Color(0xFF444C56),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.white),
      dividerColor: Colors.white,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: Color(0xffFAFAFA),
        ),
        displayMedium: TextStyle(
          color: Color(0xffFAFAFA),
        ),
        bodyLarge: TextStyle(
          color: Color(0xffFAFAFA),
        ),
        bodyMedium: TextStyle(
          color: Color(0xffFAFAFA),
        ),
      ),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(
            secondary: const Color(0xFF6E7681),
            brightness: Brightness.dark,
          )
          .copyWith(background: darkBackgroundColor)
          .copyWith(error: redColor),
    );
  }
}

extension MyThemeData on ThemeData {
  bool get isDarkTheme => brightness == Brightness.dark;

  bool get isLightTheme => brightness == Brightness.light;
}
