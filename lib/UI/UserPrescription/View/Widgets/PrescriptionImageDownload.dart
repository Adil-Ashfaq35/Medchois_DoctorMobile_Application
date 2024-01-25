import 'package:doctor_app/utils/constants/AppIcons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../component/Button/CustomFillButton.dart';
import '../../../../utils/constants/AssetsImage.dart';
import '../../../../utils/constants/app_theme.dart';


class PrescriptionImageDownload {
  prescriptionImageDownload(BuildContext context, {String? prescriptionImage}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppTheme.transparent,
            elevation: 0,
            contentPadding: EdgeInsets.zero,
            content: Stack(
              children: [
                Center(
                  child: Padding(
                    padding:  EdgeInsets.only(bottom: 80.sp),
                    child: Container(
                      height: double.infinity,
                                       // padding: EdgeInsets.only(bottom: 60.sp),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                    borderRadius: BorderRadius.circular(8.sp),),
                      child: Padding(
                        padding:  EdgeInsets.all(10.sp),
                        child: Image.network(
                            prescriptionImage!, fit: BoxFit.contain,
                        // height:0.5.sh,
                          width:1.sw,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 5.sp,
                  right: 8.sp,
                  child: InkWell(
                    onTap:()=> Navigator.pop(context),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Icon(
                          AppIcons.close,
                          color: AppTheme.black,
                          size: 24.sp,
                        ),
                      ),

                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child:  CustomFilledButton(
                    disableButton: false,
                    title: 'Edit',
                    onPressed: () => Navigator.of(context).pop(),
                    imageButtonIcon: SvgPicture.asset(
                      AssetsImages.editIcon,
                      color: AppTheme.white,
                      height: 18.sp,
                      width: 18.sp,
                    ),
                  ),
                )

              ],

            ),
          );
        });
  }
}
