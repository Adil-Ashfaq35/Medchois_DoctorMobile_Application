import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../Utils/Constants/AssetsImage.dart';
import '../../../../component/AppNetworkImage/AppNetworkImage.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../utils/constants/app_theme.dart';


class BlogBodyCard extends StatelessWidget {
  String? imageUrl;
  int index;
  void Function()? onTap;

  BlogBodyCard({this.imageUrl, this.onTap, required this.index});

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        height:Responsive(context).isTabletLandscape? 75.sp:112.sp,
        margin: EdgeInsets.symmetric(vertical: 8.sp),
        // padding:EdgeInsets.all(15.sp),
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.grey.withOpacity(0.3), width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(12.sp)),
        ),
        child: Slidable(
          key:  ValueKey(index.toString()),
          direction: Axis.horizontal,
          endActionPane:  ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                // An action can be bigger than the others.
                flex: 1,
                onPressed: (context){

                },
                backgroundColor: const Color(0xFF63C0FD),
                foregroundColor: AppTheme.whiteColor,
                borderRadius: BorderRadius.circular(8.sp),
                icon: Icons.edit,
              ),
              SlidableAction(
                flex: 1,
                onPressed: (_){
                  // DeleteConfirmationBottomSheet().deleteConfirmationBottomSheet(context,index: index);
                },
                backgroundColor: AppTheme.red,
                foregroundColor: Colors.white,
                borderRadius: BorderRadius.circular(8.sp),
                icon: Icons.delete_forever_outlined,
              ),
            ],
          ),
          closeOnScroll: true,
          child: Padding(
            padding: EdgeInsets.all(Responsive(context).isTabletLandscape?10.sp:20.sp),
            child: Row(
              children: [
                SizedBox(
                  height: 83.sp,
                  width: 83.sp,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                    child: appNetworkImage(imageUrl, double.infinity, double.infinity, BoxFit.cover),
                  ),
                ),
                SizedBox(
                  width: 15.sp,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pending",
                        style: AppTextStyle()
                            .regularText()
                            .copyWith(fontSize:Responsive(context).isTabletLandscape?8.sp: 14.sp, color:  Color(0xFFE5AB45)),
                      ),
                      Text(
                        "12 home trends from 2020 that need to disappear",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: AppTextStyle()
                            .mediumText()
                            .copyWith(color: AppTheme.black, fontSize:Responsive(context).isTabletLandscape? 10.sp:12.sp),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "10 Mins read . OCT 9, 2019 ",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppTextStyle()
                                .regularText()
                                .copyWith(color: AppTheme.grey.withOpacity(0.8), fontSize:Responsive(context).isTabletLandscape? 7.sp:10.sp),
                          ),
                          SizedBox(
                            width: 2.sp,
                          ),
                          // Row(
                          //   children: [
                          //     Image.asset(
                          //       AssetsImages.exportIcon,
                          //       color: AppTheme.grey,
                          //       height: 18.sp,
                          //       width: 18.sp,
                          //     ),
                          //     SizedBox(
                          //       width: 15.sp,
                          //     ),
                          //     Image.asset(
                          //       AssetsImages.saveIcon,
                          //       color: AppTheme.grey,
                          //       height: 18.sp,
                          //       width: 18.sp,
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
