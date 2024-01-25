import 'package:doctor_app/UI/FollowUpReminder/Provider/FollowUpProvider.dart';
import 'package:doctor_app/Utils/Constants/RouteConstant.dart';
import 'package:doctor_app/component/AppTimePickerSpinner/AppTimePickerSpinner.dart';
import 'package:doctor_app/utils/constants/AssetsImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../component/AppHeader/AppHeader.dart';
import '../../../component/Button/CustomFillButton.dart';
import '../../../component/Text/TextStyle.dart';
import '../../../component/TextField/CustomTextField.dart';
import '../../../utils/HelperFunction/Reponsive.dart';
import '../../../utils/constants/app_theme.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
class FollowUpReminderScreen extends StatelessWidget {
  const FollowUpReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return   Consumer<FollowUpProvider>(
        builder: (context, followUpProvider, _) {
        return Scaffold(
          body: Stack(
            children: [
              AppHeader(
                title: 'Follow up reminder',
              ),

              Container(
                alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: Responsive(context).isTabletLandscape?42.sp:120.sp),
                  padding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp): EdgeInsets.all(20.sp),
                  decoration: BoxDecoration(color: AppTheme.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Responsive(context).isTabletLandscape?20.sp: 32.sp), topRight: Radius.circular(Responsive(context).isTabletLandscape?20.sp:32.sp))),
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical:10.sp),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "This will remind you to follow up with the patient after consultation ",
                          textAlign: TextAlign.start,
                          style: AppTextStyle()
                              .regularText()
                              .copyWith(fontSize:Responsive(context).isTabletLandscape? 10.sp:16.sp,fontWeight: FontWeight.w200,color: AppTheme.lightTextColor,),
                        ),

                        SizedBox(height:Responsive(context).isTabletLandscape? 10.sp:20.sp,),


                        Text(
                          "Title",
                          textAlign: TextAlign.start,
                          style: AppTextStyle()
                              .regularText()
                              .copyWith(fontSize:Responsive(context).isTabletLandscape? 10.sp:16.sp,fontWeight: FontWeight.w600,color: AppTheme.appTextColor,),
                        ),

                        SizedBox(height:Responsive(context).isTabletLandscape? 5.sp:8.sp,),


                        CustomTextFormField(
                          //controller: emailController,
                          hintText: "Reminder Title",
                          inputType: TextInputType.text,
                          validator: (value) =>
                          value!.isEmpty ? "Enter Reminder Title" : null,
                        ),

                        SizedBox(height:Responsive(context).isTabletLandscape? 6.sp:20.sp,),

                        /// dateTimePickers

