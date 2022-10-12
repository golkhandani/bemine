import 'package:be_mine/controllers/splash_controller.dart';
import 'package:be_mine/controllers/theme_controller.dart';
import 'package:be_mine/models/place_model.dart';
import 'package:be_mine/models/trip_model.dart';
import 'package:be_mine/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:line_icons/line_icons.dart';

class MapContainerController extends GetxController
    with GetTickerProviderStateMixin {
  late MapController mapController;

  late List<Marker> markers = [];

  List<Shadow> mapIconDecoration(Color color) {
    return [
      BoxShadow(
        blurRadius: 12.0,
        color: color,
      ),
      BoxShadow(
        blurRadius: 68.0,
        color: color,
      )
    ];
  }

  Marker marker(Place e) {
    return Marker(
      anchorPos: AnchorPos.align(AnchorAlign.center),
      height: 50,
      width: 50,
      point: e.latLng,
      builder: (ctx) => DecoratedIcon(
        LineIcons.mapPin,
        color: theme.mapPinColor.value,
        size: 42.0,
        shadows: mapIconDecoration(kPrimaryColor),
      ),
    );
  }

  var zoomLevel = 15.obs;
  final userMapCenter = LatLng(51.702, -0.09).obs;
  Rx<LatLng> mapCenter = LatLng(51.702, -0.09).obs;
  zoomIn() {
    print("zoomLevel ${zoomLevel.value}");
    if (zoomLevel.value < 18) {
      zoomLevel.value = zoomLevel.value + 1;
      _animatedMapMove(
        mapCenter.value,
        zoomLevel.value.toDouble(),
      );
    }
  }

  zoomOut() {
    print("zoomLevel ${zoomLevel.value}");
    if (zoomLevel.value > 10) {
      zoomLevel.value = zoomLevel.value - 1;
      _animatedMapMove(
        mapCenter.value,
        zoomLevel.value.toDouble(),
      );
    }
  }

  resetZoom() {
    zoomLevel.value = 15;
  }

  makeCenter() {
    zoomLevel.value = 15;
    mapCenter.value = userMapCenter.value;
    _animatedMapMove(
      mapCenter.value,
      zoomLevel.value.toDouble(),
    );
  }

  final SplashController sc = Get.put(SplashController());
  final ThemeController theme = Get.put(ThemeController());

  void _animatedMapMove(LatLng destLocation, double destZoom) {
    final _latTween = Tween<double>(
        begin: mapController.center.latitude, end: destLocation.latitude);
    final _lngTween = Tween<double>(
        begin: mapController.center.longitude, end: destLocation.longitude);
    final _zoomTween = Tween<double>(begin: mapController.zoom, end: destZoom);
    var controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
    controller.addListener(() {
      mapController.move(
          LatLng(_latTween.evaluate(animation), _lngTween.evaluate(animation)),
          _zoomTween.evaluate(animation));
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });
    controller.forward();
  }

  @override
  void onInit() {
    markers = sc.featuredPlaces.map((e) => marker(e)).toList();
    mapCenter.value = sc.featuredPlaces[sc.itemIndex.value].latLng;
    mapController = MapController();
    sc.addListener(() {
      mapCenter.value = sc.featuredPlaces[sc.itemIndex.value].latLng;
      print("object, ${mapCenter.value}");
      zoomLevel.value = 15;
      _animatedMapMove(mapCenter.value, zoomLevel.value.toDouble());
    });

    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    // _animatedMapMove(mapCenter.value, zoomLevel.value.toDouble());
  }

  @override
  void dispose() {
    super.dispose();
    print("Map controller dispose");
  }
}
