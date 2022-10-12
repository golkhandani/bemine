import 'dart:ui';

import 'package:be_mine/controllers/app_bar_controller.dart';
import 'package:be_mine/controllers/theme_controller.dart';
import 'package:be_mine/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarContainer extends StatelessWidget {
  AppBarContainer({Key? key, required this.appBarWidget}) : super(key: key);
  final ThemeController theme = Get.put(ThemeController());
  final AppBarController abc = Get.put(AppBarController());

  final Widget appBarWidget;
  @override
  Widget build(BuildContext context) {
    final appBarHeight = kAppBarContainer.floorToDouble();
    return SliverAppBar(
      floating: true,
      toolbarHeight: appBarHeight,
      backgroundColor:
          theme.navigationBarBackgroundColor.value.withOpacity(0.2),
      elevation: 6,
      pinned: true,
      foregroundColor: theme.textColor.value,
      flexibleSpace: ClipRRect(
        child: Container(
          color: theme.navigationBarBackgroundColor.value.withOpacity(0.2),
          child: BackdropFilter(
            filter: kblurFilter,
            child: Container(
              padding: const EdgeInsets.only(top: 48),
              child: Center(child: appBarWidget),
            ),
          ),
        ),
      ),
      // flexibleSpace: const HeaderBar(),
    );
  }
}
