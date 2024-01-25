import 'package:doctor_app/UI/Profile/Provider/MedicalProfileProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../../component/BottomSheet/CustomBottomSheet.dart';
import '../../../../../../component/Button/CustomFillButton.dart';
import '../../../../../../component/Text/TextStyle.dart';
import '../../../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../../../utils/constants/app_theme.dart';

class SelectDegreeBottomSheet {
  selectDegreeBottomSheet(BuildContext context,
      {AnimationController? animationController}) {
    Size size = MediaQuery.of(context).size;
    Responsive(context).setOrientation(context);
    String selectedDegree = '';
    return CustomBottomSheet().customBottomSheet(
        context,
        Container(
          height:Responsive(context).isTabletLandscape? size.height*0.9:size.height * 0.4,
          padding: EdgeInsets.symmetric( vertical: 10.sp),
          decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32.sp),
                  topLeft: Radius.circular(32.sp))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.sp,horizontal: 14.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select Degree",
                        textAlign: TextAlign.center,
                        style: AppTextStyle()
                            .mediumText()
                            .copyWith(fontSize:Responsive(context).isTabletLandscape? 12.sp:20.sp),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.close)),
                    ],
                  )),
              SizedBox(
                height: 0.02.sh,
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 15.sp),
                title: const Text('Bachelor\'s Degree'),
                trailing: Radio<String>(
                  value: 'bachelors',
                  groupValue: selectedDegree,
                  onChanged: (value) {
                    // setState(() {
                    selectedDegree = value!;
                    // });
                  },
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 15.sp),
                title: const Text('Master\'s Degree'),
                trailing: Radio<String>(
                  value: 'masters',
                  groupValue: selectedDegree,
                  onChanged: (value) {
                    // setState(() {
                    selectedDegree = value!;
                    // });
                  },
                ),
              ),
              SizedBox(
                height: 30.sp,
              ),
              Padding(
                padding:  EdgeInsets.all(8.sp),
                child: CustomFilledButton(
                      height: Responsive(context).isTabletPortrait?50.sp:null,
                    borderColor: AppTheme.grey.withOpacity(0.2),
                    textColor: AppTheme.white,
                    title: 'Submit',
                    disableButton: false,
                    onPressed: () => {
                          //  context.read<MedicalProfileProvider>().removeExperience(index),
                          Navigator.pop(context)
                        }),
              ),
            ],
          ),
        ),
        animationController: animationController);
  }
}
