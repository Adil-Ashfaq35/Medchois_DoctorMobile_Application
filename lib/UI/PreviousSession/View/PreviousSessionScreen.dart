

import 'package:doctor_app/Utils/Constants/RouteConstant.dart';
import 'package:doctor_app/utils/constants/AppIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../component/AppHeader/AppHeader.dart';
import '../../../component/TextField/CustomTextField.dart';
import '../../../utils/HelperFunction/Reponsive.dart';
import '../../../utils/constants/AssetsImage.dart';
import '../../../utils/constants/app_theme.dart';
import '../Widgets/PatientMenuBody.dart';
import '../Widgets/PreviousSessionPatientWidget.dart';

class PreviousSessionScreen extends StatelessWidget {
  const PreviousSessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Scaffold(
      body: Stack(
        children: [
          AppHeader(
            title: 'Previous Sessions',
          ),

          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top:Responsive(context).isTabletLandscape? 45.sp:Responsive(context).isTabletPortrait?110.sp:220.sp),
            padding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(horizontal: 15.sp,vertical: 5.sp): EdgeInsets.all(15.sp),
            decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Responsive(context).isTabletLandscape?20.sp: 32.sp), topRight: Radius.circular(Responsive(context).isTabletLandscape?20.sp:32.sp))),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [

                  CustomTextFormField(
                  //  controller: passwordController,
                    hintText: "Search For Patient",
                    inputType: TextInputType.text,
                    textCapitalization: TextCapitalization.sentences,
                    suffixIconConstraints: BoxConstraints.tight(Size(50.sp, 30.sp)),
                    validator: (value) =>
                    value!.isEmpty ? "" : null,
                    prefixWidget: const Icon(AppIcons.search,color: AppTheme.lightTextColor,),
                  ),


                  ListView.builder(
                      itemCount: 6,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                    return   PreviousSessionPatientWidget(
                      patientFollowUpBgColor:  const Color(0x0C18C9BF),
                      patientFollowUpText: "Follow up Consultation",
                      patientFollowUpTextColor: const Color(0xFF108881),
                      patientImage: AssetsImages.doctorImage,
                      patientName: "Mostafa Moataz",
                      patientSubtitle: "View profile",
                      patientSubTitleOnTap: (){
                      },
                      leftButtonText: "Cancel",
                      rightButtonText: "Start Session",
                      leftButtonTextColor: AppTheme.appPrimaryColor,
                      rightButtonTextColor: AppTheme.white,
                      leftButtonBgColor: AppTheme.white,
                    );

                  }),


                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
