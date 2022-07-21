import 'package:be_mine/components/cached_tile_provider.dart';
import 'package:flutter/material.dart';

var kPrimaryColor = const Color.fromARGB(255, 14, 3, 77);
var kSecondaryColor = Colors.black;
var kContrastColor = const Color.fromARGB(255, 211, 203, 183);
var kPinColor = Colors.black;
var kBackBtnColor = const Color.fromARGB(255, 255, 186, 57);
var kMarginLarge = 16.0;
var kMarginMedium = 8.0;
var kMarginSmall = 4.0;

//"https://api.maptiler.com/maps/ch-swisstopo-lbm-dark/{z}/{x}/{y}.png?key=J4ktALZX8GCz9Hw7i0tK";
var kPlaceholder =
    "https://unsplash.com/photos/8IKf54pc3qk/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8NHx8Y2FmZXxlbnwwfHx8fDE2NDcwNTE1NTg&force=true&w=1920";
var kTileLayerUrlSubdomain = ['a', 'b', 'c'];
var kCachedTileLayer = const CachedTileProvider();
var kRoundCorner = const BorderRadius.all(Radius.circular(25));
var kBoxShadow = [
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
var kBackBtnShadow = const [
  BoxShadow(
    blurRadius: 12.0,
    color: Colors.white,
  ),
  BoxShadow(
    blurRadius: 68.0,
    color: Colors.white,
  )
];
