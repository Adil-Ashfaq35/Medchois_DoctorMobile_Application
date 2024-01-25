import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../component/AppTabBar/AppTabBar.dart';
import '../../../../../../utils/constants/app_theme.dart';
import 'Certificate.dart';
import 'EducationScreen.dart';
import 'Experience.dart';


class MedicalProfile extends StatefulWidget {
  const MedicalProfile({super.key});

  @override
  State<MedicalProfile> createState() => _MedicalProfileState();
}

class _MedicalProfileState extends State<MedicalProfile> with SingleTickerProviderStateMixin {
  TabController? _tabController;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Column(
            children: [
              AppTabBar(
                tabController: _tabController,
                title: 'Medical Profile',
               // onTap: () => homeProvider.setScreenIndex(0),
                tabs: const [
                  SizedBox(
                    width: double.infinity,
                    child: Tab(
                      iconMargin: EdgeInsets.zero,
                      text: 'Experience',
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Tab(
                      iconMargin: EdgeInsets.zero,
                      text: 'Education',
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Tab(
                      iconMargin: EdgeInsets.zero,
                      text: 'Certificates',
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
                      children: const [Experience(), EducationScreen(), CertificateScreen()],
                    ),
                  ))
            ],
      ),
    );
  }
}
