
import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:doctor_app/utils/constants/AssetsImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constants/app_theme.dart';
import '../../Blog/Views/Blog.dart';
import '../../Profile/View/profileMainScreen.dart';
import '../../Schedule/ScheduleManagement.dart';
import 'HomePageNoBooking.dart';
import 'HomePageWithBooking.dart';

class NavMainScreen extends StatefulWidget {
  var data;

  NavMainScreen({super.key,this.data});

  @override
  State<NavMainScreen> createState() => _NavMainScreenState();
}

class _NavMainScreenState extends State<NavMainScreen> {
  int currentIndex = 0;
  final GlobalKey _bottomNavBarKey = GlobalKey();
  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Scaffold(
      body: _getPage(currentIndex),
      bottomNavigationBar: SizedBox(
        height:Responsive(context).isTabletLandscape?  20.sp:null,
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
            key: _bottomNavBarKey,
          currentIndex: currentIndex,
          useLegacyColorScheme: true,
          showUnselectedLabels: true,
          unselectedItemColor: const Color(0xFF92929F),
          selectedItemColor: const Color(0xFF2C91D4),
            unselectedLabelStyle: const TextStyle(
            color:  Color(0xFF92929F),
        ),
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFF2C91D4),
        ),
          items: [
            BottomNavigationBarItem(
              backgroundColor: AppTheme.white,
              icon:  SvgPicture.asset(
                  height:Responsive(context).isTabletLandscape? 10.sp:24.sp, width: 24.sp,
                  AssetsImages.homeUnSelectedIcon),
              label: "Home",
              activeIcon:  SvgPicture.asset(AssetsImages.homeSelected),
            ),
            BottomNavigationBarItem(
              icon:  SvgPicture.asset(
                  height:Responsive(context).isTabletLandscape? 10.sp: 24.sp, width: 24.sp,
                  AssetsImages.scheduleUnselectedIcon),
              label: "Schedule",
              activeIcon:  SvgPicture.asset(AssetsImages.calendarSelected),
            ),
            BottomNavigationBarItem(
              icon:  SvgPicture.asset(
                  height:Responsive(context).isTabletLandscape? 10.sp: 24.sp, width: 24.sp,
                  AssetsImages.bookUnselectedIcon),
              label: "Blog",
              activeIcon:  SvgPicture.asset(AssetsImages.bookSelectedIcon),
            ),
            BottomNavigationBarItem(
              icon:  SvgPicture.asset(
                  height:Responsive(context).isTabletLandscape? 10.sp:24.sp, width: 24.sp,
                  AssetsImages.personUnselectedIcon),
              label: "Profile",
              activeIcon:  SvgPicture.asset(AssetsImages.personOutlineSelected),
            ),

          ],
            onTap: (index) {
                setState(() {
                  currentIndex = index;
                  widget.data["is_show_flash"]=false;
                });}

        ),
      ),
    );
  }

  Widget _getPage(int index) {

    switch (index) {
      case 0:
        return   HomePageScreenWithBooking(data: {"is_show_flash":widget.data["is_show_flash"], "message":widget.data["message"]},);
      case 1:
        return   ScheduleManagementScreen();
      case 2:
        return   const BlogScreen();
        case 3:
        return   const ProfileMainScreen();
      default:
        return const Text("Error");
    }
  }




}
