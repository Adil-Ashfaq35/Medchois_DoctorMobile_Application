import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/app_theme.dart';

class CustomBottomSheet {
  customBottomSheet(BuildContext context, Widget child,
      {AnimationController? animationController,bool? showDragHandle,Color? bgColor,
      bool isDismissible = true,
      bool enableDrag = true}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(32.sp),topLeft: Radius.circular(32.sp) )
        ),
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        showDragHandle: showDragHandle?? false,
         backgroundColor: bgColor?? AppTheme.white,
        transitionAnimationController: animationController,
        builder: (builder) {
          return child;
        });
  }
}

class ExpandableBottomSheetContent extends StatefulWidget {
  final Widget child;
  final bool isExpandable;

  ExpandableBottomSheetContent({
    required this.child,
    required this.isExpandable,
  });

  @override
  _ExpandableBottomSheetContentState createState() =>
      _ExpandableBottomSheetContentState();
}

class _ExpandableBottomSheetContentState
    extends State<ExpandableBottomSheetContent> {
  double initialHeight = 0.6; // Initial height percentage
  double expandedHeight = 0.9; // Expanded height percentage
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.primaryDelta! < -4 && !isExpanded) {
          setState(() {
            isExpanded = true;
          });
        } else if (details.primaryDelta! > 4 && isExpanded) {
          setState(() {
            isExpanded = false;
          });
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: widget.isExpandable
            ? lerpDouble(
          MediaQuery.of(context).size.height * initialHeight,
          MediaQuery.of(context).size.height * expandedHeight,
          isExpanded ? 1.0 : 0.0,
        )!
            : null,
        child: widget.child,
      ),
    );
  }
}