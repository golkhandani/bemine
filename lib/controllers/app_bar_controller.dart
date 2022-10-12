import 'package:be_mine/controllers/theme_controller.dart';
import 'package:be_mine/shared/fake_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class AppBarController extends GetxController {
  final ThemeController theme = Get.put(ThemeController());

  var title = placeListFake;
  var color = Colors.transparent.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    color.value = theme.navigationBarBackgroundColor.value;
  }
}
