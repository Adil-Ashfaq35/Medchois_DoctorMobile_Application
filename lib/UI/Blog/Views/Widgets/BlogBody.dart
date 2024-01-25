import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../Utils/Constants/RouteConstant.dart';
import '../../../../utils/HelperFunction/Reponsive.dart';
import '../../../../utils/constants/app_theme.dart';
import 'BlogBodyCard.dart';


class BlogBodyScreen extends StatelessWidget {
  BlogBodyScreen({super.key});

  String imageUrl =
      "https://images.unsplash.com/photo-1512069772995-ec65ed45afd6?q=80&w=1937&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
        children: List.generate(
            10,
            (index) =>
                BlogBodyCard(
                      imageUrl: imageUrl,
                      index: index,
                      onTap: () => Navigator.of(context).pushNamed(RouteConstants.blogArticleDetailsScreen),
                    ),
            ));
  }
}
