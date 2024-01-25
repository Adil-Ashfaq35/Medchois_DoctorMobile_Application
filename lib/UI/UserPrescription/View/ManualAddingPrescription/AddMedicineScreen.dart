

import 'package:doctor_app/utils/constants/AppIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Utils/Constants/RouteConstant.dart';
import '../../../../component/AppHeader/AppHeader.dart';
import '../../../../component/Button/CustomFillButton.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../component/TextField/CustomTextField.dart';
import '../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../utils/constants/AssetsImage.dart';
import '../../../../utils/constants/app_theme.dart';
import '../../../PreviousSession/Widgets/PreviousSessionPatientWidget.dart';


class AddMedicineScreen extends StatelessWidget {
  const AddMedicineScreen({super.key});



  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    String imageUrl ="https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?q=80&w=2030&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

    return Scaffold(
      body: Stack(
        children: [
          AppHeader(
            title: 'Add Medicine',
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
                children: [

                  CustomTextFormField(
                    //  controller: passwordController,
                    hintText: "Search For Medicine",
                    inputType: TextInputType.text,
                    textCapitalization: TextCapitalization.sentences,
                    suffixIconConstraints: BoxConstraints.tight(Size(50.sp, 30.sp)),
                    validator: (value) =>
                    value!.isEmpty ? "" : null,
                    prefixWidget: const Icon(AppIcons.search,color: AppTheme.lightTextColor,),
                  ),


                  ListView.builder(
                      itemCount: 6,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                        return   Padding(
                          padding:  EdgeInsets.symmetric(vertical: 10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height:Responsive(context).isTabletLandscape? 35.sp: 48.sp,
                                    width:Responsive(context).isTabletLandscape? 35.sp: 48.sp,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.r),
                                      image: DecorationImage(
                                        image: NetworkImage(imageUrl),
                                        fit: BoxFit.cover,
                                      )

                                    ),
                                  ),

                                  SizedBox(width: 8.sp,),

                                  Text(
                                    "Vitamin A - 60 mg",
                                    textAlign: TextAlign.start,
                                    style: AppTextStyle().regularText().copyWith(fontSize:Responsive(context).isTabletLandscape? 10.sp: 14.sp,color: AppTheme.appTextColor),
                                  ),
                                ],
                              ),

                              Container(
                                height:Responsive(context).isTabletLandscape? 20.sp: 40.sp,
                                width:Responsive(context).isTabletLandscape? 20.sp:40.sp,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(color: AppTheme.appPrimaryColor),
                                ),
                                child: Center(
                                  child: IconButton(
                                    icon:Icon(Icons.add),
                                    color: AppTheme.appPrimaryColor, onPressed: () {
                                    Navigator.pushNamed(context, RouteConstants.medicineDosageScreen);
                                  },
                                  ),
                                ),
                              ),




                            ],
                          ),
                        );

                      }),


                  SizedBox(height:Responsive(context).isTabletLandscape? 20.sp:50.sp,),



                  CustomFilledButton(
                    disableButton: false,
                    title: 'Save Medicine',
                    onPressed: () {
                    },
                  ),


                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
