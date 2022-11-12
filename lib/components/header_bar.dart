import 'dart:ui';

import 'package:be_mine/controllers/featured_items_controller.dart';
import 'package:be_mine/controllers/theme_controller.dart';
import 'package:be_mine/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart' as lottie;

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SplashController sc = Get.put(SplashController());
    final ThemeController theme = Get.put(ThemeController());
    return FlexibleSpaceBar(
      title: Container(
        margin: EdgeInsets.only(top: kMarginLarge),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Vancouver Trips ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: " Explore the city!"),
                ],
              ),
            ),
            SizedBox(width: kMarginLarge),
            lottie.Lottie.network(
              "https://assets3.lottiefiles.com/packages/lf20_xlawpi2p.json",
              height: 30,
            ),
          ],
        ),
      ),
      background: ImageFiltered(
        imageFilter: ImageFilter.blur(
          sigmaY: 5,
          sigmaX: 5,
          tileMode: TileMode.mirror,
        ),
        child: Image.network(
          sc.kSplashScreenSpaceBarBackground,
          fit: BoxFit.cover,
          color: theme.scaffoldBackground.value,
          colorBlendMode: BlendMode.overlay,
        ),
      ),
    );
  }
}
