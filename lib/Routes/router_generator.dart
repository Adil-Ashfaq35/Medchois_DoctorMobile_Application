import 'package:doctor_app/UI/Profile/View/widgets/PersonalDetails/MedicalProfile/AddEducation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../utils/constants/RouteConstant.dart';

import '../UI/Auth/View/ForgetPassword/View/ChangePassword.dart';
import '../UI/Auth/View/ForgetPassword/View/ForgetPasswordOTPVerification.dart';
import '../UI/Auth/View/ForgetPassword/View/SetNewPasswordScreen.dart';
import '../UI/Auth/View/ForgetPassword/View/forgetPassword.dart';
import '../UI/Auth/View/Login/View/Login.dart';
import '../UI/Auth/View/CreateAccount/createAccount.dart';
import '../UI/Blog/Views/Widgets/BlogArticleDetails.dart';
import '../UI/Blog/Views/Widgets/AddArticle.dart';
import '../UI/Blog/Views/Widgets/WriteArticleDescription.dart';
import '../UI/ConsultationSession/View/AudioCall/AudioCall.dart';
import '../UI/ConsultationSession/View/ChatConsultation/ChatConsultation.dart';
import '../UI/ConsultationSession/View/VideoCall/VideoCall.dart';
import '../UI/FinancialManagement/View/Subscriber.dart';
import '../UI/FinancialManagement/View/Withdraw/AddBankDetail.dart';
import '../UI/FinancialManagement/View/Withdraw/WalletScreen.dart';
import '../UI/FollowUpReminder/View/CustomRepeatScreen.dart';
import '../UI/FollowUpReminder/View/FollowUpReminderScreen.dart';
import '../UI/FollowUpReminder/View/RepeatScreen.dart';
import '../UI/Home/view/HomePageWithBooking.dart';
import '../UI/Home/view/NavMainScreen.dart';
import '../UI/Home/view/Widgets/Notification/NotificationScreen.dart';
import '../UI/Home/view/HomePageNoBooking.dart';
import '../UI/OnBoarding/View/InitialSelectLanguage.dart';
import '../UI/OnBoarding/View/OnBoardingScreen.dart';
import '../UI/OnBoarding/View/SplashUI.dart';
import '../UI/PatientProfile/View/PatientProfile.dart';
import '../UI/PreviousSession/View/PatientSessionMenuScreen.dart';
import '../UI/PreviousSession/View/PreviousSessionScreen.dart';
import '../UI/Profile/View/widgets/AppPolicies/AppPolicies.dart';
import '../UI/Profile/View/widgets/MedicalLicense/licenseScreen.dart';
import '../UI/Profile/View/widgets/PersonalDetails/ChangePassword/ProfileChangePassword.dart';
import '../UI/Profile/View/widgets/PersonalDetails/ChangePhoneNumber/ChangePhoneNumber.dart';
import '../UI/Profile/View/widgets/PersonalDetails/ChangePhoneNumber/ChangePhoneNumberOTPVerification.dart';
import '../UI/Profile/View/widgets/PersonalDetails/MedicalProfile/AddCertificate.dart';
import '../UI/Profile/View/widgets/PersonalDetails/MedicalProfile/AddPosition.dart';
import '../UI/Profile/View/widgets/PersonalDetails/MedicalProfile/MedicalProfile.dart';
import '../UI/Profile/View/widgets/PersonalDetails/PersonalInformation/personalDetails.dart';
import '../UI/Profile/View/profileMainScreen.dart';
import '../UI/Profile/View/widgets/PersonalDetails/PersonalInformation/personalInformationScreen.dart';
import '../UI/UserPrescription/View/ManualAddingPrescription/AddEPrescription.dart';
import '../UI/UserPrescription/View/ManualAddingPrescription/AddMedicineScreen.dart';
import '../UI/UserPrescription/View/ManualAddingPrescription/ManualPrescriptionMainScreen.dart';
import '../UI/UserPrescription/View/ManualAddingPrescription/MedicineDosageScreen.dart';
import '../UI/UserPrescription/View/UserPrescription.dart';



