import 'dart:ui';

import 'package:be_mine/controllers/splash_controller.dart';
import 'package:be_mine/controllers/theme_controller.dart';
import 'package:be_mine/models/trip_model.dart';
import 'package:be_mine/pages/trip_detail_page.dart';
import 'package:be_mine/shared/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progressive_image/progressive_image.dart';

class FeaturedTripCard extends StatelessWidget {
  FeaturedTripCard({
    Key? key,
    required this.trip,
  }) : super(key: key);
  final Trip trip;
  final ThemeController theme = Get.put(ThemeController());
  final SplashController sc = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    final selectedFeaturedTrip = trip;
    final heroTagString = "tripThumbnailHeroTag" + selectedFeaturedTrip.id;
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(
              () => TripDetailPage(
                thumbnail: selectedFeaturedTrip.thumbnail,
                tripSummary: trip,
                heroTag: heroTagString,
              ),
              transition: Transition.fadeIn,
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
                      Get.to(
                        () => TripDetailPage(
                          thumbnail: trip.thumbnail,
                          tripSummary: trip,
                          heroTag: heroTagString,
                        ),
                        transition: Transition.fadeIn,
                      );
                    },
                    child: ClipRRect(
                      borderRadius: kRoundCorner,
                      child: Material(
                          elevation: 20,
                          color: theme.scaffoldBackground.value,
                          child: CachedNetworkImage(
                            imageUrl: selectedFeaturedTrip.thumbnail,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                            progressIndicatorBuilder:
                                (_, __, downloadProgress) => Align(
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
                          )
                          //  ProgressiveImage(
                          //   fit: BoxFit.cover,
                          //   placeholder:
                          //       NetworkImage(selectedFeaturedTrip.thumbnail),
                          //   thumbnail:
                          //       NetworkImage(selectedFeaturedTrip.thumbnail),
                          //   image: NetworkImage(selectedFeaturedTrip.thumbnail),
                          //   height: 500,
                          //   width: 500,
                          // ),
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
                            selectedFeaturedTrip.title,
                            style: const TextStyle(
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
      ],
    );
  }
}
