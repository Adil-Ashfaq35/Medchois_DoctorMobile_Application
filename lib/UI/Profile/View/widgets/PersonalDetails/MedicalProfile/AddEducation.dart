import 'package:doctor_app/UI/Profile/Provider/UserProfileProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../component/AppHeader/AppHeader.dart';
import '../../../../../../component/Button/CustomFillButton.dart';
import '../../../../../../component/CountryCodePicker/CountryCodePicker.dart';
import '../../../../../../component/Text/TextStyle.dart';
import '../../../../../../component/TextField/CustomTextField.dart';
import '../../../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../../../utils/constants/AppIcons.dart';
import '../../../../../../utils/constants/AssetsImage.dart';
import '../../../../../../utils/constants/app_theme.dart';
import '../PersonalInformation/SelectDateOfBirthBottomSheet.dart';
import 'SelectDegreeBottomSheet.dart';

class AddEducation extends StatelessWidget {
  const AddEducation({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:  Stack(
        children: [
          AppHeader(
            title: 'Add Education',
          ),

          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: Responsive(context).isTabletLandscape?42.sp:120.sp),
            padding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp): EdgeInsets.all(20.sp),
            decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Responsive(context).isTabletLandscape?20.sp: 32.sp), topRight: Radius.circular(Responsive(context).isTabletLandscape?20.sp:32.sp))),
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape? 0.sp:30.sp),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Degree

                          Text(
                            "Degree",
                            textAlign: TextAlign.left,
                            style: AppTextStyle().boldText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp,fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height:Responsive(context).isTabletLandscape? 5.sp:10.sp,),
                          InkWell(
                            onTap: (){
                              SelectDegreeBottomSheet().selectDegreeBottomSheet(context);
                            },
                            child: CustomTextFormField(
                              hintText: "Degree",
                              isEnable: false,
                              inputType: TextInputType.text,
                              textCapitalization: TextCapitalization.sentences,
                              suffixIconConstraints: BoxConstraints.tight(Size(70.sp,Responsive(context).isTabletLandscape? 10.sp:30.sp)),
                              validator: (value) =>
                              value!.isEmpty ? "" : null,
                              onChange: (value){
                                //  medicalProfileProvider.updateExperience(value);
                              },
                              suffixWidget: Icon(
                                AppIcons.arrowDown,
                                color: AppTheme.grey.withOpacity(0.6),
                              ),

                            ),
                          ),

                          SizedBox(height: 5.sp,),

                          /// university


                          Text(
                            "University",
                            textAlign: TextAlign.left,
                            style: AppTextStyle().boldText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp,fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height:Responsive(context).isTabletLandscape? 5.sp:10.sp,),
                          SizedBox(
                            child: CustomTextFormField(
                              // controller: medicalProfileProvider.experienceController,
                              hintText: "Enter university name",
                              inputType: TextInputType.text,
                              textCapitalization: TextCapitalization.sentences,
                              suffixIconConstraints: BoxConstraints.tight(Size(70.sp, 30.sp)),
                              validator: (value) =>
                              value!.isEmpty ? "" : null,
                              onChange: (value){
                                //  medicalProfileProvider.updateExperience(value);
                              },
                            ),
                          ),

                          SizedBox(height: 5.sp,),

                          /// Nationality


                          Text(
                            "Country",
                            textAlign: TextAlign.center,
                            style: AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp),
                          ),
                          SizedBox(
                            height: 3.sp,
                          ),
                          Stack(
                            children: [
                              CustomTextFormField(
                                hintText: "Select Country",
                                //controller: userProfileProvider.userNationality,
                                readOnly: true,
                                borderColor: AppTheme.grey.withOpacity(0.3),
                                inputType: TextInputType.text,
                                textCapitalization: TextCapitalization.sentences,
                                onTap: () =>
                                    SizedBox(
                                      width:80.sp,
                                      height:Responsive(context).isTabletLandscape? 22.sp:48.sp,
                                      child: CustomCountryCodePicker(
                                        hideMainText: true,
                                        initialSelectCountry: "+92",
                                        onChange: (selectCountryCodeValue) {
                                          if (kDebugMode) {
                                            print("Select Country Code: $selectCountryCodeValue");
                                          }
                                        },
                                      ),
                                    ),
                                prefixWidget: SizedBox(
                                  width: 80.sp,
                                  height:Responsive(context).isTabletLandscape? 22.sp:48.sp,
                                  child: CustomCountryCodePicker(
                                    hideMainText: true,
                                    initialSelectCountry: 'IT',
                                    //  initialSelectCountry: userProfileProvider.userCountryCode,
                                    onChange: (selectCountryCodeValue) {
                                      print("Select Country Code: $selectCountryCodeValue");
                                    },
                                  ),
                                ),
                                suffixWidget: Icon(
                                  AppIcons.arrowDown,
                                  color: AppTheme.grey.withOpacity(0.6),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                height:Responsive(context).isTabletLandscape? 22.sp:48.sp,
                                child: CustomCountryCodePicker(
                                    hideMainText: true,
                                    showFlagMain: false,
                                    initialSelectCountry: 'IT',
                                    //  initialSelectCountry: userProfileProvider.userCountryCode,
                                    onChange: (selectCountryCodeValue) =>{}),
                                //    userProfileProvider.setUserNationality(selectCountryCodeValue),

                              ),
                            ],
                          ),

                        ],
                      ),



                  SizedBox(height:Responsive(context).isTabletLandscape? 5.sp:20.sp,),


                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Start Date",
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp: 14.sp),
                                  ),
                                  SizedBox(
                                    height: 3.sp,
                                  ),
                                  CustomTextFormField(
                                    hintText: "start date",
                                  //  controller: userProfileProvider.userBODController,
                                    borderColor: AppTheme.grey.withOpacity(0.3),
                                    inputType: TextInputType.emailAddress,
                                    readOnly: true,
                                    suffixWidget: InkWell(
                                      onTap: () => SelectDateOfBirthBottomSheet()
                                          .selectDateOfBirthBottomSheet(context, context.read<UserProfileProvider>()),
                                      child: Image.asset(
                                        AssetsImages.calendarIcon,
                                        scale: 3,
                                      ),
                                    ),
                                  ),
                                ],
                              )


                          ) ,

                          SizedBox(width: 10.sp,),

                          Expanded(
                              flex: 1,
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "End Date",
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp),
                                  ),
                                  SizedBox(
                                    height: 3.sp,
                                  ),
                                  CustomTextFormField(
                                    hintText: "end date",
                                    //  controller: userProfileProvider.userBODController,
                                    borderColor: AppTheme.grey.withOpacity(0.3),
                                    inputType: TextInputType.emailAddress,
                                    readOnly: true,
                                    suffixWidget: InkWell(
                                      onTap: () => SelectDateOfBirthBottomSheet()
                                          .selectDateOfBirthBottomSheet(context, context.read<UserProfileProvider>()),
                                      child: Image.asset(
                                        AssetsImages.calendarIcon,
                                        scale: 3,
                                      ),
                                    ),
                                  ),
                                ],
                              ) )
                        ],
                      ),


                      SizedBox(height: 0.04.sh,),


                      CustomFilledButton(

                          textColor: AppTheme.white,
                          title: 'Add Education',
                          disableButton: false,
                          onPressed: () {
                          }),



                    ]
                ),
              ),
            ),
          )
        ],
      ),

    );
  }
}
