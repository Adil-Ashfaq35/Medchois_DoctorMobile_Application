import 'package:doctor_app/Routes/router_generator.dart';
import 'package:doctor_app/Utils/Constants/RouteConstant.dart';
import 'package:doctor_app/utils/constants/AppIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../component/AppHeader/AppHeader.dart';
import '../../../../component/Button/CustomFillButton.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../component/TextField/CustomTextField.dart';
import '../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../utils/constants/app_theme.dart';

class AddEPrescriptionScreen extends StatelessWidget {
  const AddEPrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
          return Scaffold(
            body: Stack(
              children: [
                AppHeader(
                  title: 'Add E- Prescription',
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
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              "Diagnosis Info",
                              textAlign: TextAlign.start,
                              style: AppTextStyle().regularText().copyWith(fontSize: 13.sp,color: AppTheme.lightTextColor),
                            ),


                            SizedBox(height:Responsive(context).isTabletLandscape?10.sp:20.sp,),

                            Text(
                              "Diagnosis",
                              textAlign: TextAlign.start,
                              style: AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape?8.sp:14.sp,),
                            ),

                            SizedBox(height:Responsive(context).isTabletLandscape? 5.sp:10.sp,),

                            CustomTextFormField(
                              hintText: "eg: broken arm",
                              inputType: TextInputType.text,
                              textCapitalization: TextCapitalization.sentences,
                              suffixIconConstraints: BoxConstraints.tight(Size(50.sp, 30.sp)),
                              validator: (value) =>
                              value!.isEmpty ? "Enter Diagnosis" : null,
                            ),
                            SizedBox(height:Responsive(context).isTabletLandscape?10.sp:20.sp,),

                            Text(
                              "Diagnotic",
                              textAlign: TextAlign.start,
                              style: AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 10.sp:14.sp,),
                            ),

                            SizedBox(height:Responsive(context).isTabletLandscape? 5.sp:10.sp,),

                            CustomTextFormField(
                              hintText: "eg: Lab test Title",
                              inputType: TextInputType.text,
                              textCapitalization: TextCapitalization.sentences,
                              suffixIconConstraints: BoxConstraints.tight(Size(50.sp, 30.sp)),
                              validator: (value) =>
                              value!.isEmpty ? "Enter Diagnosis" : null,
                            ),

                            SizedBox(height:Responsive(context).isTabletLandscape? 5.sp:20.sp,),

                            Text(
                              "Medicine Info",
                              textAlign: TextAlign.start,
                              style: AppTextStyle().regularText().copyWith(fontSize: 13.sp,color: AppTheme.lightTextColor),
                            ),
                            SizedBox(height:Responsive(context).isTabletLandscape? 5.sp:20.sp,),

                            InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, RouteConstants.addMedicineScreen);
                              },
                              child: Container(
                                height:Responsive(context).isTabletLandscape? 30.sp:56.sp,
                                width: 1.sw,
                                decoration: BoxDecoration(
                                color:const Color(0xFFEDF9F7),
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal:12.sp),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Add Medicine or Supplement",
                                        textAlign: TextAlign.start,
                                        style: AppTextStyle().regularText().copyWith(fontSize: 13.sp,color: AppTheme.appPrimaryColor),
                                      ),
                                      const Icon(AppIcons.arrowForward,color: AppTheme.appPrimaryColor),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height:Responsive(context).isTabletLandscape? 0.15.sh:0.25.sh,),
                            CustomFilledButton(
                              disableButton: false,
                              title: 'Send e-prescription',
                              onPressed: () {
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
}
