import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../component/Button/CustomFillButton.dart';
import '../../../../../../component/CountryCodePicker/CountryCodePicker.dart';
import '../../../../../../component/Text/TextStyle.dart';
import '../../../../../../component/TextField/CustomTextField.dart';
import '../../../../../../utils/constants/AppIcons.dart';
import '../../../../../../utils/constants/AssetsImage.dart';
import '../../../../../../utils/constants/app_theme.dart';
import '../../../../Provider/UserProfileProvider.dart';
import 'SelectDateOfBirthBottomSheet.dart';
import 'SelectLanguageBottomSheet.dart';

class PersonalDetailBody extends StatelessWidget {
  PersonalDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Consumer<UserProfileProvider>(builder: (context, userProfileProvider, _) {
      return Container(
        margin: EdgeInsets.only(top:Responsive(context).isTabletLandscape? 55.sp:220.sp),
        padding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(horizontal: 15.sp,vertical: 5.sp): EdgeInsets.all(15.sp),
        height: double.infinity,
        decoration: BoxDecoration(
            color: AppTheme.appScreenBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Responsive(context).isTabletLandscape?20.sp: 32.sp), topRight: Radius.circular(Responsive(context).isTabletLandscape?20.sp:32.sp))),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.sp,
              ),
              Text(
                "Username",
                textAlign: TextAlign.center,
                style: AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp),
              ),
              SizedBox(
                height: 3.sp,
              ),
              CustomTextFormField(
                controller: userProfileProvider.nameController,
                hintText: "Enter your name",
                borderColor: AppTheme.grey.withOpacity(0.3),
                inputType: TextInputType.emailAddress,
                contentPadding:Responsive(context).isTabletLandscape? null: EdgeInsets.all(10.sp),
              ),
              SizedBox(
                height: 8.sp,
              ),
              Text(
                "Email",
                textAlign: TextAlign.center,
                style: AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp),
              ),
              SizedBox(
                height: 3.sp,
              ),
              CustomTextFormField(
                controller: userProfileProvider.emailController,
                hintText: "Your email Address",
                borderColor: AppTheme.grey.withOpacity(0.3),
                inputType: TextInputType.emailAddress,
                contentPadding:Responsive(context).isTabletLandscape? null: EdgeInsets.all(10.sp),
              ),
              SizedBox(
                height: 8.sp,
              ),
              Text(
                "Birthdate",
                textAlign: TextAlign.center,
                style: AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp),
              ),
              SizedBox(
                height: 3.sp,
              ),
              CustomTextFormField(
                hintText: "Your birthday",
                controller: userProfileProvider.userBODController,
                borderColor: AppTheme.grey.withOpacity(0.3),
                inputType: TextInputType.emailAddress,
                readOnly: true,
                suffixWidget: InkWell(
                  onTap: () => SelectDateOfBirthBottomSheet()
                      .selectDateOfBirthBottomSheet(context, userProfileProvider),
                  child: Image.asset(
                    AssetsImages.calendarIcon,
                    scale: 3,
                  ),
                ),
              ),
              SizedBox(
                height: 8.sp,
              ),
              Text(
                "Nationality",
                textAlign: TextAlign.center,
                style: AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp),
              ),
              SizedBox(
                height: 3.sp,
              ),
              Stack(
                children: [
                  CustomTextFormField(
                    hintText: "Select your nationality",
                    controller: userProfileProvider.userNationality,
                    readOnly: true,
                    borderColor: AppTheme.grey.withOpacity(0.3),
                    inputType: TextInputType.text,
                    textCapitalization: TextCapitalization.sentences,
                    onTap: () => SizedBox(
                      width: 80.sp,
                      height:Responsive(context).isTabletLandscape? 25.sp:48.sp,
                      child: CustomCountryCodePicker(
                        hideMainText: true,
                        initialSelectCountry: userProfileProvider.userCountryCode,
                        onChange: (selectCountryCodeValue) {
                          if (kDebugMode) {
                            print("Select Country Code: $selectCountryCodeValue");
                          }
                        },
                      ),
                    ),
                    prefixWidget: SizedBox(
                      width: 80.sp,
                      height:Responsive(context).isTabletLandscape? 25.sp:48.sp,
                      child: CustomCountryCodePicker(
                        hideMainText: true,
                        initialSelectCountry: userProfileProvider.userCountryCode,
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
                    height: Responsive(context).isTabletLandscape? 25.sp:48.sp,
                    child: CustomCountryCodePicker(
                      hideMainText: true,
                      showFlagMain: false,
                      initialSelectCountry: userProfileProvider.userCountryCode,
                      onChange: (selectCountryCodeValue) =>
                          userProfileProvider.setUserNationality(selectCountryCodeValue),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.sp,
              ),
              Text(
                "Spoken Languages",
                textAlign: TextAlign.center,
                style: AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp),
              ),
              SizedBox(
                height: 3.sp,
              ),
              CustomTextFormField(
                hintText: "Arabic, English",
                readOnly: true,
                controller: userProfileProvider.userSpokenLanguageController,
                borderColor: AppTheme.grey.withOpacity(0.3),
                inputType: TextInputType.emailAddress,
                onTap: () => SelectLanguageBottomSheet()
                    .selectLanguageBottomSheet(context),
                suffixWidget: Icon(
                  AppIcons.arrowDown,
                  color: AppTheme.grey.withOpacity(0.6),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.sp),
                child: CustomFilledButton(
                  title: 'Save Changes',
                  disableButton: false,
                  onPressed: (){},
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
