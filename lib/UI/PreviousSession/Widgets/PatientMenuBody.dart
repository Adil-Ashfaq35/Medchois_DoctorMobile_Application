import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utils/Constants/RouteConstant.dart';
import '../../../utils/constants/AssetsImage.dart';
import '../../../utils/constants/app_theme.dart';
import '../../Feedback/View/FeedbackBottomSheet.dart';
import '../../Profile/View/widgets/profileSection.dart';

class PatientMenuBody extends StatelessWidget {
  PatientMenuBody({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return  Container(
        margin: EdgeInsets.only(top: Responsive(context).isTabletLandscape?100.sp:300.sp),
        padding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(vertical: 8.sp,horizontal: 15.sp): EdgeInsets.all(15.sp),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Responsive(context).isTabletLandscape?20.sp: 32.sp), topRight: Radius.circular(Responsive(context).isTabletLandscape?20.sp:32.sp))),
        child:  SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.sp,vertical:Responsive(context).isTabletLandscape? 5.sp:20.sp),
            child: Column(
              children: [
                ProfileSection(label: 'Chat Session',onTap: (){
                },iconPath: AssetsImages.messageIcon,),
                SizedBox(height:Responsive(context).isTabletLandscape? 0.sp:10.sp,),
                ProfileSection(label: 'Edit Prescriptions',onTap: (){
                   Navigator.pushNamed(context, RouteConstants.userPrescriptionScreen);
                },iconPath: AssetsImages.editDocumentIcon,),

                ProfileSection(label: 'Add Prescriptions',onTap: (){
                  Navigator.pushNamed(context, RouteConstants.manualAddPrescriptionMainScreen);
                },iconPath: AssetsImages.editDocumentIcon,),
                SizedBox(height:Responsive(context).isTabletLandscape? 0.sp:10.sp,),
                ProfileSection(label: 'Add Feedback',onTap: (){
                  FeedbackBottomSheet().feedbackBottomSheet(context);
                },iconPath: AssetsImages.medalReviewIcon,),
                SizedBox(height:Responsive(context).isTabletLandscape? 0.sp:10.sp,),
                ProfileSection(label: 'View Profile',onTap: (){
                  // Navigator.pushNamed(context, RouteConstants.personalInformationScreen);
                },iconPath: AssetsImages.personUnselectedIcon,),
              ],
            ),
          ),
        ),
      );
    }
  }
