import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/app_theme.dart';

import 'Widget/DoctorSubscriberHeader.dart';
import 'Widget/MonthlySubscribersBody.dart';


class DoctorSubscribersScreen extends StatefulWidget {
  const DoctorSubscribersScreen({super.key});

  @override
  State<DoctorSubscribersScreen> createState() => _DoctorSubscribersScreenState();
}

class _DoctorSubscribersScreenState extends State<DoctorSubscribersScreen> with SingleTickerProviderStateMixin {
  String imageUrl =
      "https://img.freepik.com/free-photo/portrait-smiling-young-woman-doctor-healthcare-medical-worker-pointing-fingers-left-showing-clini_1258-88433.jpg";
  TabController? _tabController;
  double collapsedBarHeight = 64.0;
  double stopScrollHeight = 100.sp;
  bool isInnerScrollEnable=false;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  ScrollController scrollController =ScrollController();

  @override
  Widget build(BuildContext context) {

    Responsive(context).setOrientation(context);
    return Scaffold(
      body:
      Responsive(context).isTabletLandscape?
      NestedScrollView(
        controller: scrollController,
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: AppTheme.white,
              foregroundColor: AppTheme.white,
              shadowColor: AppTheme.white,
              elevation: 0,
              collapsedHeight: collapsedBarHeight,
              leading: const SizedBox(),
              pinned: Responsive(context).isTabletLandscape ? true : false,
              stretchTriggerOffset: 1,
              expandedHeight: Responsive(context).isTabletLandscape ? 140.sp : 250.sp,
              flexibleSpace: DoctorSubscriberHeader(
                tabController: _tabController,
                imageUrl: imageUrl,
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            MonthlySubscribersBody(),
            MonthlySubscribersBody(),
            MonthlySubscribersBody(),
          ],
        ),
      ):
      CustomScrollView(
        physics:  NeverScrollableScrollPhysics(),
        slivers:[
          SliverAppBar(
            backgroundColor: AppTheme.white,
            foregroundColor: AppTheme.white,
            shadowColor: AppTheme.white,
            elevation: 0,
             collapsedHeight: collapsedBarHeight,
            leading: const SizedBox(),
            pinned: false,
            stretchTriggerOffset: 1,
            expandedHeight:Responsive(context).isTabletLandscape? 140.sp: 250.sp,
            flexibleSpace: DoctorSubscriberHeader(
              tabController: _tabController,
              imageUrl: imageUrl,
            ),
          ),
          SliverFillRemaining(
            child: Container(
                height: MediaQuery.of(context).size.height - collapsedBarHeight, // Adjust the height as needed
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    MonthlySubscribersBody(),
                    MonthlySubscribersBody(),
                    MonthlySubscribersBody(),
                  ],
                )),
          )


        ],
      ),
    );
  }
}
