import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

import '../../../../../../component/BottomSheet/CustomBottomSheet.dart';
import '../../../../../../component/Button/CustomCircleButton.dart';
import '../../../../../../component/Button/CustomFillButton.dart';
import '../../../../../../component/Text/TextStyle.dart';
import '../../../../../../utils/constants/AppIcons.dart';
import '../../../../../../utils/constants/app_theme.dart';
import '../../../../Provider/UserProfileProvider.dart';



class SelectDateOfBirthBottomSheet {
  selectDateOfBirthBottomSheet(BuildContext context, UserProfileProvider userProfileProvider) {
    Size size = MediaQuery.of(context).size;
    Responsive(context).setOrientation(context);

    return CustomBottomSheet().customBottomSheet(
        context,
        Container(
          height:Responsive(context).isTabletPortrait? size.height*0.7:Responsive(context).isTabletLandscape?size.height*0.9 : size.height * 0.5,
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical:Responsive(context).isTabletLandscape?5.sp:10.sp),
          decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32.sp), topLeft: Radius.circular(32.sp))),
          child: Column(
            children: [
              SizedBox(
                height:Responsive(context).isTabletLandscape?25.sp:40.sp,
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
                          "Select your birthdate",
                          textAlign: TextAlign.center,
                          style: AppTextStyle().boldText().copyWith(fontSize:Responsive(context).isTabletPortrait?14.sp:Responsive(context).isTabletLandscape? 12.sp:18.sp),
                        ),
                        CustomCircleIconButton(
                          onTap: () => Navigator.of(context).pop(),
                          height:Responsive(context).isTabletLandscape?12.sp:25.sp,
                          width: 25.sp,
                          boxColor: AppTheme.grey.withOpacity(0.2),
                          icon: AppIcons.close,
                          iconColor: AppTheme.grey,
                          iconSize:Responsive(context).isTabletLandscape? 8.sp:16.sp,
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
                        child:
                        ScrollDatePicker(
                         viewType: const [DatePickerViewType.day,DatePickerViewType.month,DatePickerViewType.year],
                          selectedDate: userProfileProvider.selectedDate,
                          options:DatePickerOptions(
                            itemExtent:Responsive(context).isTabletPortrait? 40.sp:Responsive(context).isTabletLandscape? 40.sp:40.sp,
                          ) ,
                          scrollViewOptions:DatePickerScrollViewOptions.all( ScrollViewDetailOptions(margin: EdgeInsets.symmetric(horizontal: 18.sp),
                            textStyle: TextStyle(
                              fontSize: Responsive(context).isTabletPortrait? 15.sp:Responsive(context).isTabletLandscape?13.sp:null,
                            ),
                            selectedTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.black,
                            fontSize: Responsive(context).isTabletPortrait? 18.sp:Responsive(context).isTabletLandscape? 12.sp:null,
                          ),
                          ),
                          ) ,
                          locale: const Locale('en'),
                          minimumDate: DateTime.now().copyWith(year: DateTime.now().year - 50),
                          maximumDate: DateTime.now().copyWith(month: DateTime.now().month + 12),
                          indicator: Padding(
                            padding:  EdgeInsets.all(10.sp),
                            child: Container(
                              height:Responsive(context).isTabletLandscape? 20.sp:null,
                             padding: EdgeInsets.all(14.sp),
                              decoration: BoxDecoration(
                                color: const Color(0x00ffffff),
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(color: const Color(0xff2C91D4),width: 2.sp)
                              ),
                            ),
                          ),

                          onDateTimeChanged: (DateTime value) {
                            userProfileProvider.updateDate(value);
                          },

                        ),


                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.sp),
                      child: CustomFilledButton(
                        height: Responsive(context).isTabletPortrait?40.sp:Responsive(context).isTabletLandscape?20.sp:null,
                        disableButton: false,
                        fontSize: Responsive(context).isTabletLandscape? 8.sp:null,
                        title: 'Select Date',
                        onPressed: () {
                          if (userProfileProvider.selectDateAndTime != null) {
                            String formattedDate =
                                DateFormat('dd/MM/yyyy').format(userProfileProvider.selectDateAndTime!);
                            userProfileProvider.setUserBOD(formattedDate);
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
