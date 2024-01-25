import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constants/app_theme.dart';
import 'Widgets/HeaderInComplete.dart';
import 'Widgets/No_Booking_widget.dart';

class HomePageScreenNoBooking extends StatefulWidget {
  const HomePageScreenNoBooking({super.key});

  @override
  State<HomePageScreenNoBooking> createState() => _HomePageScreenNoBookingState();
}

class _HomePageScreenNoBookingState extends State<HomePageScreenNoBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppTheme.homePageHeaderGradient),
        child: Stack(
          children: [
            CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  backgroundColor: AppTheme.white,
                  foregroundColor: AppTheme.white,
                  shadowColor: AppTheme.white,
                  elevation: 0,
                  forceMaterialTransparency: true,
                  scrolledUnderElevation: 10,
                  floating: false,
                  pinned: true,
                  snap: false,
                  toolbarHeight: 121.sp,
                  expandedHeight: 0.4.sh,
                 flexibleSpace: const HeaderInComplete(),
                ),
              ]
            ),

            Positioned(
              top: 290.sp,
              child:    const NoBookingWidget(),)

          ],
        ),
      ),
    );
  }
}


