import 'package:be_mine/components/container/map_container.dart';
import 'package:be_mine/controllers/theme_controller.dart';
import 'package:be_mine/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MapBox extends StatelessWidget {
  MapBox({
    Key? key,
  }) : super(key: key);
  final ThemeController theme = Get.put(ThemeController());
  final mapBoxHeight = (logicalHeight * 0.55).floorToDouble();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mapBoxHeight,
      color: Colors.transparent,
      padding: kLargeMargin,
      child: Obx(() => Container(
            decoration: BoxDecoration(
              borderRadius: kRoundCorner,
              color: Colors.black,
              border: Border.all(
                color: theme.borderColor.value,
                width: kBoxBorderWidth,
              ),
            ),
            child: ClipRRect(
              borderRadius: kRoundCorner,
              child: MapContainer(),
            ),
          )),
    );
  }
}
