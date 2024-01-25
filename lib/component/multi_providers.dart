
import 'package:doctor_app/UI/Home/Provider/HomeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../UI/Auth/Provider/AuthProvider.dart';
import '../UI/Feedback/Provider/FeedbackProvider.dart';
import '../UI/FollowUpReminder/Provider/FollowUpProvider.dart';
import '../UI/Home/Provider/AppointmentProvider.dart';

import '../UI/Profile/Provider/MedicalProfileProvider.dart';
import '../UI/Profile/Provider/UserProfileProvider.dart';
import '../UI/Schedule/Provider/ScheduleProvider.dart';
import '../UI/UserPrescription/View/ManualAddingPrescription/Provider/EPrescriptionProvider.dart';




class MultiProviders extends StatelessWidget {
  const MultiProviders(this.child, {Key? key}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider<UserProfileProvider>(
          create: (BuildContext context) => UserProfileProvider(),
        ),
        ChangeNotifierProvider<MedicalProfileProvider>(
          create: (BuildContext context) => MedicalProfileProvider(),
        ),
        ChangeNotifierProvider<AppointmentProvider>(
          create: (BuildContext context) => AppointmentProvider(),
        ),
        ChangeNotifierProvider<ScheduleProvider>(
          create: (BuildContext context) => ScheduleProvider(),
        ),
        ChangeNotifierProvider<FeedbackProvider>(
          create: (BuildContext context) => FeedbackProvider(),
        ),
        ChangeNotifierProvider<FollowUpProvider>(
          create: (BuildContext context) => FollowUpProvider(),
        ),
        ChangeNotifierProvider<EPrescriptionProvider>(
          create: (BuildContext context) => EPrescriptionProvider(),
        ),
        ChangeNotifierProvider<HomeProvider>(
          create: (BuildContext context) => HomeProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (BuildContext context) => AuthProvider(),
        ),


      ],
      child: child,
    );
  }
}