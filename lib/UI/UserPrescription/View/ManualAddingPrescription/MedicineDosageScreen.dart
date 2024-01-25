import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../component/AppHeader/AppHeader.dart';
import '../../../../component/Button/CustomFillButton.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../component/TextField/CustomTextField.dart';
import '../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../utils/constants/app_theme.dart';
import 'Widget/MedicineSelectTypeBottomSheet.dart';
import 'Widget/SelectDurationBottomSheet.dart';
import 'Widget/SelectMedicineFrequencyBottomSheet.dart';

class MedicineDosageScreen extends StatefulWidget {
  const MedicineDosageScreen({super.key});

  @override
  State<MedicineDosageScreen> createState() => _MedicineDosageScreenState();
}

class _MedicineDosageScreenState extends State<MedicineDosageScreen> {
  bool toggleSpecificTime=false;
  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Scaffold(
      bottomNavigationBar:Container(
        color: AppTheme.white,
        height:Responsive(context).isTabletLandscape? 34.sp:80.sp,
        child:  Align(
          child: CustomFilledButton(
            height:Responsive(context).isTabletLandscape? null:50.sp,
            width: 0.9.sw,
            disableButton: false,
            title: 'Save Medicine instructions ',
            onPressed: () {
            },
          ),
        ),

      ) ,
      body: Stack(
        children: [
          AppHeader(
            title: 'Medicine Dosage',
          ),

          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: Responsive(context).isTabletLandscape?42.sp:120.sp),
            padding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp): EdgeInsets.all(20.sp),
            decoration: BoxDecoration(color: AppTheme.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Responsive(context).isTabletLandscape?20.sp: 32.sp), topRight: Radius.circular(Responsive(context).isTabletLandscape?20.sp:32.sp))),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding:  EdgeInsets.all(20.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal:Responsive(context).isTabletLandscape?1.sp:Responsive(context).isTabletPortrait?2.sp:10.sp),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Type",
                                        textAlign: TextAlign.start,
                                        style: AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp,),
                                      ),
                                      SizedBox(height:5.sp),
                                      InkWell(
                                        onTap: ()=>MedicineSelectTypeBottomSheet().medicineSelectTypeBottomSheet(context),
                                        child: CustomTextFormField(
                                          isEnable: false,
                                          // controller: emailController,
                                          hintText: "eg: Tablet ",
                                          inputType: TextInputType.text,
                                          suffixIconConstraints: BoxConstraints.tight(Size(50.sp,Responsive(context).isTabletLandscape? 20.sp:30.sp)),
                                          validator: (value) =>
                                          value!.isEmpty ? "Enter Value" : null,
                                          suffixWidget: const Icon(
                                            Icons.keyboard_arrow_down,
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ) ),
                            Expanded(
                                flex: 1,
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal:Responsive(context).isTabletLandscape?1.sp:Responsive(context).isTabletPortrait?2.sp:10.sp),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Dosage",
                                        textAlign: TextAlign.start,
                                        style: AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp: 14.sp,),
                                      ),
                                      SizedBox(height:5.sp),
                                      CustomTextFormField(
                                        // controller: emailController,
                                        hintText: "",
                                        inputType: TextInputType.text,
                                        suffixIconConstraints: BoxConstraints.tight(Size(50.sp, 30.sp)),
                                        validator: (value) =>
                                        value!.isEmpty ? "Enter Value" : null,
                                      ),

                                    ],
                                  ),
                                ) ),

                          ],
                        ),

                        SizedBox(height:Responsive(context).isTabletLandscape? 5.sp:20.sp),

                        Text(
                          "Frequency",
                          textAlign: TextAlign.start,
                          style: AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 12.sp:14.sp,),
                        ),
                        SizedBox(height:5.sp),
                        InkWell(
                          onTap: ()=>SelectMedicineFrequencyBottomSheet().selectMedicineFrequencyBottomSheet(context),
                          child: CustomTextFormField(
                            isEnable: false,
                            // controller: emailController,
                            hintText: "eg: 2 times / day ",
                            inputType: TextInputType.text,
                            suffixIconConstraints: BoxConstraints.tight(Size(50.sp,Responsive(context).isTabletLandscape? 20.sp: 30.sp)),
                            validator: (value) =>
                            value!.isEmpty ? "Enter Value" : null,
                            suffixWidget: const Icon(
                              Icons.keyboard_arrow_down,
                            ),
                          ),
                        ),
                        SizedBox(height:Responsive(context).isTabletLandscape? 5.sp:20.sp),
                        Text(
                          "Duration",
                          textAlign: TextAlign.start,
                          style: AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp: 14.sp,),
                        ),
                        SizedBox(height:Responsive(context).isTabletLandscape? 5.sp:20.sp),
                        InkWell(
                          onTap: ()=> SelectDurationBottomSheet().selectDurationBottomSheet(context),
                          child: CustomTextFormField(
                            // controller: emailController,
                            hintText: "eg: 2 weeks ",
                            isEnable: false,
                            inputType: TextInputType.text,
                            suffixIconConstraints: BoxConstraints.tight(Size(50.sp,Responsive(context).isTabletLandscape? 20.sp:30.sp)),
                            validator: (value) =>
                            value!.isEmpty ? "Enter Value" : null,
                            suffixWidget: const Icon(
                              Icons.keyboard_arrow_down,
                            ),
                          ),
                        ),
                        SizedBox(height:Responsive(context).isTabletLandscape? 5.sp:20.sp),
                        Text(
                          "Other instructions (Optionl)",
                          textAlign: TextAlign.start,
                          style: AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp: 14.sp,),
                        ),
                        SizedBox(height:5.sp),
                        CustomTextFormField(
                          // controller: emailController,
                          hintText: "Add Other instructions ",
                          inputType: TextInputType.text,
                          suffixIconConstraints: BoxConstraints.tight(Size(50.sp,Responsive(context).isTabletLandscape? 20.sp:30.sp)),
                          validator: (value) =>
                          value!.isEmpty ? "Enter Value" : null,
                          suffixWidget: const Icon(
                            Icons.keyboard_arrow_down,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height:Responsive(context).isTabletLandscape? 5.sp:30.sp,),

                  Container(
                    height:toggleSpecificTime? Responsive(context).isTabletLandscape? 180.sp:250.sp: 66.sp,
                    color: AppTheme.lightFilledColor,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal:15.sp,vertical: 5.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text(
                               "Specific Time",
                               textAlign: TextAlign.start,
                               style: AppTextStyle().regularText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp: 14.sp,),
                             ),
                             SizedBox(
                               height: 30.sp,
                               child: CupertinoSwitch(
                                 activeColor: AppTheme.blue,
                                 value: toggleSpecificTime,
                                 onChanged:(value){
                                   setState(() {
                                     toggleSpecificTime=value;
                                   });
                                 },
                               ),
                             ),
                           ],

                          ),
                          Text(
                            "Add specific time for medicine instructions ",
                            textAlign: TextAlign.start,
                            style: AppTextStyle().regularText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:12.sp,color: AppTheme.lightTextColor),
                          ),
                          SizedBox(height: 10.sp,),



                        /// visibility/invisibility feature part
                          toggleSpecificTime?
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(color: AppTheme.borderColor,),
                            SizedBox(height: 10.sp,),

                            Text(
                              "Specific Time",
                              textAlign: TextAlign.start,
                              style: AppTextStyle().regularText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp: 12.sp,fontWeight: FontWeight.w500,color: AppTheme.appTextColor),
                            ),
                            SizedBox(height: 10.sp,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                buildSpecificTimeContainer(label: 'Morning'),
                                buildSpecificTimeContainer(label: "Afternoon"),
                                buildSpecificTimeContainer(label: "Evening"),
                              ],
                            ),

                            SizedBox(height: 12.sp,),

                            Text(
                              "Instructions",
                              textAlign: TextAlign.start,
                              style: AppTextStyle().regularText().copyWith(fontSize:Responsive(context).isTabletLandscape?8.sp:12.sp,fontWeight: FontWeight.w500,color: AppTheme.appTextColor),
                            ),
                            SizedBox(height: 10.sp,),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                buildSpecificTimeContainer(label: "Before meal"),
                                buildSpecificTimeContainer(label: "Before meal"),
                                buildSpecificTimeContainer(label: "with meal"),
                              ],
                            ),

                          ],
                        ):SizedBox.shrink(),

                        ],





                      ),
                    ),
                  )

                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildSpecificTimeContainer({required String label}) {
    return Container(height:Responsive(context).isTabletLandscape? 20.sp: 40.sp,
                            width:Responsive(context).isTabletLandscape? 80.sp:Responsive(context).isTabletPortrait?90.sp:100.sp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Responsive(context).isTabletLandscape? 20.r:48.r),
                            border: Border.all(color: AppTheme.borderColor),
                          ),
                          child:  Center(
                            child: Text(label,style: TextStyle(
                              fontSize: Responsive(context).isTabletLandscape? 8.sp:null,
                            ),),
                          ),

                        );
  }}
