import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import '../../../../component/Button/CustomFillButton.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../utils/constants/AssetsImage.dart';
import '../../../../utils/constants/app_theme.dart';
import 'PrescriptionImageDownload.dart';

class ActiveBodyScreen extends StatelessWidget {
  ActiveBodyScreen({super.key});

  String imageUrl =
      "https://images.pexels.com/photos/159211/headache-pain-pills-medication-159211.jpeg";
  String prescriptionImage =
      "https://www.the-hospitalist.org/wp-content/uploads/2022/05/Hassprescription.jpg";

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Column(
          children: List.generate(
              prescriptionDataList.length,
              (index) => Container(
                    width: double.infinity,
                    padding: Responsive(context).isTabletLandscape? EdgeInsets.symmetric(horizontal: 15.sp,vertical: 5.sp):EdgeInsets.all(15.sp),
                    margin: EdgeInsets.symmetric(vertical: Responsive(context).isTabletLandscape? 3.sp:8.sp),
                    decoration: BoxDecoration(
                      color: AppTheme.white,
                      border: Border.all(color: AppTheme.grey.withOpacity(0.15), width: 0.8),
                      borderRadius: BorderRadius.all(Radius.circular(12.sp)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          prescriptionDataList[index]['name'],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          style: AppTextStyle().boldText().copyWith(fontSize: Responsive(context).isTabletLandscape? 10.sp:18.sp),
                        ),
                        SizedBox(
                          height: Responsive(context).isTabletLandscape? 1.sp:3.sp,
                        ),
                        Text(
                          prescriptionDataList[index]['description'],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          textAlign: TextAlign.start,
                          style: AppTextStyle().regularText().copyWith(
                              color: AppTheme.grey.withOpacity(0.8), fontSize: Responsive(context).isTabletLandscape? 8.sp:16.sp),
                        ),
                      ],
                    ),
                  )),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Container(
          padding: EdgeInsets.all(15.sp),
          decoration: BoxDecoration(
            color: AppTheme.white,
            border: Border.all(color: AppTheme.grey.withOpacity(0.15), width: 0.8),
            borderRadius: BorderRadius.all(Radius.circular(12.sp)),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Recommended Medicines",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.start,
              style: AppTextStyle().boldText().copyWith(fontSize: Responsive(context).isTabletLandscape? 12.sp:18.sp),
            ),
            Column(
              children: List.generate(
                  recommendedMedicinesList.length,
                  (index) => Container(
                        width: double.infinity,
                        height: Responsive(context).isTabletLandscape? 30.sp:72.sp,
                        padding: Responsive(context).isTabletLandscape? EdgeInsets.symmetric(horizontal: 15.sp,vertical: 2.sp):EdgeInsets.all(15.sp),
                        margin: EdgeInsets.symmetric(vertical: Responsive(context).isTabletLandscape? 3.sp:8.sp),
                        decoration: BoxDecoration(
                          color: AppTheme.grey.withOpacity(0.1),
                          border: Border.all(color: AppTheme.grey.withOpacity(0.15), width: 0.8),
                          borderRadius: BorderRadius.all(Radius.circular(12.sp)),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              height: Responsive(context).isTabletLandscape? 20.sp:40.sp,
                              width: 40.sp,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                                child: Image.network(
                                    imageUrl,fit: BoxFit.cover, ),
                              ),
                            ),
                            SizedBox(
                              width: 15.sp,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    recommendedMedicinesList[index]['name'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    style: AppTextStyle().mediumText().copyWith(fontSize: Responsive(context).isTabletLandscape? 10.sp:14.sp),
                                  ),
                                  Text(
                                    recommendedMedicinesList[index]['description'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    style: AppTextStyle().regularText().copyWith(
                                        color: AppTheme.grey.withOpacity(0.8),
                                        fontSize: Responsive(context).isTabletLandscape? 6.sp:12.sp),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
            )
          ]),
        ),
        SizedBox(
          height: Responsive(context).isTabletLandscape? 5.sp:10.sp,
        ),
        Container(
          padding: EdgeInsets.all(15.sp),
          decoration: BoxDecoration(
            color: AppTheme.white,
            border: Border.all(color: AppTheme.grey.withOpacity(0.15), width: 0.8),
            borderRadius: BorderRadius.all(Radius.circular(12.sp)),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Prescription image",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.start,
              style: AppTextStyle().boldText().copyWith(fontSize: Responsive(context).isTabletLandscape? 12.sp:18.sp),
            ),
            GridView.builder(
                shrinkWrap: true,
               // scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 8.sp),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, mainAxisSpacing: 15.sp),
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: InkWell(
                      onTap: () => PrescriptionImageDownload()
                          .prescriptionImageDownload(context, prescriptionImage: prescriptionImage),
                      child: SizedBox(
                        height: 108.sp,
                        width: 83.sp,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                          child: Image.network(
                              prescriptionImage,
                          fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                })
          ]),
        ),

        SizedBox(
          height: 20.sp,
        ),

        CustomFilledButton(
          disableButton: false,
          title: 'Edit',
          onPressed: () => {},
          imageButtonIcon: SvgPicture.asset(
            AssetsImages.editIcon,
            color: AppTheme.white,
            height: 18.sp,
            width: 18.sp,
          ),
        ),
        SizedBox(
          height: 20.sp,
        ),


      ],
    );
  }

  List prescriptionDataList = [
    {
      "name": "Diagnose",
      "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    },
    {"name": "Diagnotic", "description": "X-Ray - Magnetic resonance"},
  ];
  List recommendedMedicinesList = [
    {"name": "Duetact - 500gm", "description": "1 tablet - After Launch - for 7 days"},
    {"name": "Duetact - 500gm", "description": "1 tablet - After Launch - for 7 days"},
  ];
}
