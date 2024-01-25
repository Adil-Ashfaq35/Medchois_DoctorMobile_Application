import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../../component/AppTabBar/AppTabBar.dart';
import '../../../../../utils/constants/app_theme.dart';
import 'Widgets/PrivacyPolicy.dart';
import 'Widgets/Terms&Conditions.dart';

class AppPoliciesScreen extends StatefulWidget {
  const AppPoliciesScreen({super.key});

  @override
  State<AppPoliciesScreen> createState() => _AppPoliciesScreenState();
}

class _AppPoliciesScreenState extends State<AppPoliciesScreen> with SingleTickerProviderStateMixin {
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
            title: 'Our Policies',
            tabs: const [
              SizedBox(
                width: double.infinity,
                child: Tab(
                  iconMargin: EdgeInsets.zero,
                  text: 'Terms & Conditions',
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Tab(
                  iconMargin: EdgeInsets.zero,
                  text: 'Privacy Policy',
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
              children: [TermsAndConditions(), PrivacyPolicy()],
            ),
          ))
        ],
      ),
    );
  }
}
