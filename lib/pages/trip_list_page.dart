import 'package:be_mine/components/app/app_bar.dart';
import 'package:be_mine/components/box/featured_box.dart';
import 'package:be_mine/components/box/map_box.dart';
import 'package:be_mine/components/card/featured_trip_card.dart';

import 'package:be_mine/controllers/splash_controller.dart';
import 'package:be_mine/controllers/theme_controller.dart';
import 'package:be_mine/controllers/trip_list_controller.dart';
import 'package:be_mine/shared/constants.dart';
import 'package:be_mine/shared/fake_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TripListPage extends StatelessWidget {
  TripListPage({Key? key}) : super(key: key);

  final ThemeController theme = Get.put(ThemeController());
  final SplashController sc = Get.put(SplashController());
  final TripListController tlc = Get.put(TripListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.scaffoldBackground.value,
      body: CustomScrollView(
        slivers: [
          AppBarContainer(
            appBarWidget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Vancouver ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: theme.textColor.value,
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: "Featured places!",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: theme.textColor.value,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                final trip = tlc.trips[index];
                return Container(
                  height: (logicalHeight / 2).floorToDouble(),
                  padding: kLargeMargin,
                  child: FeaturedTripCard(trip: trip),
                );
              },
              childCount: tripListFake.length, // 1000 list items
            ),
          ),
        ],
      ),
    );
  }
}
