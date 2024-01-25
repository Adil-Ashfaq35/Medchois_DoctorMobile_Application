import 'package:doctor_app/UI/Profile/Model/JobExperienceModel.dart';
import 'package:doctor_app/UI/Profile/Provider/MedicalProfileProvider.dart';
import 'package:doctor_app/UI/Profile/View/widgets/PersonalDetails/MedicalProfile/MedicalProfile.dart';
import 'package:doctor_app/Utils/Constants/RouteConstant.dart';
import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:doctor_app/utils/constants/AppIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../../../component/Button/CustomFillButton.dart';
import '../../../../../../component/Text/TextStyle.dart';
import '../../../../../../component/TextField/CustomTextField.dart';
import '../../../../../../utils/constants/AssetsImage.dart';
import '../../../../../../utils/constants/app_theme.dart';
import 'ExperienceWidget.dart';
import 'deleteConfirmation.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  @override
  void initState() {
    context.read<MedicalProfileProvider>().jobExperienceModel= [
      JobExperienceModel(iconPath: AssetsImages.countryIcon, jobTitle: "Consultant", companyName:"Nutrition world place", jobLocation: "Egypt, Cairo"),
      JobExperienceModel(iconPath: AssetsImages.countryIcon, jobTitle: "Physicians", companyName:"itfaq hospital", jobLocation: "Pakistan, Lahore"),
      JobExperienceModel(iconPath: AssetsImages.countryIcon, jobTitle: "Gynecologist", companyName:"Nutrition world place", jobLocation: "Pakistan, Islamabad"),
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Consumer<MedicalProfileProvider>(
      builder: (context,medicalProfileProvider,_) {
        return Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.sp),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: Responsive(context).isTabletLandscape?5.sp:20.sp),
                  child: Text(
                    "Your Experiences",
                    textAlign: TextAlign.left,
                    style: AppTextStyle().mediumText().copyWith(fontSize: Responsive(context).isTabletLandscape? 12.sp:18.sp, fontWeight: FontWeight.w800),
                  ),
                ),

                Text(
                  "Your Experiences",
                  textAlign: TextAlign.left,
                  style: AppTextStyle().regularText().copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp: 14.sp,fontWeight: FontWeight.w500),
                ),

                SizedBox(height: 10.sp,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width:Responsive(context).isTabletLandscape? 0.57.sw :0.57.sw,
                      child: CustomTextFormField(
                         controller: medicalProfileProvider.experienceController,
                        hintText: "0",
                        inputType: TextInputType.number,
                        textCapitalization: TextCapitalization.sentences,
                        suffixIconConstraints: BoxConstraints.tight(Size(70.sp, 30.sp)),
                        validator: (value) =>
                        value!.isEmpty ? "" : null,
                        onChange: (value){
                          medicalProfileProvider.updateExperience(value);
                        },
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 8.sp,),
                        InkWell(
                          onTap: (){
                            medicalProfileProvider.decreaseExperienceValue();
                          },
                          child: Container(
                            height:Responsive(context).isTabletLandscape? 20.sp:35.sp,
                            width: 40.sp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.sp),
                            border: Border.all(color: const Color(0xFFE4E4E7))
                            ),
                            child: const Icon(AppIcons.remove),

                          ),
                        ),
                        SizedBox(width:8.sp,),
                        InkWell(
                          onTap: (){
                            medicalProfileProvider.increaseExperienceValue();
                          },
                          child: Container(
                            height:Responsive(context).isTabletLandscape? 20.sp:35.sp,
                            width: 40.sp,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.sp),
                                border: Border.all(color: const Color(0xFFE4E4E7))
                            ),
                            child: const Icon(AppIcons.add),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 0.02.sh,),
                Text(
                  "Positions",
                  textAlign: TextAlign.left,
                  style: AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 12.sp:18.sp, fontWeight: FontWeight.w800),
                ),

                SizedBox(height: 0.01.sh,),

                MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                      itemCount:medicalProfileProvider.jobExperienceModel.length,
                      itemBuilder: (context,index){
                    return  Slidable(
                        key:  ValueKey(index.toString()),
                        direction: Axis.horizontal,

                        endActionPane:  ActionPane(
                          motion: const DrawerMotion(),
                          children: [
                            SlidableAction(
                              // An action can be bigger than the others.
                              flex: 1,
                              onPressed: (context){

                              },
                              backgroundColor: const Color(0xFF63C0FD),
                              foregroundColor: AppTheme.whiteColor,
                              borderRadius: BorderRadius.circular(8.sp),
                              icon: Icons.edit,
                            ),
                            SlidableAction(
                              onPressed: (_){
                                DeleteConfirmationBottomSheet().deleteConfirmationBottomSheet(context,index: index);

                              },
                              backgroundColor: AppTheme.red,
                              foregroundColor: Colors.white,
                              borderRadius: BorderRadius.circular(8.sp),
                              icon: Icons.delete_forever_outlined,
                            ),
                          ],
                        ),
                        closeOnScroll: true,
                        child: Padding(
                          padding:  EdgeInsets.symmetric(vertical:5.sp),
                          child: ExperienceWidget(jobExperienceModel:medicalProfileProvider.jobExperienceModel[index],),
                        ));
                  }
                  ),
                ),




                SizedBox(height:Responsive(context).isTabletLandscape? 10.sp:50.sp,),

                CustomFilledButton(
                  borderColor: AppTheme.grey,
                  buttonGradients: const LinearGradient(colors: [
                    AppTheme.white,
                    AppTheme.white
                  ]),
                  buttonIcon: AppIcons.add,
                  buttonIconColor: AppTheme.appPrimaryColor,
                  btnColor: AppTheme.appScreenBackgroundColor,
                  textColor: AppTheme.appPrimaryColor,
                  title: 'Add Position',
                  fontSize: Responsive(context).isTabletLandscape? 12.sp: null,
                  disableButton: false,
                  onPressed: () {
                    Navigator.pushNamed(context, RouteConstants.addPosition);
                  }),
              ],
            ),
          ),
        );
      }
    );
  }
}


