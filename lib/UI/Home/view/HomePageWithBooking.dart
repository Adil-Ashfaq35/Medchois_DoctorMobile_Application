import 'package:doctor_app/UI/Home/view/Widgets/PendingAppointmentWidget.dart';
import 'package:doctor_app/component/ShowToast/ShowToast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/HelperFunction/Reponsive.dart';
import '../../../utils/constants/AssetsImage.dart';
import '../../../utils/constants/app_theme.dart';
import 'Widgets/HeaderBookingScreen.dart';
import 'Widgets/Upcoming.dart';

class HomePageScreenWithBooking extends StatefulWidget {
  var data;
  HomePageScreenWithBooking({super.key, this.data});

  @override
  State<HomePageScreenWithBooking> createState() => _HomePageScreenWithBookingState();
}

class _HomePageScreenWithBookingState extends State<HomePageScreenWithBooking> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 300),(){
      if( widget.data!=null && widget.data["is_show_flash"]==true){
        ShowToast().showFlushBar(
          context,
          message: widget.data["message"],
          actionButtonOnTap: () {},
          actionButtonText: "Undo",
          leadingIcon: AssetsImages.verifiedIcon,
          showActionButton: true,
          showCloseButton: true,
        ).show(context);


      }
    });
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
    Responsive(context).setOrientation(context);
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers:[
            SliverAppBar(
              backgroundColor: AppTheme.white,
              elevation: 0,
              scrolledUnderElevation: 10,
              pinned: true,
              toolbarHeight: Responsive(context).isTabletLandscape? 60.sp:Responsive(context).isTabletPortrait?140.sp:121.sp,
              expandedHeight: 0.2.sh,
              flexibleSpace:  HeaderBookingScreen(
                tabController: _tabController,
                            ),
                          ),
            SliverFillRemaining(
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                controller: _tabController,
                children: const [
                  UpComingWidget(),
                  PendingAppointmentWidget(),
                ],
              ),
            )
          ],

        ),
      ),
    );
  }
}


