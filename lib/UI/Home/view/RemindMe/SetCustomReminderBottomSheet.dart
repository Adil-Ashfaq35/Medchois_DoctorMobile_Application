


import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../component/BottomSheet/CustomBottomSheet.dart';
import '../../../../component/Button/CustomFillButton.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../component/TextField/CustomTextField.dart';
import '../../../../utils/constants/app_theme.dart';
import '../../Provider/AppointmentProvider.dart';


class SetCustomReminderBottomSheet {
  setCustomReminderBottomSheet(BuildContext context,
      {AnimationController? animationController}) {
    Size size = MediaQuery.of(context).size;
    Responsive(context).setOrientation(context);
    return CustomBottomSheet().customBottomSheet(
        context,
        showDragHandle: true,
        bgColor: Colors.white,
        Consumer<AppointmentProvider>(builder: (context, appointmentProvider, _){
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                 height: Responsive(context).isTabletLandscape? size.height*0.9:size.height * 0.5,
                padding: EdgeInsets.symmetric( vertical: Responsive(context).isTabletLandscape? 3.sp: 10.sp,horizontal: 5.sp),
                // decoration: BoxDecoration(
                //    color: AppTheme.white,
                //     borderRadius: BorderRadius.only(
                //         topRight: Radius.circular(32.sp),
                //         topLeft: Radius.circular(32.sp))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: Responsive(context).isTabletLandscape?0.sp: 8.sp,horizontal: 14.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Session reminder",
                                textAlign: TextAlign.center,
                                style: AppTextStyle()
                                    .mediumText()
                                    .copyWith(fontSize: Responsive(context).isTabletLandscape? 13.sp: 20.sp),
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
                  
                      SizedBox(
                        height: 45.sp,
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.sp),
                          child: CustomTextFormField(
                            // controller: emailController,
                            hintText: "0",
                            inputType: TextInputType.number,
                            suffixIconConstraints: BoxConstraints.tight(Size(50.sp, 30.sp)),
                            validator: (value) =>
                            value!.isEmpty ? "Enter Value" : null,
                          ),
                        ),
                      ),
                  
                      ListTile(
                        title: const Text('Minutes before'),
                        trailing: Radio<String>(
                          value: 'mint',
                          groupValue:  appointmentProvider.selectedCustomSessionOfReminder,
                          onChanged: (value) {
                            appointmentProvider.updateCustomSessionReminder(value);
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Hours before'),
                        trailing: Radio<String>(
                          value: 'hours',
                          groupValue:  appointmentProvider.selectedCustomSessionOfReminder,
                          onChanged: (value) {
                            appointmentProvider.updateCustomSessionReminder(value);
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Days before'),
                        trailing: Radio<String>(
                          value: 'days',
                          groupValue: appointmentProvider.selectedCustomSessionOfReminder,
                          onChanged: (value) {
                            appointmentProvider.updateCustomSessionReminder(value);
                          },
                        ),
                      ),
                      SizedBox(
                        height: Responsive(context).isTabletLandscape? 5.sp:18.sp,
                      ),
                      Padding(
                        padding:  EdgeInsets.all(8.sp),
                        child: CustomFilledButton(
                            borderColor: AppTheme.grey.withOpacity(0.2),
                            textColor: AppTheme.white,
                            title: 'Submit',
                            disableButton: false,
                            onPressed: () => {
                              Navigator.pop(context)
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        ),
        animationController: animationController);
  }
}