                        Container(
                          width: 1.sw,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppTheme.borderColor),
                              borderRadius: BorderRadius.circular(8.r)
                          ),
                          child:Column(

                            children: [


                              /// Date

                              Padding(
                                padding:  EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape? 5.sp:20.sp),
                                child: followUpDateTime(followUpProvider: followUpProvider,label: "Date",
                                    subTitleOnTap: (){
                                      followUpProvider.updateShowDatePicker(true);
                                    },
                                    value: followUpProvider.toggleDate,
                                    onChanged: (value){
                                      followUpProvider.updateDateToggle(value);
                                      followUpProvider.updateShowDatePicker(value);
                                    }, subTitleText: followUpProvider.selectedDate, showSubTitle: followUpProvider.toggleDate?true:false, icon: AssetsImages.scheduleUnselectedIcon,bgColor: AppTheme.appPrimaryColor
                                ),
                              ),

                              followUpProvider.toggleDate?
                              Visibility(
                                visible: followUpProvider.showDatePicker,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: SfDateRangePicker(
                                    selectionMode: DateRangePickerSelectionMode.single,
                                    allowViewNavigation: true,
                                    // showTodayButton: false,
                                    selectionColor: AppTheme.appPrimaryColor,
                                    initialSelectedDate:followUpProvider.selectedDate!=""?followUpProvider.format.parse(followUpProvider.selectedDate):null,
                                    showNavigationArrow: true,
                                    onSelectionChanged: (DateRangePickerSelectionChangedArgs args){
                                      followUpProvider.updateDateSelection(args);
                                      followUpProvider.updateShowDatePicker(false);
                                    },
                                    todayHighlightColor: Colors.transparent,
                                    toggleDaySelection: false,
                                    showTodayButton: false,

                                  ),
                                ),
                              ):const SizedBox.shrink(),

                              const Divider(color:  AppTheme.borderColor),


                              /// Time


                              Padding(
                                padding:  EdgeInsets.symmetric(vertical: 20.sp),
                                child: followUpDateTime(followUpProvider: followUpProvider,label: "Time",
                                  value: followUpProvider.toggleTime,
                                  onChanged: (value){
                                    followUpProvider.updateTimeToggle(value);
                                  }, subTitleText:followUpProvider.selectedTime, showSubTitle: followUpProvider.toggleTime?true:false,
                                  subTitleOnTap:()=>followUpProvider.updateShowTimePicker(true), icon: AssetsImages.clockIconSvg,bgColor: AppTheme.red,
                                ),
                              ),


                              followUpProvider.toggleTime?
                              Visibility(
                                visible:followUpProvider.showTimePicker,
                                child: Align(
                                  alignment: Alignment.center,
                                  child:Padding(
                                    padding:  EdgeInsets.only(bottom: 20.sp),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppTimePickerSpinner(
                                          onTimeChange: (time){
                                            followUpProvider.updateTimeSelection(time);

                                          },
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(),
                                            Padding(
                                              padding:  EdgeInsets.only(right: 20.sp),
                                              child: InkWell(
                                                onTap: ()=>followUpProvider.updateShowTimePicker(false),
                                                child: Text(
                                                  "Done",
                                                  textAlign: TextAlign.start,
                                                  style:
                                                  AppTextStyle().regularText().copyWith(
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight.bold,
                                                      color: AppTheme.appPrimaryColor),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ):const SizedBox.shrink(),





                            ],
                          ),
                        ),

                        SizedBox(height: 20.sp,),



                        /// Repeat

                        InkWell(
                          onTap: ()=> Navigator.pushNamed(context, RouteConstants.followUpRepeatScreen),
                          child: Container(
                            height:Responsive(context).isTabletLandscape? 24.sp:48.sp,
                            width: 1.sw,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppTheme.borderColor),
                              borderRadius: BorderRadius.circular(8.sp),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal:20.sp),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width:Responsive(context).isTabletLandscape? 15.sp:30.sp,
                                        height:Responsive(context).isTabletLandscape? 15.sp:30.sp,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFE4E4E7),
                                          borderRadius: BorderRadius.circular(4.r),
                                        ),
                                        child: SvgPicture.asset(AssetsImages.repeatIcon,color: AppTheme.black,fit: BoxFit.scaleDown,height:10.sp,width: 10.sp, ),
                                      ),
                                      SizedBox(width:10.sp,),
                                      Text(
                                        "Repeat",
                                        textAlign: TextAlign.start,
                                        style: AppTextStyle()
                                            .regularText()
                                            .copyWith(fontSize:Responsive(context).isTabletLandscape? 10.sp:14.sp,fontWeight: FontWeight.w600,color: AppTheme.appTextColor,),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Never",
                                        style: AppTextStyle()
                                            .regularText()
                                            .copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp,fontWeight: FontWeight.w600,color: AppTheme.lightTextColor,),
                                      ),
                                      Icon(Icons.arrow_forward_ios,size:Responsive(context).isTabletLandscape?  8.sp:14.sp,color: AppTheme.lightTextColor,),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 0.2.sh,),




                        CustomFilledButton(
                          height:Responsive(context).isTabletLandscape? null:46.sp,
                          disableButton: false,
                          title: 'Set Reminder',
                          onPressed: () {},
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
