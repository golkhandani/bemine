import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ThemeType { dark, light }

class ThemeController extends GetxController {
  var scaffoldBackground = Colors.white.obs;
  var navigationBarBackgroundColor = Colors.white.obs;
  var navigationBtnDisableColor = Colors.black87.obs;

  var backBtnColor = Colors.black.obs;
  var backBtnArrowColor = Colors.white.obs;

  var borderColor = Colors.black.obs;

  var textColor = Colors.black.obs;
  var boxShadowColor = Colors.white;

  // MAP
  var tileLayerUrl =
      "https://api.maptiler.com/maps/pastel/{z}/{x}/{y}.png?key=J4ktALZX8GCz9Hw7i0tK"
          .obs;
  var mapPinColor = Colors.black.obs;
  var mapPinTextColor = Colors.white.obs;
  var mapBtnBackgroundColor = Colors.white.obs;
  var mapBtnSplashColor = Colors.amber.obs;
  var mapBtnFocusColor = Colors.orange.obs;
  var mapBtnHighlightColor = Colors.deepOrange.obs;
  var mapBtnHoverColor = Colors.amberAccent.obs;
  var mapBtnTextColor = Colors.black.obs;
  // MAP END

  // FEATURED SLIDER
  var featuredSliderIndicatorDeactive = Colors.blueGrey.obs;
  var featuredSliderIndicatorActive = Colors.blueAccent.obs;
  // FEATURED SLIDER END

  // TRIP PAGE
  var timelineIndicatorBackgroundColor = Colors.transparent.obs;
  var timelineIndicatorColor = Colors.black.obs;
  var timelineConnectorWidth = 4.0.obs;
  // TRIP PAGE END

  var sliderIndicatorDeactive = Colors.grey.obs;
  var sliderIndicatorActive = Colors.amber.obs;
  var current = ThemeType.light.obs;
  var splashColor = Colors.amber.obs;

  switchTheme() {
    if (current.value == ThemeType.dark) {
      current.value = ThemeType.light;
      // LIGHT THEME
      scaffoldBackground.value = Colors.white;
      navigationBarBackgroundColor.value = Colors.white;
      navigationBtnDisableColor.value = Colors.black87;
      backBtnColor.value = Colors.black;
      backBtnArrowColor.value = Colors.white;
      borderColor.value = Colors.black;
      tileLayerUrl.value =
          "https://api.maptiler.com/maps/pastel/{z}/{x}/{y}.png?key=J4ktALZX8GCz9Hw7i0tK";

      mapPinColor.value = Colors.black;
      mapPinTextColor.value = Colors.white;

      mapBtnBackgroundColor.value = Colors.white;
      mapBtnSplashColor.value = Colors.amber;
      mapBtnFocusColor.value = Colors.orange;
      mapBtnHighlightColor.value = Colors.deepOrange;
      mapBtnHoverColor.value = Colors.amberAccent;
      mapBtnTextColor.value = Colors.black;

      // TRIP PAGE
      timelineIndicatorBackgroundColor.value = Colors.transparent;
      timelineIndicatorColor.value = Colors.black;
      timelineConnectorWidth.value = 4.0;
      // TRIP PAGE END

      textColor.value = Colors.black;
    } else {
      current.value = ThemeType.dark;
      // DARK THEME
      scaffoldBackground.value = Colors.black;
      navigationBarBackgroundColor.value = Colors.black;
      navigationBtnDisableColor.value = Colors.white70;
      backBtnColor.value = Colors.white;
      backBtnArrowColor.value = Colors.black;
      borderColor.value = Colors.white;
      tileLayerUrl.value =
          "https://api.maptiler.com/maps/ch-swisstopo-lbm-dark/{z}/{x}/{y}.png?key=J4ktALZX8GCz9Hw7i0tK";
      mapPinColor.value = Colors.white;
      mapPinTextColor.value = Colors.black;

      mapBtnBackgroundColor.value = Colors.black;
      mapBtnSplashColor.value = Colors.amber;
      mapBtnFocusColor.value = Colors.orange;
      mapBtnHighlightColor.value = Colors.deepOrange;
      mapBtnHoverColor.value = Colors.amberAccent;
      mapBtnTextColor.value = Colors.white;

      // TRIP PAGE
      timelineIndicatorBackgroundColor.value = Colors.transparent;
      timelineIndicatorColor.value = Colors.white;
      timelineConnectorWidth.value = 4.0;
      // TRIP PAGE END

      textColor.value = Colors.white;
    }
  }
}
