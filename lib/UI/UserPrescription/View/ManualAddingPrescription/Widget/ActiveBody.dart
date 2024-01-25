import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:doctor_app/utils/constants/AssetsImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../component/Button/CustomFillButton.dart';
import '../../../../../component/Text/TextStyle.dart';
import '../../../../../utils/constants/app_theme.dart';
import 'EPrescriptionSelectionBottomSheet.dart';

class ActiveBodyMainScreen extends StatelessWidget {
  const ActiveBodyMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    Responsive(context).setOrientation(context);
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Container(),
        
        
        Column(
          children: [
            SvgPicture.asset(AssetsImages.document),
            SizedBox(height:Responsive(context).isTabletLandscape?10.sp:20.sp,),
            Text(
              "You didn't add any prescriptions yet",
              textAlign: TextAlign.center,
              style: AppTextStyle().regularText().copyWith(fontSize:Responsive(context).isTabletLandscape? 10.sp:18.sp,color: AppTheme.lightTextColor),
            ),
          ],
        ),



        CustomFilledButton(
          borderWidth: 0.1,
          borderColor: AppTheme.grey.withOpacity(0.2),
          fontSize:Responsive(context).isTabletLandscape?null: 13.sp,
          textColor: AppTheme.white,
          title: "Add New",
          disableButton: false,
          onPressed: () {
            EPrescriptionSelectionBottomSheet().ePrescriptionSelectionBottomSheet(context);
          },
        ),



      ],
    );
  }
}
