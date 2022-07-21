import 'package:be_mine/controllers/splash_controller.dart';
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
  final MapController mapController = MapController();

  // late List<Marker> markers = [];

  // List<Shadow> mapIconDecoration(Color color) {
  //   return [
  //     BoxShadow(
  //       blurRadius: 12.0,
  //       color: color,
  //     ),
  //     BoxShadow(
  //       blurRadius: 68.0,
  //       color: color,
  //     )
  //   ];
  // }

  // Marker marker(Trip e) {
  //   return Marker(
  //     anchorPos: AnchorPos.align(AnchorAlign.center),
  //     height: 50,
  //     width: 50,
  //     point: e.latLng,
  //     builder: (ctx) => DecoratedIcon(
  //       LineIcons.mapPin,
  //       color: kPinColor,
  //       size: 42.0,
  //       shadows: mapIconDecoration(kPrimaryColor),
  //     ),
  //   );
  // }

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   print(isClosed);
  //   print(initialized);
  //   super.onInit();
  //   // markers = tripList.map((e) => marker(e)).toList();
  //   final SplashController sc = Get.put(SplashController());
  //   final ThemeController theme = Get.put(ThemeController());
  //   final PopupController _popupController = PopupController();
  //   sc.addListener(() {
  //     _animatedMapMove(sc.mapCenterItem.value, 15);
  //   });
  // }

  // void _animatedMapMove(LatLng destLocation, double destZoom) {
  //   final _latTween = Tween<double>(
  //       begin: mapController.center.latitude, end: destLocation.latitude);
  //   final _lngTween = Tween<double>(
  //       begin: mapController.center.longitude, end: destLocation.longitude);
  //   final _zoomTween = Tween<double>(begin: mapController.zoom, end: destZoom);
  //   var controller = AnimationController(
  //       duration: const Duration(milliseconds: 500), vsync: this);
  //   Animation<double> animation =
  //       CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
  //   controller.addListener(() {
  //     mapController.move(
  //         LatLng(_latTween.evaluate(animation), _lngTween.evaluate(animation)),
  //         _zoomTween.evaluate(animation));
  //   });
  //   animation.addStatusListener((status) {
  //     if (status == AnimationStatus.completed) {
  //       controller.dispose();
  //     } else if (status == AnimationStatus.dismissed) {
  //       controller.dispose();
  //     }
  //   });

  //   controller.forward();
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  // }
}

class MapContainer extends GetView<MapContainerController> {
  // final MapContainerController mc = Get.put(MapContainerController());
  final ThemeController theme = Get.put(ThemeController());
  final SplashController sc = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          mapController: controller.mapController,
          options: mapOptions(),
          // layers: const [
          //   MarkerLayerOptions(markers: markers),
          // ],
          children: <Widget>[
            TileLayerWidget(
              options: tileLayerOptions(),
            ),
            MarkerClusterLayerWidget(
              options: markerClusterLayerOptions(),
            ),
          ],
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: const [
                MapButton(
                  icon: Icons.center_focus_strong,
                ),
                MapButton(
                  icon: Icons.zoom_in,
                ),
                MapButton(
                  icon: Icons.zoom_out,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  MapOptions mapOptions() {
    return MapOptions(
      center: sc.mapCenterItem.value,
      zoom: 15.0,
      plugins: [
        MarkerClusterPlugin(),
      ],
    );
  }

  TileLayerOptions tileLayerOptions() {
    return TileLayerOptions(
      urlTemplate: theme.tileLayerUrl,
      subdomains: kTileLayerUrlSubdomain,
      tileProvider: kCachedTileLayer,
      backgroundColor: theme.scaffoldBackground.value,
    );
  }

  MarkerClusterLayerOptions markerClusterLayerOptions() {
    return MarkerClusterLayerOptions(
      spiderfyCircleRadius: 20,
      spiderfySpiralDistanceMultiplier: 2,
      circleSpiralSwitchover: 12,
      maxClusterRadius: 120,
      rotate: true,
      size: const Size(100, 100),
      //markers: mc.markers,
      anchor: AnchorPos.align(AnchorAlign.center),
      fitBoundsOptions: const FitBoundsOptions(
        padding: EdgeInsets.all(50),
        maxZoom: 15,
      ),
      polygonOptions: const PolygonOptions(
        borderColor: Colors.blueAccent,
        color: Colors.black12,
        borderStrokeWidth: 3,
      ),
      popupOptions: PopupOptions(
          popupSnap: PopupSnap.markerTop,
          popupBuilder: (_, marker) => Container(
                width: 200,
                height: 200,
                color: Colors.white,
                child: GestureDetector(
                  onTap: () => debugPrint('Popup tap!'),
                  child: Text(
                    'Container popup for marker at ${marker.point}',
                  ),
                ),
              )),
      builder: (context, markers) {
        return Container(
          decoration:
              BoxDecoration(borderRadius: kRoundCorner, color: kSecondaryColor),
          child: Center(
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text(
                markers.length.toString(),
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class MapButton extends StatelessWidget {
  const MapButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          hoverColor: Colors.orange,
          splashColor: Colors.black,
          focusColor: Colors.yellow,
          highlightColor: Colors.amber,
          onTap: () {},
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: Icon(
              icon,
              color: Colors.black,
              size: 25,
            ),
          ),
        ),
      ),
    );
  }
}
