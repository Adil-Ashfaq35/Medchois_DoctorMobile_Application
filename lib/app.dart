
import 'package:doctor_app/utils/constants/RouteConstant.dart';
import 'package:doctor_app/utils/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import 'Routes/router_generator.dart';
import 'component/multi_providers.dart';


class MyApp extends StatelessWidget {

  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (_,child) {
          return MultiProviders(
            MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Doctor App',
              theme:  ThemeData(
                useMaterial3: false,
                colorScheme: ThemeData().colorScheme.copyWith(
                  primary: AppTheme.white,
                )
              ),
              builder: (context, child) => ResponsiveBreakpoints.builder(
                child: child!,
                breakpoints: [
                  const Breakpoint(start: 0, end: 450, name: MOBILE),
                  const Breakpoint(start: 451, end: 1600, name: TABLET),
                ],
              ),

              onGenerateRoute: RouteGenerator.onGeneratedRoutes,
              initialRoute: RouteConstants.initialRoute,
            ),
          );
        }
    );
  }
}