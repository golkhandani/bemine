import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var scaffoldBackground = Colors.white.obs;
  var textColor = Colors.black.obs;
  var boxShadowColor = Colors.white;
  var tileLayerUrl =
      "https://api.maptiler.com/maps/pastel/{z}/{x}/{y}.png?key=J4ktALZX8GCz9Hw7i0tK";
  var themeName = "Black".obs;

  switchTheme() {
    if (themeName.value == "White") {
      scaffoldBackground.value = Colors.black;
      textColor.value = Colors.white;
      themeName.value = "Black";
    } else {
      scaffoldBackground.value = Colors.white;
      textColor.value = Colors.black;
      themeName.value = "White";
    }
  }
}
