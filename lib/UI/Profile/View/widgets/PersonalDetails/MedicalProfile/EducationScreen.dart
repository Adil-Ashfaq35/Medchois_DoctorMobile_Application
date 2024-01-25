import 'package:doctor_app/UI/Profile/Model/EducationModel.dart';
import 'package:doctor_app/UI/Profile/Provider/MedicalProfileProvider.dart';
import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:doctor_app/utils/constants/AssetsImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../../../../../Utils/Constants/RouteConstant.dart';
import '../../../../../../component/Button/CustomFillButton.dart';
import '../../../../../../utils/constants/AppIcons.dart';
import '../../../../../../utils/constants/app_theme.dart';
import 'EducationWidget.dart';
import 'deleteConfirmation.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  
  @override
  void initState() {
    context.read<MedicalProfileProvider>().educationModel=[
      EducationModel(iconPath: AssetsImages.educationIcon, educationLocation: "Cairo University ", universityName: "bachelorin medicine and surgery", startDate: "Feb 2005", endDate: "Feb 2012")
    ];
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return  Consumer<MedicalProfileProvider>(
        builder: (context,medicalProfileProvider,_) {
        return Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.sp),
          child:  Column(
            children: [
              ListView.builder(
                physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:medicalProfileProvider.educationModel.length,
                  itemBuilder: (context,index){
                    return      Slidable(
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
                        child: EducationWidget(educationModel:medicalProfileProvider.educationModel[index],));
                  }
              ),


              SizedBox(height:20.sp),


              CustomFilledButton(
                  borderColor: AppTheme.grey,
                  borderWidth: 1,
                  buttonGradients: const LinearGradient(colors: [
                    AppTheme.white,
                    AppTheme.white
                  ]),
                  fontSize: Responsive(context).isTabletLandscape? 10.sp:null,
                  buttonIcon: AppIcons.add,
                  buttonIconColor: AppTheme.appPrimaryColor,
                  btnColor: AppTheme.appScreenBackgroundColor,
                  textColor: AppTheme.appPrimaryColor,
                  title: 'Add Education',
                  disableButton: false,
                  onPressed: () {
                    Navigator.pushNamed(context, RouteConstants.addEducation);
                  }),
            ],
          ),
        );
      }
    );
  }
}
