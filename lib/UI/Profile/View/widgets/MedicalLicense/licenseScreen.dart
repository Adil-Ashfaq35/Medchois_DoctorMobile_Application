import 'package:doctor_app/UI/Profile/View/widgets/profileSection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../component/AppHeader/AppHeader.dart';
import '../../../../../component/Text/TextStyle.dart';
import '../../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../../utils/constants/AssetsImage.dart';
import '../../../../../utils/constants/app_theme.dart';

class LicenseScreen extends StatefulWidget {
  const LicenseScreen({super.key});

  @override
  State<LicenseScreen> createState() => _LicenseScreenState();
}

class _LicenseScreenState extends State<LicenseScreen> {
  XFile? imageFile;
  final ImagePicker picker =ImagePicker();

  Future<void> pickImageFromGallery() async{
    try {
      final pickedImage= await picker.pickImage(source: ImageSource.gallery,
        maxHeight: 300.sp,
        maxWidth: 300.sp,
        imageQuality: 95,
      );
      setState(() {
        imageFile=pickedImage;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
  Future<void> pickImageFromCamera() async{
    try {
      final pickedImage= await picker.pickImage(source: ImageSource.camera,
        maxHeight: 300.sp,
        maxWidth: 300.sp,
        imageQuality: 95,
      );
      setState(() {
        imageFile=pickedImage;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppHeader(
            title: 'Medical License',
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: Responsive(context).isTabletLandscape?42.sp:120.sp),
            padding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(horizontal:20.sp, vertical: 10.sp): EdgeInsets.all(20.sp),
            decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.sp), topRight: Radius.circular(32.sp))),
            child: SingleChildScrollView(
              child: Column(
                children: [
                Container(
                  width: 327.sp,
                  height: 180.sp,
                  decoration: BoxDecoration(
                    color: const Color(0xff46BEE1),
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                  child:  Stack(
                    children: [
                      const Image(image: AssetImage(
                          AssetsImages.certificateImage,
                      )),
                      Positioned(
                        right: 8.sp,
                        top: 5.sp,
                        child: Container(
                          height: 28.sp,
                          width: 80.sp,
                          decoration:  BoxDecoration(
                            color: const Color(0xFFE8FCF0),
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                          child:   Center(
                            child: Text(
                              "Approved",
                              style: AppTextStyle().regularText().copyWith(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Color(0xFF15B655),),
                            ),
                          ),
                        ),
                      )
                      // Align(
                      //   alignment: Alignment.center,
                      //   child: Container(
                      //     width: 300.sp,
                      //     height: 150.sp,
                      //     decoration: const BoxDecoration(
                      //       color:Colors.white,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              
                  SizedBox(height: 30.sp,),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap:() async => await pickImageFromGallery(),
                        child: Container(
                          height: 50.sp,
                          width: 150.sp,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  height: 16.sp,
                                  width: 16.sp,
                                  image: const AssetImage(AssetsImages.uploadIcon),),
                                SizedBox(width: 10.sp,),
                                Text(
                                  "Upload files",
                                  style: AppTextStyle().boldText().copyWith(fontSize: 16.sp,fontWeight: FontWeight.w500,color: Color(0xFF2C91D4),fontFamily: 'AmpleSoft Pro'),
                                ),
              
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap:() async => await pickImageFromCamera(),
                        child: Container(
                          height: 50.sp,
                          width: 150.sp,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(10.r),
                            gradient:  const LinearGradient(
                              begin: Alignment(-0.75, 0.66),
                              end: Alignment(0.75, -0.66),
                              colors: [Color(0xFF6667AB), Color(0xFF63C0FD)],
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                               SvgPicture.asset(AssetsImages.cameraIconSvg,width: 16.sp,height: 16.sp,),
                                SizedBox(width: 10.sp,),
                                Text(
                                  "Capture image",
                                  style: AppTextStyle().boldText().copyWith(fontSize: 15.sp,fontWeight: FontWeight.w500,color: Colors.white,fontFamily: 'AmpleSoft Pro',),
                                ),
              
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              
                  SizedBox(height: 30.sp,),
                  const Text(
                    'Pdf, PNG, Jpg',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF898A8D),
                      fontSize: 12,
                      fontFamily: 'AmpleSoft Pro',
                      fontWeight: FontWeight.w500,
                      height: 0.12,
                      letterSpacing: -0.20,
                    ),
                  )
              
              
              
              
              
              
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
