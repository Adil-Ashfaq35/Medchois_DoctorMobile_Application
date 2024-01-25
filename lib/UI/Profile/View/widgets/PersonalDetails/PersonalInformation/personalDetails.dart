
import 'package:doctor_app/UI/Profile/View/widgets/profileSection.dart';
import 'package:doctor_app/Utils/Constants/RouteConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../component/AppHeader/AppHeader.dart';
import '../../../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../../../utils/constants/AssetsImage.dart';
import '../../../../../../utils/constants/app_theme.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Scaffold(
      body: Stack(
        children: [
          AppHeader(
            title: 'Personal Details',
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: Responsive(context).isTabletLandscape?42.sp:120.sp),
            padding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(horizontal:20.sp,vertical: 5.sp): EdgeInsets.all(20.sp),
            decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Responsive(context).isTabletLandscape?20.sp: 32.sp), topRight: Radius.circular(Responsive(context).isTabletLandscape?20.sp:32.sp))),
            child: SingleChildScrollView(
              physics:Responsive(context).isTabletLandscape?  BouncingScrollPhysics(): NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  ProfileSection(label: 'Personal details',onTap: (){
                    Navigator.pushNamed(context, RouteConstants.personalInformationScreen);
                  },iconPath: AssetsImages.personUnselectedIcon,),
                  SizedBox(height: Responsive(context).isTabletLandscape? 0.sp: 20.sp,),
                  ProfileSection(label: 'Medical Profile',onTap: (){
                    Navigator.pushNamed(context, RouteConstants.medicalProfile);
                  },iconPath: AssetsImages.medicalProfile,),
                  SizedBox(height: Responsive(context).isTabletLandscape? 0.sp: 20.sp,),
                  ProfileSection(label: 'Medical License',onTap: (){
                    Navigator.pushNamed(context, RouteConstants.licenseScreen);
                  },iconPath: AssetsImages.medicalLicense,suffixLabel: "Expires In",suffixDate: "20/01/2022"),
                  SizedBox(height: Responsive(context).isTabletLandscape? 0.sp: 20.sp,),
                  ProfileSection(label: 'Change Mobile Number',onTap: (){
                    Navigator.pushNamed(context, RouteConstants.changePhoneNumberScreen);
                  },iconPath: AssetsImages.mobile,),
                  SizedBox(height: Responsive(context).isTabletLandscape? 0.sp: 20.sp,),
                  ProfileSection(label: 'Change Password',onTap: (){
                    Navigator.pushNamed(context, RouteConstants.profileChangePasswordScreen);

                  },iconPath: AssetsImages.lock,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
