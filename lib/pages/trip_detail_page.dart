import 'package:be_mine/controllers/theme_controller.dart';
import 'package:be_mine/custom_carousel_slider.dart';
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
  const TripDetailPage({
    Key? key,
    required this.thumbnail,
    required this.heroTag,
  }) : super(key: key);

  final String thumbnail;
  final String heroTag;
  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = CarouselController();
    final ThemeController theme = Get.find();
    return Scaffold(
        body: Container(
      color: theme.scaffoldBackground.value,
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 42),
                  Row(
                    children: [
                      IconButton(
                        iconSize: 50,
                        onPressed: () {
                          Get.back();
                        },
                        icon: DecoratedIcon(
                          LineIcons.arrowLeft,
                          color: kBackBtnColor,
                          size: 42.0,
                          //shadows: kBackBtnShadow,
                        ),
                      )
                    ],
                  ),
                  // CarouselSlider
                  Container(
                    color: Colors.transparent,
                    child: CarouselSlider.builder(
                        options: CarouselOptions(
                          height: 250,
                          enlargeCenterPage: false,
                          viewportFraction: 0.90,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          initialPage: 0,
                          onPageChanged: (index, reason) {},
                        ),
                        carouselController: carouselController,
                        itemCount: imageList.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          var mainWidget = GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: kRoundCorner,
                                  color: Colors.black
                                  //boxShadow: kBoxShadow,
                                  ),
                              padding: EdgeInsets.all(kMarginSmall - 2),
                              margin: EdgeInsets.all(kMarginMedium),
                              child: ClipRRect(
                                borderRadius: kRoundCorner,
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 20,
                                  child: ProgressiveImage(
                                    fit: BoxFit.cover,
                                    placeholder:
                                        NetworkImage(imageList[itemIndex]),
                                    thumbnail:
                                        NetworkImage(imageList[itemIndex]),
                                    image: NetworkImage(imageList[itemIndex]),
                                    height: 500,
                                    width: 500,
                                  ),
                                ),
                              ),
                            ),
                          );
                          return itemIndex == 0
                              ? Hero(tag: heroTag, child: mainWidget)
                              : mainWidget;
                        }),
                  ),
                  SizedBox(
                    width: 500,
                    height: 200,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: kMarginMedium,
                      ),
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.all(kMarginLarge),
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        Color startColor = Color.fromARGB(255, 43, 204, 158);
                        Color color = Color(
                                (math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0);
                        double score = 10;
                        String scoreDisplay = '${score.toInt()}/10';
                        String scoreTitle = 'Difficulty';
                        double angle = 36 * score;
                        return Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.all(8),
                          //color: Colors.red,
                          child: SfRadialGauge(
                            axes: <RadialAxis>[
                              RadialAxis(
                                  interval: 100,
                                  startAngle: 270,
                                  endAngle: 270,
                                  showTicks: false,
                                  showLabels: true,
                                  pointers: <GaugePointer>[
                                    RangePointer(
                                      value: 270,
                                      width: 10,
                                      color: Color(0xFFFFCD60),
                                      gradient: SweepGradient(
                                        colors: <Color>[
                                          color,
                                          startColor,
                                          color
                                        ],
                                        stops: <double>[0.15, 0.45, 0.85],
                                      ),
                                      enableAnimation: true,
                                      cornerStyle: CornerStyle.bothFlat,
                                    )
                                  ],
                                  annotations: <GaugeAnnotation>[
                                    GaugeAnnotation(
                                      axisValue: 50,
                                      positionFactor: 1.4,
                                      widget: Column(
                                        children: [
                                          Text(
                                            scoreTitle,
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 14,
                                                color: color),
                                          ),
                                          Text(
                                            scoreDisplay,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: color),
                                          )
                                        ],
                                      ),
                                    )
                                  ]),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(kMarginLarge),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Vancouver Walker ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: theme.textColor.value,
                            ),
                          ),
                          TextSpan(
                            text:
                                ' Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: theme.textColor.value,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 11 * 300 + 80,
                    color: Colors.transparent,
                    child: Timeline.tileBuilder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(kMarginSmall),
                      theme: TimelineThemeData(
                        indicatorPosition: 0,
                        nodePosition: 0,
                        direction: Axis.vertical,
                        connectorTheme: ConnectorThemeData(
                          space: 8.0,
                          thickness: 8.0,
                        ),
                      ),
                      builder: TimelineTileBuilder.connected(
                        itemCount: 12,
                        itemExtentBuilder: (context, index) {
                          return index >= 11 ? 50 : 300;
                        },
                        connectionDirection: ConnectionDirection.after,
                        indicatorBuilder: (context, index) {
                          return Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: kMarginSmall),
                            child: OutlinedDotIndicator(
                              backgroundColor: kPrimaryColor,
                              color: kSecondaryColor,
                              borderWidth: 4,
                              size: 32,
                            ),
                          );
                        },
                        connectorBuilder: (context, index, type) {
                          return SolidLineConnector(
                            color: kSecondaryColor,
                            endIndent: 0,
                            thickness: 4,
                          );
                        },
                        contentsBuilder: (context, index) {
                          if (index >= 11) {
                            return Container(
                              margin: EdgeInsets.only(
                                bottom: kMarginLarge,
                                right: kMarginLarge,
                                left: kMarginSmall,
                              ),
                              height: 2,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(100)),
                            );
                          }
                          return Container(
                            margin: EdgeInsets.only(
                              bottom: kMarginLarge,
                              top: kMarginLarge,
                              right: kMarginLarge,
                              left: kMarginSmall,
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                  child: Container(
                                    color: Colors.black,
                                    height: 256 - 2 * kMarginLarge,
                                    padding: EdgeInsets.all(2),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 20,
                                        child: ProgressiveImage(
                                          fit: BoxFit.cover,
                                          placeholder:
                                              NetworkImage(imageList[index]),
                                          thumbnail:
                                              NetworkImage(imageList[index]),
                                          image: NetworkImage(imageList[index]),
                                          height: 500,
                                          width: 500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Stop point title",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 42,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
