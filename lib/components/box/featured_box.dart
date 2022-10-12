import 'package:be_mine/components/carousel/featured_carousel_slider_container.dart';
import 'package:be_mine/components/carousel/indicator.dart';
import 'package:be_mine/shared/constants.dart';
import 'package:flutter/material.dart';

class FeatureBox extends StatelessWidget {
  FeatureBox({
    Key? key,
  }) : super(key: key);
  final featureBoxHeight = (logicalHeight * 0.45).floorToDouble();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: featureBoxHeight,
      padding: kMediumMargin,
      color: Colors.transparent,
      child: Column(
        children: [
          FeaturedCarouselSliderContainer(),
          CarouselSliderIndicator(),
        ],
      ),
    );
  }
}
