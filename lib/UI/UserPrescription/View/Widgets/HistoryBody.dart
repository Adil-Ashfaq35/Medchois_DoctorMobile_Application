import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../component/Text/TextStyle.dart';
import '../../../../utils/constants/AppIcons.dart';
import '../../../../utils/constants/app_theme.dart';
import 'HistoryDetailBottomSheet.dart';


class HistoryBodyScreen extends StatelessWidget {
  HistoryBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return ListView(
      physics: BouncingScrollPhysics(),
      children: List.generate(
          historyDataList.length,
          (index) => InkWell(
                onTap: () => HistoryDetailBottomSheet()
                    .historyDetailBottomSheet(context, date: historyDataList[index]['date']),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            historyDataList[index]['name'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            style: AppTextStyle().regularText().copyWith(
                                color: AppTheme.grey.withOpacity(0.8), fontSize:Responsive(context).isTabletLandscape?8.sp:12.sp),
                          ),
                          Text(
                            historyDataList[index]['date'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            style: AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 10.sp:14.sp),
                          ),
                        ],
                      ),
                      Icon(
                        AppIcons.arrowForward,
                        color: AppTheme.grey.withOpacity(0.5),
                        size:Responsive(context).isTabletLandscape? 10.sp:22.sp,
                      )
                    ],
                  ),
                ),
              )),
    );
  }

  List historyDataList = [
    {"name": "Session in", "date": "20 May, 2021"},
    {"name": "Session in", "date": "25 May, 2021"},
    {"name": "Session in", "date": "30 May, 2021"},
    {"name": "Session in", "date": "20 June, 2021"},
    {"name": "Session in", "date": "20 Jul, 2021"},
    {"name": "Session in", "date": "20 Sep, 2021"},
    {"name": "Session in", "date": "20 Dec, 2021"},
  ];
}
