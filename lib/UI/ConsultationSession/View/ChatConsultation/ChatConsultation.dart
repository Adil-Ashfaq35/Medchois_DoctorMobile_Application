import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Utils/Constants/AssetsImage.dart';
import '../../../../component/Button/CustomCircleButton.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../component/TextField/CustomTextField.dart';
import '../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../utils/constants/AppIcons.dart';
import '../../../../utils/constants/app_theme.dart';
import 'Widget/ChatCard.dart';
import 'Widget/ChatConsultationHeader.dart';


class ChatConsultationScreen extends StatefulWidget {
  const ChatConsultationScreen({super.key});

  @override
  State<ChatConsultationScreen> createState() => _ChatConsultationScreenState();
}

class _ChatConsultationScreenState extends State<ChatConsultationScreen> {
  TextEditingController chatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ChatConsultationHeader(),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top:Responsive(context).isTabletLandscape?45.sp: 135.sp),
            padding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp): EdgeInsets.all(20.sp),
            decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Responsive(context).isTabletLandscape?20.sp: 32.sp), topRight: Radius.circular(Responsive(context).isTabletLandscape?20.sp:32.sp))),
            child: Column(
              children: [
                Expanded(
                    child: ListView(
                  children: [
                    Text(
                      "Your chats and shared information are always protected",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: AppTextStyle()
                          .regularText()
                          .copyWith(color: AppTheme.grey.withOpacity(0.8), fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 6.sp),
                        margin: EdgeInsets.symmetric(vertical: 8.sp),
                        decoration: BoxDecoration(
                          color: AppTheme.white,
                          borderRadius: BorderRadius.all(Radius.circular(30.sp)),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.grey.withOpacity(0.15),
                              blurRadius: 6, // soften the shadow
                              spreadRadius: 2, //extend the shadow
                              offset: const Offset(
                                0.0, // Move to right 10  horizontally
                                10.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                        ),
                        child: Text(
                          "22 jan 2022 ",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: AppTextStyle()
                              .regularText()
                              .copyWith(color: AppTheme.black, fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Column(
                      children: List.generate(
                        10,
                        (index) => ChatCard(
                          index: index,
                        ),
                      ),
                    ),
                  ],
                )),
                Padding(
                  padding: EdgeInsets.only(top:Responsive(context).isTabletLandscape? 0.sp:Responsive(context).isTabletPortrait?8.sp:15.sp),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Stack(
                        children: [
                          Container(
                            height:Responsive(context).isTabletLandscape? 20.sp:Responsive(context).isTabletPortrait? 20.sp:45.sp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30.sp)),
                              boxShadow: [
                                BoxShadow(
                                  color: AppTheme.grey.withOpacity(0.3),
                                  blurRadius: 10, // soften the shadow
                                  spreadRadius: 5, //extend the shadow
                                  offset: const Offset(
                                    0.0, // Move to right 10  horizontally
                                    10.0, // Move to bottom 10 Vertically
                                  ),
                                )
                              ],
                            ),
                          ),
                          CustomTextFormField(
                            borderRadius: 30.sp,
                            controller: chatController,
                            borderColor: AppTheme.transparent,
                            fillColor: AppTheme.white,
                            contentPadding: EdgeInsets.symmetric(horizontal: 8.sp, vertical:Responsive(context).isTabletLandscape? 8.sp:Responsive(context).isTabletPortrait?6.sp:3.sp),
                            hintText: 'Message',
                            onChange: (value) => setState(() {}),
                            suffixWidget: SizedBox(
                              width: 70.sp,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    AssetsImages.paperClipIcon,
                                    height:Responsive(context).isTabletLandscape? 15.sp:Responsive(context).isTabletPortrait?20.sp:24.sp,
                                    width:Responsive(context).isTabletLandscape? 15.sp:Responsive(context).isTabletPortrait? 20.sp:24.sp,
                                  ),
                                  Image.asset(
                                    AssetsImages.cameraIcon,
                                    height:Responsive(context).isTabletLandscape? 15.sp:Responsive(context).isTabletPortrait?20.sp: 24.sp,
                                    width:Responsive(context).isTabletLandscape? 15.sp:Responsive(context).isTabletPortrait? 20.sp:24.sp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                      CustomCircleIconButton(
                        iconImage: chatController.text.isEmpty
                            ? Image.asset(AssetsImages.microphoneIcon)
                            : null,
                        icon: AppIcons.send,
                        iconColor: AppTheme.white,
                        height:Responsive(context).isTabletLandscape? 25.sp:Responsive(context).isTabletPortrait?40.sp:50.sp,
                        width: 50.sp,
                        // margin: EdgeInsets.only(left: 12.sp),
                        padding: EdgeInsets.all(7.sp),
                        boxColor: AppTheme.appPrimaryColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
