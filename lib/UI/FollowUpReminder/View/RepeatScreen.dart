import 'package:doctor_app/UI/FollowUpReminder/Provider/FollowUpProvider.dart';
import 'package:doctor_app/Utils/Constants/RouteConstant.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../component/AppHeader/AppHeader.dart';
import '../../../component/Button/CustomFillButton.dart';
import '../../../component/Text/TextStyle.dart';

import '../../../utils/HelperFunction/Reponsive.dart';
import '../../../utils/constants/AssetsImage.dart';
import '../../../utils/constants/app_theme.dart';

class FollowUpRepeatScreen extends StatelessWidget {
  const FollowUpRepeatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);

    List<String> optionList =[
      "Never",
      "Every Day",
      "Every week",
      "Every 2 week",
      "Every Month"
    ];
    return   Consumer<FollowUpProvider>(builder: (context, followUpProvider, _) {
          return Scaffold(
            body: Stack(
              children: [
                AppHeader(
                  title: 'Repeat ',
                ),

                Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: Responsive(context).isTabletLandscape?42.sp:120.sp),
                    padding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp): EdgeInsets.all(20.sp),
                    decoration: BoxDecoration(color: AppTheme.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Responsive(context).isTabletLandscape?20.sp: 32.sp), topRight: Radius.circular(Responsive(context).isTabletLandscape?20.sp:32.sp))),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical:10.sp),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: optionList.length,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context,index){
                                return Padding(
                                  padding:  EdgeInsets.symmetric(vertical: Responsive(context).isTabletLandscape? 5.sp:20.sp,horizontal: 8.sp),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        optionList[index],
                                        textAlign: TextAlign.start,
                                        style: AppTextStyle()
                                            .regularText()
                                            .copyWith(fontSize: Responsive(context).isTabletLandscape?8.sp:14.sp,fontWeight: FontWeight.w600,color: AppTheme.appTextColor,),
                                      ),
                                      const Icon(Icons.circle_outlined),
                                    ],
                                  ),
                                );
                            }),



                            SizedBox(height: Responsive(context).isTabletLandscape? 10.sp:30.sp,),

                            /// custom
                            InkWell(
                              onTap: ()=>Navigator.pushNamed(context, RouteConstants.customRepeatScreen),
                              child: Container(
                                height: Responsive(context).isTabletLandscape? 25.sp:48.sp,
                                width: 1.sw,
                                decoration:  BoxDecoration(
                                 color: const Color(0xFFF5F7FA),
                                  borderRadius: BorderRadius.circular(16.sp),
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal:20.sp),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Custom",
                                        textAlign: TextAlign.start,
                                        style: AppTextStyle()
                                            .regularText()
                                            .copyWith(fontSize: Responsive(context).isTabletLandscape? 8.sp:14.sp,fontWeight: FontWeight.w500,color: AppTheme.appTextColor,),
                                      ),
                                      Icon(Icons.arrow_forward_ios,size: Responsive(context).isTabletLandscape? 8.sp:14.sp,color: AppTheme.lightTextColor,)
                                    ],
                                  ),
                                ),
                              ),
                            ),



                            SizedBox(height: 0.1.sh,),




                            CustomFilledButton(
                              height: Responsive(context).isTabletLandscape? null:46.sp,
                              disableButton: false,
                              title: 'Set Reminder',
                              onPressed: () {},
                            ),





                          ],
                        ),
                      ),
                    )
                )
              ],
            ),


          );
        }
    );
  }

  Widget followUpDateTime({required FollowUpProvider followUpProvider, required String label, required bool value,Function(bool)? onChanged, VoidCallback ?subTitleOnTap, required String subTitleText,required bool showSubTitle, required String icon, required Color bgColor}){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 30.sp,
                height: 30.sp,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: SvgPicture.asset(icon,color: AppTheme.white,fit: BoxFit.scaleDown,height:10.sp,width: 10.sp, ),
              ),
              SizedBox(width: 10.sp,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    textAlign: TextAlign.start,
                    style: AppTextStyle()
                        .regularText()
                        .copyWith(fontSize: 16.sp,fontWeight: FontWeight.w600,color: AppTheme.appTextColor,),
                  ),
                  showSubTitle?
                  InkWell(
                    onTap: subTitleOnTap,
                    child: Text(
                      subTitleText,
                      textAlign: TextAlign.start,
                      style: AppTextStyle()
                          .regularText()
                          .copyWith(fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppTheme.appPrimaryColor,),
                    ),
                  ):const SizedBox.shrink(),

                ],
              ),
            ],
          ),
          CupertinoSwitch(
            activeColor: AppTheme.blue,
            value: value,
            onChanged:onChanged,
          ),




        ],
      ),
    );
  }

}
