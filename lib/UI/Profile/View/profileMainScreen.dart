import 'package:doctor_app/Routes/router_generator.dart';
import 'package:doctor_app/UI/Profile/View/widgets/Logout/LogoutBottomSheet.dart';
import 'package:doctor_app/UI/Profile/View/widgets/PersonalDetails/PersonalInformation/SelectLanguageBottomSheet.dart';
import 'package:doctor_app/UI/Profile/View/widgets/SwitchLanguage/SwitchLanguage.dart';
import 'package:doctor_app/UI/Profile/View/widgets/profileSection.dart';
import 'package:doctor_app/Utils/Constants/RouteConstant.dart';
import 'package:doctor_app/utils/HelperFunction/Reponsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../../component/Button/CustomFillButton.dart';
import '../../../component/Text/TextStyle.dart';
import '../../../utils/constants/AssetsImage.dart';
import '../../../utils/constants/app_theme.dart';

class ProfileMainScreen extends StatefulWidget {
  const ProfileMainScreen({super.key});

  @override
  State<ProfileMainScreen> createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
  ScrollController scrollController =ScrollController();
  final isCollapsed = false;
  bool enableInnerScroll = false;

  @override
  Widget build(BuildContext context) {
    Responsive(context).setOrientation(context);
    const collapsedBarHeight = 64.0;
    double expandedBarHeight =Responsive(context).isTabletLandscape? 50.sp:Responsive(context).isTabletPortrait? 130.sp: 300.sp;
    double stopScrollHeight = 190.sp;
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification && !Responsive(context).isTabletPortrait && !Responsive(context).isTabletLandscape) {
          if (scrollController.offset > stopScrollHeight) {
            // If the offset is less than the stopScrollHeight, prevent further scrolling up
            scrollController.jumpTo(stopScrollHeight);
          }
        }

