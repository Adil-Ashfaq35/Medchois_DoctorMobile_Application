import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../component/AppHeader/AppHeader.dart';
import '../../../../../../component/Button/CustomCircleButton.dart';
import '../../../../../../component/Button/CustomFillButton.dart';
import '../../../../../../component/CountryCodePicker/CountryCodePicker.dart';
import '../../../../../../component/Text/TextStyle.dart';
import '../../../../../../component/TextField/CustomTextField.dart';
import '../../../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../../../utils/constants/AppIcons.dart';
import '../../../../../../utils/constants/AssetsImage.dart';
import '../../../../../../utils/constants/app_theme.dart';

class AddPosition extends StatelessWidget {
  const AddPosition({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return  Scaffold(

      body:  Stack(
        children: [
          AppHeader(
            title: 'Personal Details',
          ),

          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: Responsive(context).isTabletLandscape?42.sp:120.sp),
            padding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(vertical: 5.sp,horizontal: 20.sp): EdgeInsets.all(20.sp),
            decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Responsive(context).isTabletLandscape?20.sp: 32.sp), topRight: Radius.circular(Responsive(context).isTabletLandscape?20.sp:32.sp))),
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape? 5.sp:30.sp),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// job tile
                
                        Text(
                          "Job title",
                          textAlign: TextAlign.left,
                          style: AppTextStyle().regularText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp,fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height:Responsive(context).isTabletLandscape? 3.sp:10.sp,),
                        CustomTextFormField(
                          // controller: medicalProfileProvider.experienceController,
                          hintText: "job title",
                          inputType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          suffixIconConstraints: BoxConstraints.tight(Size(70.sp, 30.sp)),
                          validator: (value) =>
                          value!.isEmpty ? "" : null,
                          onChange: (value){
                            //  medicalProfileProvider.updateExperience(value);
                          },
                        ),

                        SizedBox(height: 8.sp,),
                
                        /// Entity
                
                
                        Text(
                          "Entity",
                          textAlign: TextAlign.left,
                          style: AppTextStyle().regularText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp,fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height:Responsive(context).isTabletLandscape? 3.sp:10.sp,),
                        SizedBox(
                          child: CustomTextFormField(
                            // controller: medicalProfileProvider.experienceController,
                            hintText: "Hospital Name",
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
                
                        SizedBox(height: Responsive(context).isTabletLandscape? 5.sp:5.sp,),
                        /// Nationality
                
                
                        Text(
                          "Nationality",
                          textAlign: TextAlign.center,
                          style: AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 10.sp:14.sp),
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
                                    width: 80.sp,
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



                    SizedBox(height: 30.sp,),
                


                
                    CustomFilledButton(
                
                        textColor: AppTheme.white,
                        title: 'Add Position',
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
