import 'package:be_mine/components/app/app_bar.dart';
import 'package:be_mine/controllers/theme_controller.dart';
import 'package:be_mine/controllers/trip_detail_controller.dart';
import 'package:be_mine/custom_carousel_slider.dart';
import 'package:be_mine/models/place_model.dart';
import 'package:be_mine/models/trip_model.dart';
import 'package:be_mine/pages/place_detail_page.dart';
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

class TripDetailPage extends StatelessWidget {
  TripDetailPage({
    Key? key,
    required this.thumbnail,
    required this.tripSummary,
    required this.heroTag,
  }) : super(key: key);

  final String thumbnail;
  final String heroTag;
  final Trip tripSummary;
  final CarouselController carouselController = CarouselController();
  final ThemeController theme = Get.find();
  final TripDetailController tdc = Get.put(TripDetailController());

  @override
  Widget build(BuildContext context) {
    final tripImageList = [thumbnail, ...tripSummary.images];
    final listView = ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        width: kMarginSmall,
      ),
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      clipBehavior: Clip.none,
      itemCount: 6,
      itemBuilder: (context, index) {
        const Color startColor = Color.fromARGB(255, 43, 204, 158);
        Color color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0);
        double score = 10;
        String scoreDisplay = '${score.toInt()}/10';
        String scoreTitle = 'Difficulty';
        double angle = 36 * score;
        return Container(
          width: 100,
          height: 100,
          // margin: EdgeInsets.all(8),
          //color: Colors.red,
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                  interval: 100,
                  startAngle: 270,
                  endAngle: 270,
                  showTicks: false,
                  showLabels: false,
                  pointers: <GaugePointer>[
                    RangePointer(
                      value: 270,
                      width: 5,
                      color: Color(0xFFFFCD60),
                      gradient: SweepGradient(
                        colors: <Color>[color, startColor, color],
                        stops: <double>[0.15, 0.45, 0.85],
                      ),
                      enableAnimation: true,
                      cornerStyle: CornerStyle.bothFlat,
                    )
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      axisValue: 50,
                      positionFactor: 0.9,
                      widget: Column(
                        children: [
                          Text(
                            scoreTitle,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: color,
                            ),
                          ),
                          Text(
                            scoreDisplay,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: color,
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
            ],
          ),
        );
      },
    );

    return Obx(() {
      return Scaffold(
        backgroundColor: theme.scaffoldBackground.value,
        body: CustomScrollView(
          controller: tdc.scrollController,
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
                  opacity: tdc.titleOpacity.value,
                  duration: const Duration(milliseconds: 200),
                  child: Text(
                    tripSummary.title,
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
                            itemCount: tripImageList.length,
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
                                    final image = tripImageList[itemIndex];
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
                  Container(
                    height: (logicalHeight * 0.16).floorToDouble(),
                    color: Colors.transparent,
                    padding: kLargeMargin,
                    child: ScrollConfiguration(
                      behavior: const ScrollBehavior(),
                      child: GlowingOverscrollIndicator(
                        axisDirection: AxisDirection.right,
                        color: theme.splashColor.value,
                        child: listView,
                      ),
                    ),
                  ),
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
                            text:
                                ' Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
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
                  PlaceListTimeline(),
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

final indicatorSize = 32.0;
final placeCardHeight = 360.0;
final placeTextHeight = 160.0;
final bottomGapHeight = 50.0;

class PlaceListTimeline extends StatelessWidget {
  PlaceListTimeline({
    Key? key,
  }) : super(key: key);

  final ThemeController theme = Get.find();

  final TripDetailController tdc = Get.put(TripDetailController());

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (_) {
      final placesCount = tdc.tripPlaces.length;

      final containerHeight =
          (placesCount * placeCardHeight + bottomGapHeight + indicatorSize)
              .floorToDouble();
      final timelineThemeData = TimelineThemeData(
        indicatorPosition: 0,
        nodePosition: 0,
        direction: Axis.vertical,
        connectorTheme: const ConnectorThemeData(
          space: 8.0,
          thickness: 8.0,
        ),
      );
      final timelineTileBuilder = TimelineTileBuilder.connected(
        connectionDirection: ConnectionDirection.after,
        itemCount: placesCount + 1,
        itemExtentBuilder: (_, i) =>
            i >= placesCount ? bottomGapHeight : placeCardHeight,
        indicatorBuilder: (_, i) => TimelineIndicator(),
        connectorBuilder: (_, index, __) => TimelineIndicatorConnector(),
        contentsBuilder: (_, index) {
          if (index >= placesCount) return TimelineEnd();
          final place = tdc.tripPlaces[index];
          final heroTag = "placeHero" + index.toString() + place.id.toString();
          return GestureDetector(
            onTap: () {
              Get.to(
                () => PlaceDetailPage(
                  thumbnail: place.thumbnail,
                  placeSummary: place,
                  heroTag: heroTag,
                ),
                transition: Transition.circularReveal,
              );
            },
            child: TimelinePlaceCard(
              place: place,
              heroTag: heroTag,
            ),
          );
        },
      );
      return Container(
        height: containerHeight,
        color: Colors.transparent,
        padding: kLargeMargin,
        child: Timeline.tileBuilder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(0),
          theme: timelineThemeData,
          builder: timelineTileBuilder,
        ),
      );
    });
  }
}

class TimelinePlaceCard extends StatelessWidget {
  TimelinePlaceCard({
    Key? key,
    required this.heroTag,
    required this.place,
  }) : super(key: key);

  final Place place;
  final String heroTag;
  final ThemeController theme = Get.find();

  @override
  Widget build(BuildContext context) {
    const border = BorderRadius.all(
      Radius.circular(25),
    );
    return Container(
      color: Colors.transparent,
      padding: kSmallMargin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: border,
            child: Container(
              height: placeCardHeight - placeTextHeight - 16,
              decoration: BoxDecoration(
                borderRadius: kRoundCorner,
                border: Border.all(
                  color: theme.borderColor.value,
                  width: kBoxBorderWidth,
                ),
              ),
              child: Hero(
                tag: heroTag,
                child: ClipRRect(
                  borderRadius: border,
                  child: Material(
                    color: Colors.transparent,
                    elevation: 20,
                    child: ProgressiveImage(
                      fit: BoxFit.cover,
                      placeholder: NetworkImage(place.thumbnail),
                      thumbnail: NetworkImage(place.thumbnail),
                      image: NetworkImage(place.thumbnail),
                      height: 500,
                      width: 500,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            place.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: theme.textColor.value,
            ),
          ),
          RichText(
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
            text: TextSpan(
              children: [
                TextSpan(
                  text: place.description,
                  style: TextStyle(
                    fontSize: 14,
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
        ],
      ),
    );
  }
}

class TimelineIndicatorConnector extends StatelessWidget {
  TimelineIndicatorConnector({
    Key? key,
  }) : super(key: key);

  final ThemeController theme = Get.find();

  @override
  Widget build(BuildContext context) {
    return SolidLineConnector(
      color: theme.timelineIndicatorColor.value,
      endIndent: 0,
      thickness: theme.timelineConnectorWidth.value,
    );
  }
}

class TimelineIndicator extends StatelessWidget {
  TimelineIndicator({
    Key? key,
  }) : super(key: key);
  final ThemeController theme = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: kMarginSmall,
      ),
      child: OutlinedDotIndicator(
        backgroundColor: theme.timelineIndicatorBackgroundColor.value,
        color: theme.timelineIndicatorColor.value,
        borderWidth: theme.timelineConnectorWidth.value,
        size: indicatorSize,
      ),
    );
  }
}

class TimelineEnd extends StatelessWidget {
  TimelineEnd({
    Key? key,
  }) : super(key: key);

  final ThemeController theme = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: kMarginLarge,
        left: kMarginSmall,
      ),
      height: theme.timelineConnectorWidth.value,
      decoration: BoxDecoration(
        color: theme.borderColor.value,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
