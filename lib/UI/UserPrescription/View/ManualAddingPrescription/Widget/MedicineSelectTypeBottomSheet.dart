import 'package:doctor_app/Utils/Constants/RouteConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../component/BottomSheet/CustomBottomSheet.dart';
import '../../../../../component/Button/CustomCircleButton.dart';
import '../../../../../component/Button/CustomFillButton.dart';
import '../../../../../component/Text/TextStyle.dart';
import '../../../../../component/TextField/CustomTextField.dart';
import '../../../../../utils/constants/AppIcons.dart';
import '../../../../../utils/constants/app_theme.dart';
import '../../../../Home/Provider/AppointmentProvider.dart';



class MedicineSelectTypeBottomSheet {
  medicineSelectTypeBottomSheet(BuildContext context,
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
                      padding:  EdgeInsets.symmetric(horizontal: 10.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Select Type",
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
                          SizedBox(
                            height: 30.sp,
                          ),
                          ListTile(
                            title: const Text('Tablet'),
                            trailing: Radio<String>(
                              value: 'reason1',
                              groupValue: appointmentProvider.selectedSessionOfCancelAppointment,
                              onChanged: (value) {
                                appointmentProvider.updateCancelSession(value);
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('Capsule'),
                            trailing: Radio<String>(
                              value: 'reason2',
                              groupValue: appointmentProvider.selectedSessionOfCancelAppointment,
                              onChanged: (value) {
                                appointmentProvider.updateCancelSession(value);
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('Vial'),
                            trailing: Radio<String>(
                              value: 'reason3',
                              groupValue: appointmentProvider.selectedSessionOfCancelAppointment,
                              onChanged: (value) {
                                appointmentProvider.updateCancelSession(value);
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('Ampule'),
                            trailing: Radio<String>(
                              value: 'reason3',
                              groupValue: appointmentProvider.selectedSessionOfReminder,
                              onChanged: (value) {
                                appointmentProvider.updateCancelSession(value);
                              },
                            ),
                          ),

                          SizedBox(
                            height: 100.sp,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.sp),
                            child: CustomFilledButton(
                              borderWidth: 0.1,
                              borderColor: AppTheme.grey.withOpacity(0.2),
                              fontSize: 13.sp,
                              textColor: AppTheme.white,
                              title: "Select",
                              disableButton: false,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
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
