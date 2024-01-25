import 'package:doctor_app/UI/FollowUpReminder/Provider/FollowUpProvider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../component/AppHeader/AppHeader.dart';
import '../../../component/Button/CustomFillButton.dart';
import '../../../component/Text/TextStyle.dart';
import '../../../utils/HelperFunction/Reponsive.dart';
import '../../../utils/constants/app_theme.dart';
import 'Widget/DurationSelectionBottomSheet.dart';
import 'Widget/FrequencySelectionBottomSheet.dart';
import 'Widget/ReminderSetBottomSheet.dart';

class CustomRepeatScreen extends StatefulWidget {
  const CustomRepeatScreen({super.key});

  @override
  State<CustomRepeatScreen> createState() => _CustomRepeatScreenState();
}

class _CustomRepeatScreenState extends State<CustomRepeatScreen> {


  List<bool> selectedItems = List.generate(7, (index) => false);

  List<String> days=[
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
  ];

  @override
  Widget build(BuildContext context) {

    Responsive(context).setOrientation(context);

    return   Consumer<FollowUpProvider>(builder: (context, followUpProvider, _) {
      return Scaffold(
        body: Stack(
          children: [
            AppHeader(
              title: 'Custom Repeat',
            ),

            Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: Responsive(context).isTabletLandscape?42.sp:120.sp),
                padding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(horizontal: 20.sp, vertical: 0.sp): EdgeInsets.all(20.sp),
                decoration: BoxDecoration(color: AppTheme.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Responsive(context).isTabletLandscape?20.sp: 32.sp), topRight: Radius.circular(Responsive(context).isTabletLandscape?20.sp:32.sp))),
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical:10.sp),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [



                        SizedBox(height:Responsive(context).isTabletLandscape? 10.sp:30.sp,),

                        /// custom
                        InkWell(
                          onTap: ()=> FrequencySelectionBottomSheet().frequencySelectionBottomSheet(context),
                          child: Container(
                            height:Responsive(context).isTabletLandscape? 24.sp:48.sp,
                            width: 1.sw,
                            decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(16.sp),
                              border: Border.all(color: AppTheme.borderColor),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal:20.sp),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Frequencey",
                                    textAlign: TextAlign.start,
                                    style: AppTextStyle()
                                        .regularText()
                                        .copyWith(fontSize:Responsive(context).isTabletLandscape?8.sp:14.sp,fontWeight: FontWeight.w500,color: AppTheme.appTextColor,),
                                  ),
                                  Text(
                                    "Daily",
                                    textAlign: TextAlign.start,
                                    style: AppTextStyle()
                                        .regularText()
                                        .copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp,fontWeight: FontWeight.w500,color: AppTheme.appPrimaryColor,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height:Responsive(context).isTabletLandscape? 10.sp:20.sp,),
                        InkWell(
                          onTap: ()=>DurationSelectionBottomSheet().durationSelectionBottomSheet(context),
                          child: Container(
                            height:Responsive(context).isTabletLandscape? 24.sp:48.sp,
                            width: 1.sw,
                            decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(16.sp),
                              border: Border.all(color: AppTheme.borderColor),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal:20.sp),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Every ",
                                    textAlign: TextAlign.start,
                                    style: AppTextStyle()
                                        .regularText()
                                        .copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp: 14.sp,fontWeight: FontWeight.w500,color: AppTheme.appTextColor,),
                                  ),
                                  Text(
                                    "Daily",
                                    textAlign: TextAlign.start,
                                    style: AppTextStyle()
                                        .regularText()
                                        .copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp,fontWeight: FontWeight.w500,color: AppTheme.appPrimaryColor,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height:Responsive(context).isTabletLandscape? 8.sp:10.sp,),
                        Text(
                          "Event will occur every day",
                          textAlign: TextAlign.start,
                          style: AppTextStyle()
                              .regularText()
                              .copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:13.sp,fontWeight: FontWeight.w500,color: AppTheme.lightTextColor,),
                        ),


                        SizedBox(
                          height:Responsive(context).isTabletLandscape? 100.sp:200.sp,
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10.sp,
                              mainAxisSpacing: 8.0.sp,
                              childAspectRatio: 2.sp
                            ),
                            itemCount: 7, // Number of items
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  selectedItems[index] = !selectedItems[index];
                                  setState(() {});
                                },
                                child: Container(
                                  height: 40.sp,
                                  width: 80.sp,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: AppTheme.lightFilledColor,
                                    border: Border.all(color: selectedItems[index]?  AppTheme.appPrimaryColor:AppTheme.transparent,width:1),
                                  ),
                                  child: Center(
                                    child: Text(
                                      days[index], // Replace with your actual data
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle()
                                          .regularText()
                                          .copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp, fontWeight: FontWeight.bold,
                                       color: selectedItems[index] ? AppTheme.appPrimaryColor : AppTheme.lightTextColor,),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),


                        SizedBox(height:Responsive(context).isTabletLandscape? 0:0.2.sh,),


                        CustomFilledButton(
                          height:Responsive(context).isTabletLandscape? null:46.sp,
                          disableButton: false,
                          title: 'Set Reminder',
                          onPressed: () {
                            ReminderSetBottomSheet().reminderSetBottomSheet(context);
                          },
                        ),
                      ],
                    ),
                  ),
                )
            )
          ],
        ),


      );
    }
    );
  }

  Widget followUpDateTime({required FollowUpProvider followUpProvider, required String label, required bool value,Function(bool)? onChanged, VoidCallback ?subTitleOnTap, required String subTitleText,required bool showSubTitle, required String icon, required Color bgColor}){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 30.sp,
                height: 30.sp,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: SvgPicture.asset(icon,color: AppTheme.white,fit: BoxFit.scaleDown,height:10.sp,width: 10.sp, ),
              ),
              SizedBox(width: 10.sp,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    textAlign: TextAlign.start,
                    style: AppTextStyle()
                        .regularText()
                        .copyWith(fontSize: 16.sp,fontWeight: FontWeight.w600,color: AppTheme.appTextColor,),
                  ),
                  showSubTitle?
                  InkWell(
                    onTap: subTitleOnTap,
                    child: Text(
                      subTitleText,
                      textAlign: TextAlign.start,
                      style: AppTextStyle()
                          .regularText()
                          .copyWith(fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppTheme.appPrimaryColor,),
                    ),
                  ):const SizedBox.shrink(),

                ],
              ),
            ],
          ),
          CupertinoSwitch(
            activeColor: AppTheme.blue,
            value: value,
            onChanged:onChanged,
          ),




        ],
      ),
    );
  }
}
