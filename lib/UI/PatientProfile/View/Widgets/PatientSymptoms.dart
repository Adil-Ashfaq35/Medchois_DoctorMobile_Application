import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:doctor_app/utils/constants/AssetsImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../utils/constants/app_theme.dart';


class PatientSymptomsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Container(
      color: AppTheme.appScreenBackgroundColor,
      alignment: Alignment.topCenter,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: Responsive(context).isTabletLandscape? 2.sp:10.sp,),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.sp,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                      child: Text(
                        Responsive(context).isTabletLandscape?
                        "I have acne on my skin and dark spots on around the nose":
                        "I have acne on my skin and dark spots on around the\nnose",
                        textAlign: TextAlign.start,
                        style:
                        AppTextStyle().regularText().copyWith(
                            fontSize: Responsive(context).isTabletLandscape? 8.sp:12.sp,
                            color: AppTheme.lightTextColor),
                      ),
                    ),
                    SizedBox(height:Responsive(context).isTabletLandscape? 2.sp:10.sp,),
                    const Divider(color:  AppTheme.borderColor),

                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.sp,vertical:Responsive(context).isTabletLandscape? 2.sp:10.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            "Attached files",
                            textAlign: TextAlign.start,
                            style:
                            AppTextStyle().regularText().copyWith(
                                fontSize:Responsive(context).isTabletLandscape? 8.sp:14.sp,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.blackColor),
                          ),
                          SizedBox(height:Responsive(context).isTabletLandscape? 8.sp:20.sp,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             Row(
                               children: [
                                 SvgPicture.asset(
                                     AssetsImages.jpgIcon
                                 ),
                                SizedBox(width: 5.sp,),
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text(
                                       "File Name.PDF",
                                       textAlign: TextAlign.start,
                                       style:
                                       AppTextStyle().regularText().copyWith(
                                           fontSize:Responsive(context).isTabletLandscape? 8.sp:12.sp,
                                           fontWeight: FontWeight.w500,
                                           color: AppTheme.blackColor),
                                     ),
                                     Text(
                                       "1.5 MB",
                                       textAlign: TextAlign.start,
                                       style:
                                       AppTextStyle().regularText().copyWith(
                                           fontSize:Responsive(context).isTabletLandscape? 8.sp:12.sp,
                                           fontWeight: FontWeight.w500,
                                           color: AppTheme.lightTextColor),
                                     ),
                                   ],
                                 ),
                               ],
                             ),

                              Container(
                                height:Responsive(context).isTabletLandscape? 10.sp:30.sp,
                                width:Responsive(context).isTabletLandscape? 10.sp:30.sp,
                                decoration: const BoxDecoration(
                                  color: Color(0xffd3f8f5),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.visibility_outlined,color: AppTheme.primaryColor,),
                              )
                            ],
                          ),
                          SizedBox(height:Responsive(context).isTabletLandscape? 10.sp: 20.sp,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      AssetsImages.jpgIcon
                                  ),
                                  SizedBox(width: 5.sp,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "File Name.PDF",
                                        textAlign: TextAlign.start,
                                        style:
                                        AppTextStyle().regularText().copyWith(
                                            fontSize:Responsive(context).isTabletLandscape? 8.sp:12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppTheme.blackColor),
                                      ),
                                      Text(
                                        "1.5 MB",
                                        textAlign: TextAlign.start,
                                        style:
                                        AppTextStyle().regularText().copyWith(
                                            fontSize:Responsive(context).isTabletLandscape? 8.sp:12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppTheme.lightTextColor),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              Container(
                                height:Responsive(context).isTabletLandscape? 10.sp:30.sp,
                                width:Responsive(context).isTabletLandscape? 10.sp:30.sp,
                                decoration: BoxDecoration(
                                  color: Color(0xffd3f8f5),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.visibility_outlined,color: AppTheme.primaryColor,),
                              )
                            ],
                          ),
                          SizedBox(height:Responsive(context).isTabletLandscape? 5.sp:20.sp,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      AssetsImages.jpgIcon
                                  ),
                                  SizedBox(width: 5.sp,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "File Name.PDF",
                                        textAlign: TextAlign.start,
                                        style:
                                        AppTextStyle().regularText().copyWith(
                                            fontSize:Responsive(context).isTabletLandscape? 8.sp:12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppTheme.blackColor),
                                      ),
                                      Text(
                                        "1.5 MB",
                                        textAlign: TextAlign.start,
                                        style:
                                        AppTextStyle().regularText().copyWith(
                                            fontSize:Responsive(context).isTabletLandscape? 8.sp:12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppTheme.lightTextColor),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              Container(
                                height:Responsive(context).isTabletLandscape? 10.sp:30.sp,
                                width:Responsive(context).isTabletLandscape? 10.sp:30.sp,
                                decoration: BoxDecoration(
                                  color: Color(0xffd3f8f5),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.visibility_outlined,color: AppTheme.primaryColor,),
                              )
                            ],
                          ),

                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
          );
  }

  List aboutDoctorData = [
    {
      "name": 'Experience (10 Years)',
      "data": [
        {
          "name": 'Consultant at Nutrition King Fahd Hospital',
          "description": 'Sudia Arabia',
          "countryCode": 'sa',
        },
        {
          "name": 'Consultant at Nutrition Elkaser elainy',
          "description": 'Egypt',
          "countryCode": 'eg',
        },
        {
          "name": 'Consultant at Nutrition',
          "description": 'USA',
          "countryCode": 'us',
        }
      ]
    },
    {
      "name": 'Certificates',
      "data": [
        {
          "name": 'Master in Nutrition ',
          "description": 'Coursera',
          "countryCode": '',
          "image":
              'https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Coursera-Logo_600x600.svg/2048px-Coursera-Logo_600x600.svg.png',
        },
        {
          "name": 'Plant-based',
          "description": 'Coursera',
          "countryCode": '',
          "image":
              'https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Coursera-Logo_600x600.svg/2048px-Coursera-Logo_600x600.svg.png',
        },
      ]
    },
    {
      "name": 'Education',
      "data": [
        {
          "name": 'bachelorin medicine and surgery',
          "description": 'Cairo University Feb 2005 - Feb 2012',
          "countryCode": '',
          "image": 'https://upload.wikimedia.org/wikipedia/en/b/b9/Cairo_University_Crest.png',
        },
      ]
    },
    {
      "name": 'Language',
      "data": [
        {
          "name": 'Arabic, English, Franch',
          "description": '',
          "countryCode": '',
          "image": 'https://upload.wikimedia.org/wikipedia/en/b/b9/Cairo_University_Crest.png',
        },
      ]
    },
  ];
}
