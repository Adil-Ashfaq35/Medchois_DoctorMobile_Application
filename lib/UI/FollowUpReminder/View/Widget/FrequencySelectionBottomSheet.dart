import 'package:animate_do/animate_do.dart';
import 'package:doctor_app/Utils/Constants/RouteConstant.dart';
import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:provider/provider.dart';
import '../../../../component/BottomSheet/CustomBottomSheet.dart';
import '../../../../component/Button/CustomFillButton.dart';
import '../../../../component/Text/TextStyle.dart';
import '../../../../component/TextField/CustomTextField.dart';
import '../../../../utils/constants/app_theme.dart';
import '../../Provider/FollowUpProvider.dart';

List<String> frequency=[
  "Daily",
  "Monthly",
  "Weekly",
  "Yearly",
];

class FrequencySelectionBottomSheet {
  frequencySelectionBottomSheet(BuildContext context,
      {AnimationController? animationController}) {
    Size size = MediaQuery.of(context).size;
    Responsive(context).setOrientation(context);
    return CustomBottomSheet().customBottomSheet(context,
        Consumer<FollowUpProvider>(
            builder: (context, appointmentProvider, _) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  height:Responsive(context).isTabletLandscape? size.height*1:size.height * 0.6,
                  padding: EdgeInsets.symmetric(vertical: 10.sp),
                  decoration: BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(32.sp),
                          topLeft: Radius.circular(32.sp))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding:
                          EdgeInsets.symmetric(vertical: 8.sp, horizontal: 14.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Frequencey",
                                textAlign: TextAlign.center,
                                style:
                                AppTextStyle().mediumText().copyWith(fontSize:Responsive(context).isTabletLandscape? 12.sp:20.sp),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(Icons.close)),
                            ],
                          )),
                      SizedBox(
                        height: 0.025.sh,
                      ),
                Center(
                  child: VerticalSpinner(
                    items: frequency,
                    onItemSelected: (index) {
                      // Handle the selected item
                      print("Selected item: ${frequency[index]}");
                    },
                  )),
                      SizedBox(height:  Responsive(context).isTabletLandscape? 10.sp: 25.sp,),

                      Padding(
                        padding:  Responsive(context).isTabletLandscape? EdgeInsets.symmetric(horizontal: 20.sp):EdgeInsets.all(20.sp),
                        child: CustomFilledButton(
                          borderWidth: 0.1,
                          borderColor: AppTheme.grey.withOpacity(0.2),
                          fontSize: 13.sp,
                          // buttonGradients: const LinearGradient(
                          //     colors: [AppTheme.white, AppTheme.white]),

                          textColor: AppTheme.white,
                          title: "Save",
                          disableButton: false,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }), animationController: animationController);
  }
}

class VerticalSpinner extends StatefulWidget {
  final List<String> items;
  final Function(int) onItemSelected;

  VerticalSpinner({required this.items, required this.onItemSelected});

  @override
  _VerticalSpinnerState createState() => _VerticalSpinnerState();
}

class _VerticalSpinnerState extends State<VerticalSpinner> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return SizedBox(
      height:  Responsive(context).isTabletLandscape? 100.sp:230.sp,
      child: ListWheelScrollView(
        itemExtent:  Responsive(context).isTabletLandscape? 30.sp:50.sp, // Adjust the item height as needed
        diameterRatio: 1.5, // Adjust the diameter ratio for spacing
        physics: const BouncingScrollPhysics(),
        children: widget.items
            .map((item) => _buildItem(item, widget.items.indexOf(item)))
            .toList(),
        onSelectedItemChanged: (index) {
          setState(() {
            selectedIndex = index;
            widget.onItemSelected(index);
          });
        },
      ),
    );
  }

  Widget _buildItem(String item, int index) {
    return Center(
      child: Container(
        width: 0.8.sw,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: index == selectedIndex ? const Color(0xffEDF9F7) : Colors.transparent,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: index == selectedIndex ? AppTheme.appPrimaryColor:AppTheme.transparent,width:2.sp),
        ),
        child: Text(
          item,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize:  Responsive(context).isTabletLandscape? 12.sp:16.sp,
            color: index == selectedIndex ? AppTheme.black : AppTheme.lightTextColor,
            fontWeight: index == selectedIndex? FontWeight.bold:FontWeight.normal,
          ),
        ),
      ),
    );
  }
}