class RouteGenerator {
  /// FUNCTION THAT HANDLES ROUTING
  static Route<dynamic> onGeneratedRoutes(RouteSettings settings) {
    const animationDuration = Duration(milliseconds: 300);
    Map<String, dynamic> args = {};
    final routeArgs = settings.arguments;
    /// GETTING ARGUMENTS IF PASSED
  if (settings.arguments != null) {
      args = settings.arguments as Map<String, dynamic>;
      debugPrint("${settings.arguments}");
    }
    debugPrint(settings.name);
    switch (settings.name) {
      case RouteConstants.initialRoute:
        return PageTransition(
            child: const AppSplashUI(), type: PageTransitionType.fade, duration: animationDuration);
      case RouteConstants.initialSelectLanguage:
        return PageTransition(
            child: InitialSelectLanguage(),
            type: PageTransitionType.bottomToTop,
            duration: animationDuration);
      case RouteConstants.onBoardingScreen:
        return PageTransition(
            child: const OnBoardingScreen(),
            type: PageTransitionType.rightToLeft,
            duration: animationDuration);
      case RouteConstants.createAccount:
        return PageTransition(
            child: const CreateAccount(),
            type: PageTransitionType.rightToLeft,
            duration: animationDuration);

      case RouteConstants.loginScreen:
        return PageTransition(
            child: LoginScreen(
              data: routeArgs,
            ),
            type: PageTransitionType.bottomToTop,
            duration: animationDuration);
      case RouteConstants.forgetOtpVerificationScreen:
        return PageTransition(
            child: ForgetOTPVerificationScreen(
            data: routeArgs,
            ),
            type: PageTransitionType.rightToLeft,
            duration: animationDuration);
        case RouteConstants.forgetPasswordScreen:
        return PageTransition(
            child: const ForgetPasswordScreen(
            ),
            type: PageTransitionType.rightToLeft,
            duration: animationDuration);
      case RouteConstants.changePasswordScreen:
        return PageTransition(
            child: const ChangePassword(),
            type: PageTransitionType.bottomToTop,
            duration: animationDuration);
      case RouteConstants.homeScreen:
        return PageTransition(
            child: const HomePageScreenNoBooking(),
            type: PageTransitionType.bottomToTop,
            duration: animationDuration);
        case RouteConstants.allNavScreen:
        return PageTransition(
            child:  NavMainScreen(
              data: routeArgs,
            ),
            type: PageTransitionType.bottomToTop,
            duration: animationDuration);
        case RouteConstants.profileMainScreen:
        return PageTransition(
            child:  const ProfileMainScreen(),
            type: PageTransitionType.bottomToTop,
            duration: animationDuration);
        case RouteConstants.personalDetails:
        return PageTransition(
            child:  const PersonalDetails(),
            type: PageTransitionType.bottomToTop,
            duration: animationDuration);
        case RouteConstants.licenseScreen:
        return PageTransition(
            child:  const LicenseScreen(),
            type: PageTransitionType.bottomToTop,
            duration: animationDuration);
        case RouteConstants.personalInformationScreen:
        return PageTransition(
            child:  const PersonalInformationScreen(),
            type: PageTransitionType.fade,
            duration: animationDuration);
        case RouteConstants.changePhoneNumberOTPVerification:
        return PageTransition(
            child:   ChangePhoneNumberOTPVerification(
              data: routeArgs,
            ),
            type: PageTransitionType.fade,
            duration: animationDuration);
        case RouteConstants.changePhoneNumberScreen:
        return PageTransition(
            child:   ChangePhoneNumberScreen(),
            type: PageTransitionType.fade,
            duration: animationDuration);
      case RouteConstants.setNewPasswordScreen:
        return PageTransition(
            child: SetNewPasswordScreen(
              data: routeArgs,
            ),
            type: PageTransitionType.bottomToTop,
            duration: animationDuration);
        case RouteConstants.profileChangePasswordScreen:
        return PageTransition(
            child: ProfileChangePasswordScreen(),
            type: PageTransitionType.bottomToTop,
            duration: animationDuration);
        case RouteConstants.appPoliciesScreen:
        return PageTransition(
            child: const AppPoliciesScreen(),
            type: PageTransitionType.bottomToTop,
            duration: animationDuration);
        case RouteConstants.notificationScreen:
        return PageTransition(
            child: const NotificationScreen(),
            type: PageTransitionType.bottomToTop,
            duration: animationDuration);
        case RouteConstants.medicalProfile:
        return PageTransition(
            child: const MedicalProfile(),
            type: PageTransitionType.bottomToTop,
            duration: animationDuration);
        case RouteConstants.addPosition:
        return PageTransition(
            child: const AddPosition(),
            type: PageTransitionType.bottomToTop,
            duration: animationDuration);
        case RouteConstants.addEducation:
        return PageTransition(
            child: const AddEducation(),
            type: PageTransitionType.bottomToTop,
            duration: animationDuration);
        case RouteConstants.addCertificate:
        return PageTransition(
            child: const AddCertificate(),
            type: PageTransitionType.rightToLeftWithFade,
            duration: animationDuration);
        case RouteConstants.homePageScreenWithBooking:
        return PageTransition(
            child:  HomePageScreenWithBooking(
              data: routeArgs,
            ),
            type: PageTransitionType.fade,
            duration: animationDuration);
        case RouteConstants.previousSessionScreen:
        return PageTransition(
            child:  const PreviousSessionScreen(),
            type: PageTransitionType.fade,
            duration: animationDuration);
        case RouteConstants.patientSessionMenuScreen:
        return PageTransition(
            child:  const PatientSessionMenuScreen(),
            type: PageTransitionType.fade,
            duration: animationDuration);
        case RouteConstants.userPrescriptionScreen:
        return PageTransition(
            child:   const UserPrescriptionScreen(),
            type: PageTransitionType.fade,
            duration: animationDuration);
        case RouteConstants.patientProfile:
        return PageTransition(
            child:   PatientProfile(),
            type: PageTransitionType.fade,
            duration: animationDuration);
        case RouteConstants.followUpReminderScreen:
        return PageTransition(
            child:  const FollowUpReminderScreen(),
            type: PageTransitionType.fade,
            duration: animationDuration);
        case RouteConstants.followUpRepeatScreen:
        return PageTransition(
            child:  const FollowUpRepeatScreen(),
            type: PageTransitionType.fade,
            duration: animationDuration);
        case RouteConstants.customRepeatScreen:
        return PageTransition(
            child:  const CustomRepeatScreen(),
            type: PageTransitionType.fade,
            duration: animationDuration);
        case RouteConstants.manualAddPrescriptionMainScreen:
        return PageTransition(
            child:  const ManualAddPrescriptionMainScreen(),
            type: PageTransitionType.fade,
            duration: animationDuration);
        case RouteConstants.addEPrescriptionScreen:
        return PageTransition(
            child:  const AddEPrescriptionScreen(),
            type: PageTransitionType.fade,
            duration: animationDuration);
        case RouteConstants.addMedicineScreen:
        return PageTransition(
            child:  const AddMedicineScreen(),
            type: PageTransitionType.fade,
            duration: animationDuration);
        case RouteConstants.medicineDosageScreen:
        return PageTransition(
            child:  const MedicineDosageScreen(),
            type: PageTransitionType.fade,
            duration: animationDuration);
      case RouteConstants.addArticle:
        return PageTransition(
            child: const AddArticle(), type: PageTransitionType.fade, duration: animationDuration);
      case RouteConstants.blogArticleDetailsScreen:
        return PageTransition(
            child: BlogArticleDetailsScreen(),
            type: PageTransitionType.rightToLeft,
            duration: animationDuration);
      case RouteConstants.audioCallScreen:
        return PageTransition(
            child: AudioCallScreen(),
            type: PageTransitionType.rightToLeft,
            duration: animationDuration);
      case RouteConstants.videoCallScreen:
        return PageTransition(
            child: VideoCallScreen(),
            type: PageTransitionType.rightToLeft,
            duration: animationDuration);
      case RouteConstants.chatConsultationScreen:
        return PageTransition(
            child: const ChatConsultationScreen(),
            type: PageTransitionType.rightToLeft,
            duration: animationDuration);
        case RouteConstants.writeArticleDescription:
        return PageTransition(
            child: WriteArticleDescription(),
            type: PageTransitionType.rightToLeft,
            duration: animationDuration);
        case RouteConstants.doctorSubscribersScreen:
        return PageTransition(
            child: const DoctorSubscribersScreen(),
            type: PageTransitionType.rightToLeft,
            duration: animationDuration);
        case RouteConstants.walletScreen:
        return PageTransition(
            child: const WalletScreen(),
            type: PageTransitionType.rightToLeft,
            duration: animationDuration);
        case RouteConstants.addBankDetailScreen:
        return PageTransition(
            child: const AddBankDetailScreen(),
            type: PageTransitionType.fade,
            duration: animationDuration);



      default:
        return _errorRoute();
    }
  }

  // FUNCTION THAT HANDLES NAVIGATION
  static PageRoute _getPageRoute(Widget child) {
    return MaterialPageRoute(builder: (ctx) => child);
  }

  // 404 PAGE
  static PageRoute _errorRoute() {
    return MaterialPageRoute(builder: (ctx) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('404'),
        ),
        body: const Center(
          child: Text('ERROR 404: Not Found'),
        ),
      );
    });
  }
}



