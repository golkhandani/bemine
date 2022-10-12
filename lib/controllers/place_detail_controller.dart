import 'package:be_mine/shared/constants.dart';
import 'package:be_mine/shared/fake_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class PlaceDetailController extends GetxController {
  var tripPlaces = placeListFake;
  final ScrollController scrollController = ScrollController();
  Rx<double> titleOpacity = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    var expandedHeight = (logicalHeight * 0.45).floorToDouble();
    scrollController.addListener(() {
      if (expandedHeight - 64 < scrollController.offset) {
        titleOpacity.value = 1;
      } else {
        titleOpacity.value = 0;
      }
    });
  }
}
