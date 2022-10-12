import 'dart:ui';

import 'package:be_mine/controllers/splash_controller.dart';
import 'package:be_mine/controllers/theme_controller.dart';
import 'package:be_mine/models/place_model.dart';
import 'package:be_mine/models/trip_model.dart';
import 'package:be_mine/pages/place_detail_page.dart';
import 'package:be_mine/pages/trip_detail_page.dart';
import 'package:be_mine/shared/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progressive_image/progressive_image.dart';

class FeaturedCard extends StatelessWidget {
  FeaturedCard({
    Key? key,
    required this.featured,
  }) : super(key: key);
  final featured;
  final ThemeController theme = Get.put(ThemeController());
  final SplashController sc = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    final selectedFeatured = featured;
    final dataType = featured.runtimeType;
    print(dataType);
    final heroTagString = "tripThumbnailHeroTag" + selectedFeatured.id;
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            navigateToDetail(
              dataType,
              selectedFeatured,
              heroTagString,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: kRoundCorner,
              border: Border.all(
                color: theme.borderColor.value,
                width: kBoxBorderWidth,
              ),
            ),
            child: Stack(
              children: [
                Hero(
                  tag: heroTagString,
                  child: GestureDetector(
                    onTap: () {
                      navigateToDetail(
                        dataType,
                        selectedFeatured,
                        heroTagString,
                      );
                    },
                    child: ClipRRect(
                      borderRadius: kRoundCorner,
                      child: Material(
                        elevation: 20,
                        color: theme.scaffoldBackground.value,
                        child: CachedNetworkImage(
                          imageUrl: selectedFeatured.thumbnail,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          progressIndicatorBuilder: (_, __, downloadProgress) =>
                              Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 64,
                              height: 64,
                              child: CircularProgressIndicator(
                                color: theme.splashColor.value,
                                value: downloadProgress.progress,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    child: Container(
                      color: Colors.white.withOpacity(0.5),
                      child: BackdropFilter(
                        filter: kblurFilter,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            selectedFeatured.title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
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
      ],
    );
  }

  void navigateToDetail(Type dataType, selectedFeatured, String heroTagString) {
    if (dataType == Place) {
      Get.to(
        () => PlaceDetailPage(
          thumbnail: selectedFeatured.thumbnail,
          placeSummary: selectedFeatured,
          heroTag: heroTagString,
        ),
        transition: Transition.fadeIn,
      );
    } else if (dataType == Trip) {
      Get.to(
        () => TripDetailPage(
          thumbnail: selectedFeatured.thumbnail,
          tripSummary: selectedFeatured,
          heroTag: heroTagString,
        ),
        transition: Transition.fadeIn,
      );
    }
  }
}