        return false;
      },
      child: Stack(
        children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.81, -0.58),
              end: Alignment(-0.81, 0.58),
              colors: [Color(0xFF6667AB), Color(0xFF63C0FD)],
            ),
          ),
        ),
          Align(
            alignment: Alignment.center,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(-25/360),
              alignment: Alignment.centerLeft,
              child: Image.asset(
                AssetsImages.appLogo,
                width: 1.sw,
                height:450.sp,
                alignment: const Alignment(2, 5),
                fit: BoxFit.contain,
                color: AppTheme.white.withOpacity(0.06),
              ),
            ),
          ),
          CustomScrollView(
             controller:scrollController,
            slivers:[
               SliverAppBar(
                expandedHeight: expandedBarHeight.sp,
                collapsedHeight: collapsedBarHeight.sp,
                centerTitle: false,
                automaticallyImplyLeading: false,
                pinned: true,
                /// 1
                // title: Text("Title"),
                elevation: 0,
                /// 2
                backgroundColor: Colors.transparent,
                // leading: const BackButton(
                //   color: Colors.white,
                // ),
                /// 3
                flexibleSpace: FlexibleSpaceBar(
                  background:Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 104.sp,
                        height:Responsive(context).isTabletLandscape? 50.sp:104.sp,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage(AssetsImages.doctorImage))
                        ),
                      ),
                      Text(
                        "Eman Ahmed",
                        textAlign: TextAlign.center,
                        style: AppTextStyle()
                            .regularText()
                            .copyWith(fontSize:Responsive(context).isTabletLandscape? 15.sp:20.sp,fontWeight: FontWeight.w500, color: AppTheme.white),
                      ),
                      SizedBox(height:Responsive(context).isTabletLandscape? 3.sp:15.sp,),
                      Container(
                        padding: EdgeInsets.all(5.sp),
                        width: 0.85.sw,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.r)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 8.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             Row(
                               children: [
                                 SvgPicture.asset(
                                     height:Responsive(context).isTabletLandscape? 15.sp:24.sp, width: 24.sp,
                                     AssetsImages.moneyRecive),
                                 SizedBox(width: 10.sp,),
                                 Text(
                                   "1000 EGP",
                                   textAlign: TextAlign.center,
                                   style: AppTextStyle()
                                       .boldText()
                                       .copyWith(fontSize:Responsive(context).isTabletLandscape? 12.sp:16.sp,fontWeight: FontWeight.w700, color: AppTheme.black),
                                 ),
                               ],
                             ),
                              InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, RouteConstants.walletScreen);
                                },
                                child: Text(
                                  "Withdraw",
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle()
                                      .boldText()
                                      .copyWith(fontSize:Responsive(context).isTabletLandscape? 12.sp:16.sp,fontWeight: FontWeight.w700, color: const Color(0xFF2C91D4),),
                                ),
                              ),
      
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15.sp,),
                      Container(
                        width: 0.85.sw,
                        padding: EdgeInsets.all(10.sp),
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.1599999964237213),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                /// Reviews section
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "0",
                                          textAlign: TextAlign.center,
                                          style: AppTextStyle()
                                              .regularText()
                                              .copyWith(fontSize:Responsive(context).isTabletLandscape? 15.sp:20.sp,fontWeight: FontWeight.w700, color: AppTheme.white,),
                                        ),
                                        Text(
                                          "Reviews",
                                          textAlign: TextAlign.center,
                                          style: AppTextStyle()
                                              .regularText()
                                              .copyWith(fontSize:Responsive(context).isTabletLandscape? 10.sp:14.sp,fontWeight: FontWeight.w400, color: AppTheme.white,),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 15.sp,),
                                    Container(
                                      width: 1.0, // Adjust the width of the line
                                      height:Responsive(context).isTabletLandscape? 20.sp:35.sp, // Adjust the height of the line
                                      color: Colors.white, // Adjust the color of the line
                                    ),
                                  ],
                                ),
      
                                /// Sessions section
                             Row(
                               children: [
                                 Column(
                                   children: [
                                     Text(
                                       "0",
                                       textAlign: TextAlign.center,
                                       style: AppTextStyle()
                                           .regularText()
                                           .copyWith(fontSize:Responsive(context).isTabletLandscape? 12.sp:20.sp,fontWeight: FontWeight.w700, color: AppTheme.white,),
                                     ),
                                     Text(
                                       "Sessions",
                                       textAlign: TextAlign.center,
                                       style: AppTextStyle()
                                           .regularText()
                                           .copyWith(fontSize:Responsive(context).isTabletLandscape? 10.sp:14.sp,fontWeight: FontWeight.w400, color: AppTheme.white,),
                                     ),
                                   ],
                                 ),
                                 SizedBox(width: 15.sp,),
                                 Container(
                                   width: 1.0, // Adjust the width of the line
                                   height:Responsive(context).isTabletLandscape? 20.sp:35.sp, // Adjust the height of the line
                                   color: Colors.white, // Adjust the color of the line
                                 ),
                               ],
                             ),
      
      
                                /// Subscribers section
                               Row(
                                 children: [
                                   Column(
                                     children: [
                                       Text(
                                         "0",
                                         textAlign: TextAlign.center,
                                         style: AppTextStyle()
                                             .regularText()
                                             .copyWith(fontSize:Responsive(context).isTabletLandscape? 12.sp:20.sp,fontWeight: FontWeight.w700, color: AppTheme.white,),
                                       ),
                                       Text(
                                         "Subscribers",
                                         textAlign: TextAlign.center,
                                         style: AppTextStyle()
                                             .regularText()
                                             .copyWith(fontSize:Responsive(context).isTabletLandscape? 10.sp:14.sp,fontWeight: FontWeight.w400, color: AppTheme.white,),
                                       ),
                                     ],
                                   ),
                                 ],
                               )
                              ],
                            ),
      
      
      
                          ],
                        ),
                      ),
                      SizedBox(height:Responsive(context).isTabletLandscape? 10.sp:20.sp,),
                    ],
                  ) ,
      
                ),
              ),
      
      
              SliverToBoxAdapter(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Material(
                    elevation: 7,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(32.r),topRight: Radius.circular(32.r))
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 40.sp,horizontal: 5.sp),
                        child: Column(
                          children: [
                            ProfileSection(label: 'Personal details',onTap: (){
                              Navigator.pushNamed(context,RouteConstants.personalDetails);
                            },iconPath: AssetsImages.personUnselectedIcon,),
                            SizedBox(height:Responsive(context).isTabletLandscape? 0.sp: 20.sp,),
                            ProfileSection(label: 'Subscribers',onTap: (){
                              Navigator.pushNamed(context, RouteConstants.doctorSubscribersScreen);
                            },iconPath: AssetsImages.subscribers,),
                            SizedBox(height:Responsive(context).isTabletLandscape? 0.sp: 20.sp,),
                            ProfileSection(label: 'Previous Sessions',onTap: (){
                              Navigator.pushNamed(context, RouteConstants.previousSessionScreen);
                            },iconPath: AssetsImages.scheduleUnselectedIcon,),
                            SizedBox(height:Responsive(context).isTabletLandscape? 0.sp: 20.sp,),
                            ProfileSection(label: 'Languages',onTap: (){
                              SwitchLanguageBottomSheet().switchLanguageBottomSheet(context);
                            },iconPath: AssetsImages.translate,),
                            SizedBox(height:Responsive(context).isTabletLandscape? 0.sp: 20.sp,),
                            ProfileSection(label: 'Our Policies',onTap: (){
                              Navigator.pushNamed(context,RouteConstants.appPoliciesScreen);
                            },iconPath: AssetsImages.policyIcon,),
                            SizedBox(height:Responsive(context).isTabletLandscape? 0.sp: 20.sp,),
                            ProfileSection(label: 'About Medchois',onTap: (){},iconPath: AssetsImages.infoIcon,),
                            SizedBox(height:Responsive(context).isTabletLandscape? 5.sp: 50.sp,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 8.sp),
                              child: CustomFilledButton(
                                disableButton: false,
                                buttonGradients: const LinearGradient(
                                  colors: [
                                    AppTheme.white,
                                    AppTheme.white,
                                  ]
                                ),

                                onPressed: (){
                                  LogoutBottomSheet().logoutBottomSheet(context);
                                },
                                title: "Logout",
                                borderColor: const Color(0xFFE4E4E7),
                                textColor: Colors.red,
                                borderWidth: 1,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ]
          )
        ],
      ),
    );
  }
}


