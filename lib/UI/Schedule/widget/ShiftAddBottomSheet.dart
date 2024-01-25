
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../component/BottomSheet/CustomBottomSheet.dart';
import '../../../../component/Button/CustomFillButton.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../component/TextField/CustomTextField.dart';
import '../../../../utils/constants/app_theme.dart';
import '../../../utils/HelperFunction/Reponsive.dart';
import '../Provider/ScheduleProvider.dart';
import 'TimePickerBottomSheet.dart';

class ShiftAddBottomSheet {
  shiftAddBottomSheet(BuildContext context,
      {AnimationController? animationController}) {
    Size size = MediaQuery.of(context).size;
    Responsive(context).setOrientation(context);
    return CustomBottomSheet().customBottomSheet(context,
        Consumer<ScheduleProvider>(
            builder: (context, appointmentProvider, _) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  height:Responsive(context).isTabletLandscape? size.height*0.8:size.height * 0.6,
                  padding: EdgeInsets.symmetric(vertical: 10.sp),
                  decoration: BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(32.sp),
                          topLeft: Radius.circular(32.sp))),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Column(
                         children: [
                           Padding(
                               padding:
                               EdgeInsets.symmetric(vertical: 8.sp, horizontal: 14.sp),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text(
                                     "Saturday Shifts",
                                     textAlign: TextAlign.center,
                                     style:
                                     AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 12.sp:20.sp),
                                   ),
                                   IconButton(
                                       onPressed: () {
                                         Navigator.of(context).pop();
                                       },
                                       icon: const Icon(Icons.close)),
                                 ],
                               )),
                           SizedBox(
                             height: 0.025.sh,
                           ),

                           Row(
                             children: [
                               Expanded(
                                 flex: 1,
                                 child: Padding(
                                   padding:EdgeInsets.symmetric(horizontal: 10.sp),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         "From",
                                         textAlign: TextAlign.center,
                                         style:
                                         AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp: 14.sp,fontWeight: FontWeight.bold),
                                       ),
                                       SizedBox(height: 5.sp,),
                                       InkWell(
                                         onTap: (){
                                           TimerPickerBottomSheet().timerPickerBottomSheet(context);
                                         },
                                         child: SizedBox(
                                           height: 45.sp,
                                           child: CustomTextFormField(
                                             isEnable: false,
                                             // controller: emailController,
                                             hintText: "1:00 PM",
                                             inputType: TextInputType.number,
                                             suffixIconConstraints: BoxConstraints.tight(Size(50.sp, 30.sp)),
                                             validator: (value) =>
                                             value!.isEmpty ? "Enter Value" : null,
                                           ),
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                               Expanded(
                                 flex: 1,
                                 child: Padding(
                                   padding:  EdgeInsets.symmetric(horizontal: 10.sp),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         "To",
                                         textAlign: TextAlign.center,
                                         style:
                                         AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp: 14.sp,fontWeight: FontWeight.bold),
                                       ),
                                       SizedBox(height: 5.sp,),
                                       InkWell(
                                         onTap: (){
                                           TimerPickerBottomSheet().timerPickerBottomSheet(context);
                                         },
                                         child: SizedBox(
                                           height: 45.sp,
                                           child: CustomTextFormField(
                                             isEnable: false,
                                             // controller: emailController,
                                             hintText: "1:00 PM",
                                             inputType: TextInputType.number,
                                             suffixIconConstraints: BoxConstraints.tight(Size(50.sp, 30.sp)),
                                             validator: (value) =>
                                             value!.isEmpty ? "Enter Value" : null,
                                             onTap: (){
                                               TimerPickerBottomSheet().timerPickerBottomSheet(context);
                                             },
                                           ),
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                             ],
                           ),

                           /// add shift


                           Padding(
                             padding:  EdgeInsets.symmetric(horizontal: 10.sp),
                             child: Row(
                               children: [
                                 const Icon(Icons.add,color: AppTheme.primaryColor,),
                                 SizedBox(width: 5.sp,),
                                 Text(
                                   "Add shift",
                                   textAlign: TextAlign.center,
                                   style:
                                   AppTextStyle().regularText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp: 14.sp,color: AppTheme.primaryColor),
                                 ),
                               ],
                             ),
                           )


                         ],
                       ),




                        CustomFilledButton(
                          borderWidth: 0.1,
                          borderColor: AppTheme.grey.withOpacity(0.2),
                          // buttonGradients: const LinearGradient(
                          //     colors: [AppTheme.white, AppTheme.white]),

                          textColor: AppTheme.white,
                          title: "Set Time",
                          disableButton: false,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }), animationController: animationController);
  }
}
