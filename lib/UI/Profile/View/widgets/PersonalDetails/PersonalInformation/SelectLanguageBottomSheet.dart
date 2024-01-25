import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../component/BottomSheet/CustomBottomSheet.dart';
import '../../../../../../component/Button/CustomCheckBox.dart';
import '../../../../../../component/Button/CustomCircleButton.dart';
import '../../../../../../component/Button/CustomFillButton.dart';
import '../../../../../../component/Text/TextStyle.dart';
import '../../../../../../utils/constants/AppIcons.dart';
import '../../../../../../utils/constants/app_theme.dart';
import '../../../../Provider/UserProfileProvider.dart';

class SelectLanguageBottomSheet {
  selectLanguageBottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomBottomSheet().customBottomSheet(context,
        Consumer<UserProfileProvider>(builder: (context, userProfileProvider, _) {
      return Container(
        height: size.height * 0.8,
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
        decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(32.sp), topLeft: Radius.circular(32.sp))),
        child: Column(
          children: [
            Container(
              height: 40.sp,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 4.sp,
                    width: 65.sp,
                    decoration: BoxDecoration(
                        color: AppTheme.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(5.sp))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select spoken languages",
                        textAlign: TextAlign.center,
                        style: AppTextStyle().mediumText().copyWith(fontSize: 18.sp),
                      ),
                      CustomCircleIconButton(
                        onTap: () => Navigator.of(context).pop(),
                        height: 25.sp,
                        width: 25.sp,
                        boxColor: AppTheme.grey.withOpacity(0.2),
                        icon: AppIcons.close,
                        iconColor: AppTheme.grey,
                        iconSize: 16.sp,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.sp,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: userProfileProvider.languageData['languages']?.length,
                          itemBuilder: (context, index) {
                            final languageData =
                                userProfileProvider.languageData['languages']?[index];
                            return Column(
                              children: [
                                ListTile(
                                    onTap: () => userProfileProvider
                                        .setUserSpokenLanguage(languageData['name']!),
                                    leading: CountryFlag.fromCountryCode(
                                      languageData!['CountryCode'] ?? "",
                                      height: 25.sp,
                                      width: 35.sp,
                                      borderRadius: 4,
                                    ),
                                    title: Text(
                                      languageData['name'] ?? "",
                                      textAlign: TextAlign.start,
                                      style: AppTextStyle().regularText().copyWith(fontSize: 16.sp),
                                    ),
                                    trailing: CustomCheckBox(
                                      value: userProfileProvider.userSpokenLanguage
                                              .contains(languageData['name'])
                                          ? true
                                          : false,
                                      activeColor: userProfileProvider.userSpokenLanguage
                                              .contains(languageData['name'])
                                          ? AppTheme.appPrimaryColor
                                          : AppTheme.transparent,
                                    )),
                                index != userProfileProvider.languageData['languages']!.length - 1
                                    ? Divider(
                                        color: AppTheme.grey.withOpacity(0.4),
                                      )
                                    : SizedBox(),
                              ],
                            );
                          })),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.sp),
                    child: CustomFilledButton(
                      disableButton: false,
                      title: 'Submit',
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }));
  }
}
