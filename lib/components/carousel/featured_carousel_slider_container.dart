import 'package:be_mine/components/card/featured_card.dart';
import 'package:be_mine/components/card/featured_trip_card.dart';
import 'package:be_mine/controllers/splash_controller.dart';
import 'package:be_mine/custom_carousel_slider.dart';
import 'package:be_mine/pages/trip_detail_page.dart';
import 'package:be_mine/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeaturedCarouselSliderContainer extends StatelessWidget {
  FeaturedCarouselSliderContainer({
    Key? key,
  }) : super(key: key);

  final CarouselController carouselController = CarouselController();
  final SplashController sc = Get.put(SplashController());
  final margins = (32 + 16 + 32);

  @override
  Widget build(BuildContext context) {
    final featureBoxHeight = (logicalHeight * 0.45).floorToDouble() - margins;
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: featureBoxHeight,
        enlargeCenterPage: true,
        viewportFraction: kFeatureViewportFraction,
        autoPlayCurve: Curves.fastOutSlowIn,
        initialPage: sc.itemIndex.value,
        onPageChanged: (index, reason) {
          sc.changeItem(index);
          sc.changemapCenterItem(sc.featuredPlaces[index].latLng);
        },
      ),
      carouselController: carouselController,
      itemCount: sc.featuredPlaces.length,
      itemBuilder: (_, int itemIndex, __) {
        final featured = sc.featuredPlaces[itemIndex];
        return FeaturedCard(featured: featured);
      },
    );
  }
}
