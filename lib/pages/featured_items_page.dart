import 'dart:ui';

import 'package:be_mine/components/header_bar.dart';
import 'package:be_mine/components/map_container.dart';
import 'package:be_mine/controllers/featured_items_controller.dart';
import 'package:be_mine/controllers/theme_controller.dart';
import 'package:be_mine/custom_carousel_slider.dart';
import 'package:be_mine/pages/trip_detail_page.dart';
import 'package:be_mine/shared/constants.dart';
import 'package:be_mine/shared/fake_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:progressive_image/progressive_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  final ThemeController theme = Get.put(ThemeController());
  final SplashController sc = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    sc.changemapCenterItem(tripList[0].latLng);

    return Scaffold(
      backgroundColor: theme.scaffoldBackground.value,
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          const AppBar(),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: false,
            child: Obx(
              () => Container(
                color: theme.scaffoldBackground.value,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: kMarginSmall),
                      const MapBox(),
                      const VerticalFeatureCarousel(),
                      const SizedBox(height: 80)
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

class VerticalFeatureCarousel extends StatelessWidget {
  const VerticalFeatureCarousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = CarouselController();
    ThemeController theme = Get.put(ThemeController());
    SplashController sc = Get.put(SplashController());
    return Expanded(
      child: Column(
        children: [
          CarouselSliderIndicator(),
          CarouselSlider.builder(
            options: CarouselOptions(
                enlargeCenterPage: true,
                viewportFraction: 0.96,
                autoPlayCurve: Curves.fastOutSlowIn,
                initialPage: sc.itemIndex.value,
                onPageChanged: (index, reason) {
                  sc.changeItem(index);
                  sc.changemapCenterItem(tripList[index].latLng);
                }),
            carouselController: carouselController,
            itemCount: tripList.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              return Stack(
                children: [
                  Hero(
                    tag: "tripThumbnailHeroTag" + itemIndex.toString(),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(
                          () => TripDetailPage(
                            thumbnail: tripList[itemIndex].image,
                            heroTag:
                                "tripThumbnailHeroTag" + itemIndex.toString(),
                          ),
                          transition: Transition.fadeIn,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: kRoundCorner,
                          color: Colors.black,
                        ),
                        padding: EdgeInsets.all(kMarginSmall - 2),
                        margin: EdgeInsets.all(kMarginMedium),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: kRoundCorner,
                              child: Material(
                                elevation: 20,
                                color: theme.scaffoldBackground.value,
                                child: ProgressiveImage(
                                  fit: BoxFit.cover,
                                  placeholder:
                                      NetworkImage(tripList[itemIndex].image),
                                  thumbnail:
                                      NetworkImage(tripList[itemIndex].image),
                                  image:
                                      NetworkImage(tripList[itemIndex].image),
                                  height: 500,
                                  width: 500,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25)),
                                child: Container(
                                  color: Colors.white.withOpacity(0.5),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10.0, sigmaY: 10.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        "TRIP  " + itemIndex.toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class CarouselSliderIndicator extends StatelessWidget {
  CarouselSliderIndicator({
    Key? key,
  }) : super(key: key);

  final SplashController sc = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedSmoothIndicator(
        activeIndex: sc.itemIndex.value,
        count: tripList.length,
        effect: WormEffect(
          dotHeight: 8,
          dotWidth: 8,
          type: WormType.normal,
          dotColor: kContrastColor,
          activeDotColor: kSecondaryColor,
          strokeWidth: 1,
        ),
      ),
    );
  }
}

class MapBox extends StatelessWidget {
  const MapBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width + 0,
      // 1.2 * kMarginLarge,
      decoration: BoxDecoration(
        borderRadius: kRoundCorner,
        color: Colors.black,
      ),
      padding: EdgeInsets.all(kMarginSmall - 2),
      margin: EdgeInsets.all(kMarginLarge),
      child: ClipRRect(
        borderRadius: kRoundCorner,
        child: MapContainer(),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeController theme = Get.put(ThemeController());

    return SliverAppBar(
      floating: true,
      toolbarHeight: 32,
      title: Center(
        child: Text(
          'Featured Paths!',
          style: TextStyle(
            color: theme.textColor.value,
          ),
        ),
      ),
      shadowColor: kSecondaryColor,
      backgroundColor: theme.scaffoldBackground.value,
      elevation: 2,
      pinned: true,
      // flexibleSpace: const HeaderBar(),
    );
  }
}
