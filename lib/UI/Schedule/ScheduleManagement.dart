import 'package:doctor_app/UI/Home/view/Widgets/PendingAppointmentWidget.dart';
import 'package:doctor_app/UI/Schedule/widget/CalenderBody.dart';
import 'package:doctor_app/UI/Schedule/widget/HeaderScheduleScreen.dart';
import 'package:doctor_app/UI/Schedule/widget/ScheduleBody.dart';
import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/HelperFunction/HelperFunction.dart';
import '../../../utils/constants/AssetsImage.dart';
import '../../../utils/constants/app_theme.dart';
import '../../component/AppHeader/AppHeaderWithTabs.dart';
import '../Home/view/Widgets/HeaderBookingScreen.dart';
import '../Home/view/Widgets/Upcoming.dart';


class ScheduleManagementScreen extends StatefulWidget {
  var data;
  ScheduleManagementScreen({super.key, this.data});

  @override
  State<ScheduleManagementScreen> createState() => _ScheduleManagementScreenState();
}

class _ScheduleManagementScreenState extends State<ScheduleManagementScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: AppTheme.white,
              floating: false,
              pinned: true,
              snap: false,
              toolbarHeight:Responsive(context).isTabletLandscape? 60.sp : 121.sp,
              expandedHeight: 0.2.sh,
              flexibleSpace: AppHeaderWithTabs(
                tabController: _tabController,
                title: "Schedule", showLeading: false,
                tabLabelNames: const ["Calender","Schedule"],
                tabsLength: 2,
              ),

            ),
            SliverFillRemaining(
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                controller: _tabController,
                children: const [
                  CalenderBody(),
                  ScheduleBody(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


