import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../component/Button/CustomFillButton.dart';
import '../../../component/Text/TextStyle.dart';
import '../../../utils/constants/app_theme.dart';
import 'Widgets/PatientProfileHeader.dart';
import 'Widgets/PatientDiagnosis.dart';
import 'Widgets/PatientSymptoms.dart';
import 'Widgets/PatientMedicalInfo.dart';

class PatientProfile extends StatefulWidget {
  PatientProfile({super.key});

  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> with SingleTickerProviderStateMixin {
  String imageUrl =
      "https://img.freepik.com/free-photo/portrait-smiling-young-woman-doctor-healthcare-medical-worker-pointing-fingers-left-showing-clini_1258-88433.jpg";
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
    Size size = MediaQuery.of(context).size;
    Responsive(context).setOrientation(context);
    return Scaffold(
      bottomNavigationBar: Container(
        height:Responsive(context).isTabletLandscape? 50.sp:120.sp,
        color: AppTheme.white,
        width: 1.sw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding:Responsive(context).isTabletLandscape?  EdgeInsets.symmetric(horizontal: 20.sp,vertical: 4.sp):  EdgeInsets.all(20.sp),
                    child: CustomFilledButton(
                      borderWidth: 0.1,
                      borderColor: AppTheme.grey.withOpacity(0.2),
                      // fontSize: 13.sp,
                      buttonGradients: const LinearGradient(
                          colors: [AppTheme.white, AppTheme.white]),
                      btnColor: AppTheme.white,
                      textColor: AppTheme.appPrimaryColor,
                      title: "Cancel",
                      disableButton: false,
                      onPressed: () {
                     //   Navigator.pop(context);

                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding:Responsive(context).isTabletLandscape? EdgeInsets.symmetric(horizontal: 20.sp,vertical: 4.sp):  EdgeInsets.all(20.sp),
                    child: CustomFilledButton(
                      borderWidth: 0.1,
                      borderColor: AppTheme.grey.withOpacity(0.2),
                      // fontSize: 13.sp,
                      textColor: AppTheme.white,
                      title: "Start Session",
                      disableButton: false,
                      onPressed: () {
                       // Navigator.pop(context);

                      },
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "Session duration 20 mins",
              textAlign: TextAlign.start,
              style:
              AppTextStyle().regularText().copyWith(
                  fontSize:Responsive(context).isTabletLandscape? 8.sp:12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.lightTextColor),
            ),
          ],
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: AppTheme.white,
            foregroundColor: AppTheme.white,
            shadowColor: AppTheme.white,
            elevation: 0,
            leading: const SizedBox(),
            pinned: false,
            stretchTriggerOffset: 1,
            expandedHeight:Responsive(context).isTabletLandscape? 150.sp:450.sp,
            flexibleSpace: PatientProfileHeader(
              tabController: _tabController,
              imageUrl: imageUrl,
            ),
          ),
        ],
        body: TabBarView(
          physics:  const BouncingScrollPhysics(),
          controller: _tabController,
          children: [
            PatientSymptomsScreen(),
            PatientMedicalInfo(
              imageUrl: imageUrl,
            ),
             const PatientDiagnosis(),
          ],
        ),
      ),
    );
  }
}
