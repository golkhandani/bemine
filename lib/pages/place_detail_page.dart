import 'package:be_mine/components/app/app_bar.dart';
import 'package:be_mine/controllers/place_detail_controller.dart';
import 'package:be_mine/controllers/theme_controller.dart';
import 'package:be_mine/controllers/trip_detail_controller.dart';
import 'package:be_mine/custom_carousel_slider.dart';
import 'package:be_mine/models/place_model.dart';
import 'package:be_mine/models/trip_model.dart';
import 'package:be_mine/shared/constants.dart';
import 'package:be_mine/shared/fake_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:line_icons/line_icons.dart';

import 'package:progressive_image/progressive_image.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:timelines/timelines.dart';

import 'dart:math' as math;
import 'package:be_mine/shared/fake_data.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class PlaceDetailPage extends StatelessWidget {
  PlaceDetailPage({
    Key? key,
    required this.thumbnail,
    required this.placeSummary,
    required this.heroTag,
  }) : super(key: key);

  final String thumbnail;
  final String heroTag;
  final Place placeSummary;
  final CarouselController carouselController = CarouselController();
  final ThemeController theme = Get.find();
  final PlaceDetailController pdc = Get.put(PlaceDetailController());

  @override
  Widget build(BuildContext context) {
    final placeImageList = [thumbnail, ...imageList];
    return Obx(() {
      return Scaffold(
        backgroundColor: theme.scaffoldBackground.value,
        body: CustomScrollView(
          controller: pdc.scrollController,
          slivers: [
            SliverAppBar(
              expandedHeight: (logicalHeight * 0.45).floorToDouble(),
              backgroundColor: theme.navigationBarBackgroundColor.value,
              elevation: 6,
              pinned: true,
              automaticallyImplyLeading: true,
              stretchTriggerOffset: 1,
              leading: Container(
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: kRoundCorner,
                  child: BackdropFilter(
                    filter: kblurFilter,
                    child: Container(
                      color: theme.textColor.value.withOpacity(0.9),
                      width: 64,
                      height: 64,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: theme.backBtnArrowColor.value,
                          size: 20,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ),
                ),
              ),
              foregroundColor: theme.backBtnArrowColor.value,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                collapseMode: CollapseMode.parallax,
                title: AnimatedOpacity(
                  opacity: pdc.titleOpacity.value,
                  duration: const Duration(milliseconds: 200),
                  child: Text(
                    placeSummary.title,
                    style: TextStyle(
                      color: theme.textColor.value,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                background: ClipRRect(
                  child: Container(
                    color: theme.navigationBarBackgroundColor.value
                        .withOpacity(0.2),
                    child: BackdropFilter(
                      filter: kblurFilter,
                      child: Container(
                        padding: const EdgeInsets.only(top: 48),
                        color: Colors.transparent,
                        child: Container(
                          height: (logicalHeight * 0.45).floorToDouble(),
                          color: Colors.transparent,
                          padding: kLargeMargin,
                          child: CarouselSlider.builder(
                            options: CarouselOptions(
                              height: double.maxFinite,
                              enlargeCenterPage: true,
                              viewportFraction: 0.9,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              initialPage: 0,
                            ),
                            carouselController: carouselController,
                            itemCount: placeImageList.length,
                            itemBuilder: (_, itemIndex, __) {
                              Widget mainWidget = GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: kRoundCorner,
                                    border: Border.all(
                                      color: theme.borderColor.value,
                                      width: kBoxBorderWidth,
                                    ),
                                  ),
                                  child: Builder(builder: (_) {
                                    final image = placeImageList[itemIndex];
                                    return ClipRRect(
                                      borderRadius: kRoundCorner,
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 20,
                                        child: ProgressiveImage(
                                          fit: BoxFit.cover,
                                          placeholder: NetworkImage(image),
                                          thumbnail: NetworkImage(image),
                                          image: NetworkImage(image),
                                          height: 500,
                                          width: 500,
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              );
                              return itemIndex == 0
                                  ? Hero(tag: heroTag, child: mainWidget)
                                  : mainWidget;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  // CarouselSlider
                  // Container(
                  //   height: (logicalHeight * 0.45).floorToDouble(),
                  //   color: Colors.transparent,
                  //   padding: kLargeMargin,
                  //   child: CarouselSlider.builder(
                  //     options: CarouselOptions(
                  //       height: double.maxFinite,
                  //       enlargeCenterPage: true,
                  //       viewportFraction: 0.9,
                  //       autoPlayCurve: Curves.fastOutSlowIn,
                  //       initialPage: 0,
                  //     ),
                  //     carouselController: carouselController,
                  //     itemCount: placeImageList.length,
                  //     itemBuilder: (_, itemIndex, __) {
                  //       Widget mainWidget = GestureDetector(
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //             borderRadius: kRoundCorner,
                  //             border: Border.all(
                  //               color: theme.borderColor.value,
                  //               width: kBoxBorderWidth,
                  //             ),
                  //           ),
                  //           child: Builder(builder: (_) {
                  //             final image = placeImageList[itemIndex];
                  //             return ClipRRect(
                  //               borderRadius: kRoundCorner,
                  //               child: Material(
                  //                 color: Colors.transparent,
                  //                 elevation: 20,
                  //                 child: ProgressiveImage(
                  //                   fit: BoxFit.cover,
                  //                   placeholder: NetworkImage(image),
                  //                   thumbnail: NetworkImage(image),
                  //                   image: NetworkImage(image),
                  //                   height: 500,
                  //                   width: 500,
                  //                 ),
                  //               ),
                  //             );
                  //           }),
                  //         ),
                  //       );
                  //       return itemIndex == 0
                  //           ? Hero(tag: heroTag, child: mainWidget)
                  //           : mainWidget;
                  //     },
                  //   ),
                  // ),

                  Container(
                    padding: kLargeMargin,
                    color: Colors.transparent,
                    child: RichText(
                      textAlign: TextAlign.justify,
                      softWrap: true,
                      textWidthBasis: TextWidthBasis.longestLine,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Vancouver Walker ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: theme.textColor.value,
                            ),
                          ),
                          TextSpan(
                            text: placeSummary.description,
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 0.2,
                              wordSpacing: 1,
                              fontWeight: FontWeight.normal,
                              height: 1.6,
                              color: theme.textColor.value,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 42,
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
