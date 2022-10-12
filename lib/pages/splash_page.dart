import 'package:be_mine/components/app/app_bar.dart';
import 'package:be_mine/components/box/featured_box.dart';
import 'package:be_mine/components/box/map_box.dart';

import 'package:be_mine/controllers/splash_controller.dart';
import 'package:be_mine/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeaturedPage extends StatelessWidget {
  FeaturedPage({Key? key}) : super(key: key);

  final ThemeController theme = Get.put(ThemeController());
  final SplashController sc = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.scaffoldBackground.value,
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          AppBarContainer(
            appBarWidget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Vancouver ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: theme.textColor.value,
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: "Featured places!",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: theme.textColor.value,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: false,
            child: Obx(
              () => Container(
                color: theme.scaffoldBackground.value,
                child: Center(
                  child: Column(
                    children: [
                      MapBox(),
                      FeatureBox(),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
