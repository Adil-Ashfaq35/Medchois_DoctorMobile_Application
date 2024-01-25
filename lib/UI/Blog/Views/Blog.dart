import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../Utils/Constants/RouteConstant.dart';
import '../../../component/AppTabBar/AppTabBar.dart';
import '../../../component/Button/CustomCircleButton.dart';
import '../../../utils/constants/AssetsImage.dart';
import '../../../utils/constants/app_theme.dart';
import '../../Home/Provider/HomeProvider.dart';
import 'Widgets/BlogBody.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> with SingleTickerProviderStateMixin {
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
    Responsive(context).setOrientation(context);
    return Consumer<HomeProvider>(builder: (context, homeProvider, _) {
      return Column(
        children: [
          AppTabBar(
            tabController: _tabController,
            title: 'Blog',
            onTap: () => homeProvider.setScreenIndex(0),
            actionWidget: CustomCircleIconButton(
              height:  Responsive(context).isTabletLandscape? 20.sp:null,
              iconImage: SvgPicture.asset(
                AssetsImages.editIcon,
                color: AppTheme.appPrimaryColor,
                height:Responsive(context).isTabletLandscape? 5.sp:null,
                fit:Responsive(context).isTabletLandscape? BoxFit.cover:BoxFit.none,
              ),
              padding: EdgeInsets.all(8.sp),
              onTap: () => Navigator.of(context).pushNamed(RouteConstants.addArticle),
            ),
            tabs: const [
              SizedBox(
                width: double.infinity,
                child: Tab(
                  iconMargin: EdgeInsets.zero,
                  text: 'All',
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Tab(
                  iconMargin: EdgeInsets.zero,
                  text: 'Pending',
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Tab(
                  iconMargin: EdgeInsets.zero,
                  text: 'Published',
                ),
              ),
            ],
          ),
          Expanded(
              child: Container(
            color: AppTheme.white,
                padding:Responsive(context).isTabletLandscape? EdgeInsets.only(left: 15.sp,right: 15.sp,top: 15.sp,bottom: 0.sp): EdgeInsets.all(15.sp),
            child: TabBarView(
              controller: _tabController,
              children: [BlogBodyScreen(), BlogBodyScreen(), BlogBodyScreen()],
            ),
          ))
        ],
      );
    });
  }
}
