import 'package:doctor_app/Routes/router_generator.dart';
import 'package:doctor_app/Utils/Constants/RouteConstant.dart';
import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../component/BottomSheet/CustomBottomSheet.dart';
import '../../../../component/Button/CustomFillButton.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../utils/HelperFunction/HelperFunction.dart';
import '../../../../utils/constants/AssetsImage.dart';
import '../../../../utils/constants/app_theme.dart';
import '../../Provider/AppointmentProvider.dart';
import 'SetCustomReminderBottomSheet.dart';

class SetReminderBottomSheet {
  setReminderBottomSheet(BuildContext context,
      {AnimationController? animationController}) {
    Size size = MediaQuery.of(context).size;
    Responsive(context).setOrientation(context);
    return CustomBottomSheet().customBottomSheet(context,showDragHandle: true,
        Consumer<AppointmentProvider>(
            builder: (context, appointmentProvider, _) {
      return Container(
        height: Responsive(context).isTabletLandscape? size.height*0.9:size.height * 0.8,
        padding: EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape? 5.sp:10.sp),
        decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(32.sp),
                topLeft: Radius.circular(32.sp))),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding:
                      EdgeInsets.symmetric(vertical:Responsive(context).isTabletLandscape? 4.sp:8.sp, horizontal: 14.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Session reminder",
                        textAlign: TextAlign.center,
                        style:
                            AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 10.sp:20.sp),
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
                title: const Text('5 Minutes before'),
                trailing: Radio<String>(
                  value: '5mint',
                  groupValue: appointmentProvider.selectedSessionOfReminder,
                  onChanged: (value) {
                    appointmentProvider.updateSessionReminder(value);
                  },
                ),
              ),
              ListTile(
                title: const Text('10 Minutes before'),
                trailing: Radio<String>(
                  value: '10mint',
                  groupValue: appointmentProvider.selectedSessionOfReminder,
                  onChanged: (value) {
                    appointmentProvider.updateSessionReminder(value);
                  },
                ),
              ),
              ListTile(
                title: const Text('15 Minutes before'),
                trailing: Radio<String>(
                  value: '15mint',
                  groupValue: appointmentProvider.selectedSessionOfReminder,
                  onChanged: (value) {
                    appointmentProvider.updateSessionReminder(value);
                  },
                ),),
          
              ListTile(
                title: const Text('30 Minutes before'),
                trailing: Radio<String>(
                  value: '30mint',
                  groupValue: appointmentProvider.selectedSessionOfReminder,
                  onChanged: (value) {
                    appointmentProvider.updateSessionReminder(value);
                  },
                ),
              ),
              ListTile(
                title: const Text('1 hour before'),
                trailing: Radio<String>(
                  value: '1hour',
                  groupValue: appointmentProvider.selectedSessionOfReminder,
                  onChanged: (value) {
                    appointmentProvider.updateSessionReminder(value);
                  },
                ),
              ),
              ListTile(
                title: const Text('2 hours before'),
                trailing: Radio<String>(
                  value: '2hour',
                  groupValue: appointmentProvider.selectedSessionOfReminder,
                  onChanged: (value) {
                    appointmentProvider.updateSessionReminder(value);
                  },
                ),
              ),
              ListTile(
                title: const Text('1 day before'),
                trailing: Radio<String>(
                  value: '1day',
                  groupValue: appointmentProvider.selectedSessionOfReminder,
                  onChanged: (value) {
                    appointmentProvider.updateSessionReminder(value);
                  },
                ),
              ),
              SizedBox(
                height:Responsive(context).isTabletLandscape? 5.sp:25.sp,
              ),
              Padding(
                padding: EdgeInsets.all(8.sp),
                child: CustomFilledButton(
                    borderColor: AppTheme.grey.withOpacity(0.2),
                    textColor: AppTheme.white,
                    title: 'Submit',
                    disableButton: false,
                    onPressed: () => {
                    //  Navigator.pushNamedAndRemoveUntil(context, RouteConstants.navMainScreen,(route) => false),
          
                      Navigator.pushNamedAndRemoveUntil(context, RouteConstants.allNavScreen,arguments:{
                        "is_show_flash": true,
                        "message":"Reminder Set Successfully",
                      },  (route) => false)
          
          
                          //  context.read<MedicalProfileProvider>().removeExperience(index),
          
                    // HelperFunction().showFlushBar(context,
                    // message: 'Reminder Set Successfully',
                    // actionButtonOnTap: () {},
                    // actionButtonText: "Undo",
                    // leadingIcon: AssetsImages.verifiedIcon,
                    // showActionButton: true,
                    // showCloseButton: true,
                    // ).show(context),
          
          
                        }),
              ),
              SizedBox(
                height: 5.sp,
              ),
              Padding(
                padding: EdgeInsets.all(8.sp),
                child: CustomFilledButton(
                  borderWidth: 0.1,
                  borderColor: AppTheme.grey.withOpacity(0.2),
                  fontSize:Responsive(context).isTabletLandscape? null:13.sp,
                  buttonGradients: const LinearGradient(
                      colors: [AppTheme.white, AppTheme.white]),
                  btnColor: AppTheme.white,
                  textColor: AppTheme.appPrimaryColor,
                  title: "Custom Reminder",
                  disableButton: false,
                  onPressed: () {
                    Navigator.pop(context);
                    SetCustomReminderBottomSheet().setCustomReminderBottomSheet(context);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }), animationController: animationController);
  }
}
