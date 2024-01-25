import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../component/AppTabBar/AppTabBar.dart';
import '../../../../utils/constants/app_theme.dart';
import 'Widget/ActiveBody.dart';
import 'Widget/HistoryBody.dart';


class ManualAddPrescriptionMainScreen extends StatefulWidget {
  const ManualAddPrescriptionMainScreen({super.key});

  @override
  State<ManualAddPrescriptionMainScreen> createState() => _ManualAddPrescriptionMainScreenState();
}

class _ManualAddPrescriptionMainScreenState extends State<ManualAddPrescriptionMainScreen>
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
                padding: EdgeInsets.all(15.sp),
                child: TabBarView(
                  controller: _tabController,
                  children: const [ActiveBodyMainScreen(), HistoryBodyMainScreen()],
                ),
              ))
        ],
      ),
    );
  }
}
