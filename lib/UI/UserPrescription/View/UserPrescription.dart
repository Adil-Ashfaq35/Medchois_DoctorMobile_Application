import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../component/AppTabBar/AppTabBar.dart';
import '../../../utils/constants/app_theme.dart';
import 'Widgets/ActiveBody.dart';
import 'Widgets/HistoryBody.dart';

class UserPrescriptionScreen extends StatefulWidget {
  const UserPrescriptionScreen({super.key});

  @override
  State<UserPrescriptionScreen> createState() => _UserPrescriptionScreenState();
}

class _UserPrescriptionScreenState extends State<UserPrescriptionScreen>
    with SingleTickerProviderStateMixin {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppTabBar(
            tabController: _tabController,
            buttonBackgroundColor: AppTheme.white,
            title: 'Prescription',
            tabs: const [
              SizedBox(
                width: double.infinity,
                child: Tab(
                  iconMargin: EdgeInsets.zero,
                  text: 'Active',
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Tab(
                  iconMargin: EdgeInsets.zero,
                  text: 'History',
                ),
              ),
            ],
          ),
          Expanded(
              child: Container(
            color: AppTheme.white,
            padding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(horizontal:15.sp):EdgeInsets.all(15.sp),
            child: TabBarView(
              controller: _tabController,
              children: [ActiveBodyScreen(), HistoryBodyScreen()],
            ),
          ))
        ],
      ),
    );
  }
}
