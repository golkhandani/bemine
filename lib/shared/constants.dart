import 'dart:ui';

import 'package:be_mine/components/map/cached_tile_provider.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromARGB(255, 14, 3, 77);
const kSecondaryColor = Colors.black;
const kContrastColor = Color.fromARGB(255, 211, 203, 183);
const kPinColor = Colors.black;
const kBackBtnColor = Color.fromARGB(255, 255, 186, 57);
const kMarginLarge = 16.0;
const kMarginMedium = 8.0;
const kMarginSmall = 4.0;

//"https://api.maptiler.com/maps/ch-swisstopo-lbm-dark/{z}/{x}/{y}.png?key=J4ktALZX8GCz9Hw7i0tK";
const kPlaceholder =
    "https://unsplash.com/photos/8IKf54pc3qk/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8NHx8Y2FmZXxlbnwwfHx8fDE2NDcwNTE1NTg&force=true&w=1920";
const kTileLayerUrlSubdomain = ['a', 'b', 'c'];
const kCachedTileLayer = const CachedTileProvider();
const kRoundCorner = const BorderRadius.all(Radius.circular(25));
const kBoxShadow = [
  BoxShadow(
    color: kPrimaryColor,
    spreadRadius: 2,
    blurRadius: 4,
  ),
  BoxShadow(
    color: kSecondaryColor,
    spreadRadius: -2,
    blurRadius: 4,
  )
];
const kBackBtnShadow = [
  BoxShadow(
    blurRadius: 12.0,
    color: Colors.white,
  ),
  BoxShadow(
    blurRadius: 68.0,
    color: Colors.white,
  )
];

const kLargeMargin = EdgeInsets.all(kMarginLarge);
const kMediumMargin = EdgeInsets.all(kMarginMedium);
const kSmallMargin = EdgeInsets.all(kMarginSmall);
const kBoxBorderWidth = 2.0;
const kFeatureViewportFraction = 0.8;

const kNavigationBarContainer = 88.0;
const kAppBarContainer = 64;
var pixelRatio = window.devicePixelRatio;
var logicalScreenSize = window.physicalSize / pixelRatio;
var logicalWidth = logicalScreenSize.width;
var logicalHeight = logicalScreenSize.height -
    kNavigationBarContainer -
    kAppBarContainer -
    kMarginLarge;

var kblurFilter = ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0);
