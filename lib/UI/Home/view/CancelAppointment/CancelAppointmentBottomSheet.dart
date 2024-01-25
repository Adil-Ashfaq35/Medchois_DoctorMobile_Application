import 'package:doctor_app/Utils/Constants/RouteConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../component/BottomSheet/CustomBottomSheet.dart';
import '../../../../component/Button/CustomCircleButton.dart';
import '../../../../component/Button/CustomFillButton.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../component/TextField/CustomTextField.dart';
import '../../../../utils/constants/AppIcons.dart';
import '../../../../utils/constants/app_theme.dart';
import '../../Provider/AppointmentProvider.dart';


class CancelAppointmentBottomSheet {
  cancelAppointmentBottomSheet(BuildContext context,
      {AnimationController? animationController}) {
    Size size = MediaQuery.of(context).size;
    return CustomBottomSheet().customBottomSheet(context,
        showDragHandle: true,
        Consumer<AppointmentProvider>(
            builder: (context, appointmentProvider, _) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  height: size.height * 0.6,
                  decoration: BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(32.sp),
                          topLeft: Radius.circular(32.sp))),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(right: 10.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Cancel Consultation",
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle().boldText(),
                                ),
                                CustomCircleIconButton(
                                  onTap: () => Navigator.of(context).pop(),
                                  height: 25.sp,
                                  width: 25.sp,
                                  boxColor: AppTheme.grey.withOpacity(0.2),
                                  icon: AppIcons.close,
                                  iconColor: AppTheme.grey,
                                  iconSize: 16.sp,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 0.01.sh,
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text('Reason of cancelation 1'),
                            trailing: Radio<String>(
                              value: 'reason1',
                              groupValue: appointmentProvider.selectedSessionOfCancelAppointment,
                              onChanged: (value) {
                                appointmentProvider.updateCancelSession(value);
                              },
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text('Reason of cancelation 2'),
                            trailing: Radio<String>(
                              value: 'reason2',
                              groupValue: appointmentProvider.selectedSessionOfCancelAppointment,
                              onChanged: (value) {
                                appointmentProvider.updateCancelSession(value);
                              },
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text('Reason of cancelation 3'),
                            trailing: Radio<String>(
                              value: 'reason3',
                              groupValue: appointmentProvider.selectedSessionOfCancelAppointment,
                              onChanged: (value) {
                                appointmentProvider.updateCancelSession(value);
                              },
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text('Other'),
                            trailing: Radio<String>(
                              value: 'other',
                              groupValue: appointmentProvider.selectedSessionOfCancelAppointment,
                              onChanged: (value) {
                                appointmentProvider.updateCancelSession(value);
                              },
                            ),
                          ),



                          Visibility(
                            visible: appointmentProvider.selectedSessionOfCancelAppointment == 'other',
                            child:  Padding(
                              padding:  EdgeInsets.only(right: 10.sp),
                              child: CustomTextFormField(
                                // controller: emailController,
                                hintText: "Type Your Reason",
                                inputType: TextInputType.number,
                                maxLines: 3,
                                suffixIconConstraints: BoxConstraints.tight(Size(50.sp, 30.sp)),
                                validator: (value) =>
                                value!.isEmpty ? "Enter Value" : null,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40.sp,
                          ),
                          CustomFilledButton(
                              borderColor: AppTheme.grey.withOpacity(0.2),
                              textColor: AppTheme.white,
                              btnColor: AppTheme.red,
                              title: 'Confirm',
                              disableButton: false,
                              onPressed: () => {
                                //  Navigator.pushNamedAndRemoveUntil(context, RouteConstants.navMainScreen,(route) => false),

                                Navigator.pushNamedAndRemoveUntil(context, RouteConstants.allNavScreen,arguments:{
                                  "is_show_flash": true,
                                  "message":"Consultation cancelled",
                                },  (route) => false)




                              }),
                          SizedBox(
                            height: 10.sp,
                          ),
                          CustomFilledButton(
                            borderWidth: 0.1,
                            borderColor: AppTheme.grey.withOpacity(0.2),
                            fontSize: 13.sp,
                            buttonGradients: const LinearGradient(
                                colors: [AppTheme.white, AppTheme.white]),
                            btnColor: AppTheme.white,
                            textColor: AppTheme.appPrimaryColor,
                            title: "Cancel",
                            disableButton: false,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }), animationController: animationController);
  }
}
