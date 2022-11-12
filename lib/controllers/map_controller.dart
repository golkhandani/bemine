import 'package:be_mine/controllers/featured_items_controller.dart';
import 'package:be_mine/controllers/theme_controller.dart';
import 'package:be_mine/models/trip_model.dart';
import 'package:be_mine/shared/constants.dart';
import 'package:be_mine/shared/fake_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:line_icons/line_icons.dart';

import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';

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

  Marker marker(Trip e) {
    return Marker(
      anchorPos: AnchorPos.align(AnchorAlign.center),
      height: 50,
      width: 50,
      point: e.latLng,
      builder: (ctx) => DecoratedIcon(
        LineIcons.mapPin,
        color: kPinColor,
        size: 42.0,
        shadows: mapIconDecoration(kPrimaryColor),
      ),
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    print("___ MapContainerController onInit $isClosed");
    print("___ initialized onInit $initialized");
    markers = tripList.map((e) => marker(e)).toList();
    final SplashController sc = Get.put(SplashController());
    final ThemeController theme = Get.put(ThemeController());
    final PopupController _popupController = PopupController();
    sc.addListener(() {
      var currentCenter = sc.mapCenterItem.value;
      if (tripList.isNotEmpty) {
        currentCenter = tripList[sc.itemIndex.value].latLng;
      }
      print("___ move: ${currentCenter}");
      _animatedMapMove(currentCenter, 15);
    });
    super.onInit();
  }

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
}
