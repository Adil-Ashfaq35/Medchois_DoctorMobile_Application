import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../component/Text/TextStyle.dart';
import '../../../../utils/constants/AssetsImage.dart';

class ProfileSection extends StatelessWidget {

  String iconPath;
  String label;
  String? suffixLabel;
  String? suffixDate;
  VoidCallback onTap;
  Color? iconColor;
  double ?iconSize;

   ProfileSection({
    super.key,
    required this.label,
    required this.onTap,
     this.suffixLabel,
     this.suffixDate,
     this.iconColor,
     this.iconSize,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.all(10.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(iconPath,height:iconSize==null? Responsive(context).isTabletLandscape?10.sp:20.sp:iconSize,color:iconColor?? Colors.black,),
                SizedBox(width: 10.sp,),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: AppTextStyle()
                      .regularText()
                      .copyWith(fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp,fontWeight: FontWeight.w500, color: const Color(0xFF414042),),
                ),
              ],
            ),
            Row(
              children: [
                suffixLabel!=null?
                 Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Expires in ',
                        style: TextStyle(
                          color: Color(0xFF2C91D4),
                          fontSize: 10,
                          fontFamily: 'AmpleSoft Pro',
                          fontWeight: FontWeight.w400,
                          height: 0.15,
                          letterSpacing: -0.20,
                        ),
                      ),
                      TextSpan(
                        text: suffixDate!,
                        style: const TextStyle(
                          color: Color(0xFF2C91D4),
                          fontSize: 12,
                          fontFamily: 'AmpleSoft Pro',
                          fontWeight: FontWeight.w500,
                          height: 0.12,
                          letterSpacing: -0.20,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.right,
                )

                    :const SizedBox.shrink(),
                Icon(
                  size:Responsive(context).isTabletLandscape? 8.sp:15.sp,
                  Icons.arrow_forward_ios,
                  color: const Color(0xffAEB6CA),),
              ],
            ),


          ],
        ),
      ),
    );
  }
}