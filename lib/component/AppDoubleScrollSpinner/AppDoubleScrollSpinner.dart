import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/app_theme.dart';

class DualScrollSpinner extends StatefulWidget {
  final List<String> leftItems;
  final List<String> rightItems;
  final Function(int, int) onItemSelected;

  const DualScrollSpinner({super.key, required this.leftItems, required this.rightItems, required this.onItemSelected});

  @override
  _DualScrollSpinnerState createState() => _DualScrollSpinnerState();
}

class _DualScrollSpinnerState extends State<DualScrollSpinner> {
  int leftSelectedIndex = 0;
  int rightSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildListWheelScrollView(widget.leftItems, leftSelectedIndex, (index) {
              setState(() {
                leftSelectedIndex = index;
                widget.onItemSelected(leftSelectedIndex, rightSelectedIndex);
              });
            },

            ),
            SizedBox(width: 16.sp), // Adjust spacing as needed
            _buildListWheelScrollView(widget.rightItems, rightSelectedIndex, (index) {
              setState(() {
                rightSelectedIndex = index;
                widget.onItemSelected(leftSelectedIndex, rightSelectedIndex);
              });
            },
            ),
          ],
        ),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildListWheelScrollView(List<String> items, int selectedIndex, Function(int) onSelectedItemChanged) {
    return SizedBox(
      height:Responsive(context).isTabletLandscape? 120.sp:230.sp,
      width: 100.sp,
      child: ListWheelScrollView(
        itemExtent:Responsive(context).isTabletLandscape? 25.sp:50.sp,
        diameterRatio:Responsive(context).isTabletLandscape? 3: 1.7,
        physics: const FixedExtentScrollPhysics(),
        controller: FixedExtentScrollController(initialItem: selectedIndex),
        onSelectedItemChanged: onSelectedItemChanged,
        children: items.map((item) => _buildItem(item, items.indexOf(item) == selectedIndex)).toList(),
      ),
    );
  }
  Widget _buildItem(String item, bool isSelected) {
    return Center(
      child: Container(
        padding:  EdgeInsets.all(8.r),
        child: Text(
          item,
          style: TextStyle(
            fontSize: 16.sp,
            color: isSelected ? AppTheme.black : AppTheme.lightTextColor,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }


  Widget _buildIndicator() {
    return Container(
      height:Responsive(context).isTabletLandscape?30.sp: 50.sp,
      width: 0.85.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: const Color(0xffEDF9F7).withOpacity(0.2),
        border: Border.all(color: AppTheme.appPrimaryColor,width: 2.sp),
      ),
      alignment: Alignment.center,
      child:  Text(
        "",
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.black,
        ),
      ),
    );
  }
}