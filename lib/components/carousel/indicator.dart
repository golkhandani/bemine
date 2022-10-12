import 'package:be_mine/controllers/splash_controller.dart';
import 'package:be_mine/controllers/theme_controller.dart';
import 'package:be_mine/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSliderIndicator extends StatelessWidget {
  CarouselSliderIndicator({
    Key? key,
  }) : super(key: key);

  final SplashController sc = Get.put(SplashController());
  final ThemeController theme = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kMediumMargin,
      child: Obx(
        () => AnimatedSmoothIndicator(
          activeIndex: sc.itemIndex.value,
          count: sc.featuredPlaces.length,
          effect: WormEffect(
            dotHeight: 8,
            dotWidth: 8,
            type: WormType.normal,
            dotColor: theme.featuredSliderIndicatorDeactive.value,
            activeDotColor: theme.featuredSliderIndicatorActive.value,
            strokeWidth: 1,
          ),
        ),
      ),
    );
  }
}
