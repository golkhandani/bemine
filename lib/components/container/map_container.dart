import 'package:be_mine/controllers/map_controller.dart';
import 'package:be_mine/controllers/splash_controller.dart';
import 'package:be_mine/controllers/theme_controller.dart';
import 'package:be_mine/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:decorated_icon/decorated_icon.dart';

import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';

class MapContainer extends StatefulWidget {
  @override
  State<MapContainer> createState() => _MapContainerState();
}

class _MapContainerState extends State<MapContainer> {
  final MapContainerController mc = Get.put(MapContainerController());

  final ThemeController theme = Get.put(ThemeController());

  final SplashController sc = Get.put(SplashController());

  @override
  void initState() {
    print("Map init");
    super.initState();
    mc.onInit();
  }

  @override
  void dispose() {
    print("Map dispose");
    super.dispose();
    //mc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(
          () => FlutterMap(
            mapController: mc.mapController,
            options: mapOptions(),
            layers: [
              // PolylineLayerOptions(
              //   polylineCulling: false,
              //   polylines: [
              //     Polyline(
              //       points: [
              //         LatLng(51.5001, -0.103),
              //         LatLng(51.5802, -0.123),
              //         LatLng(51.7, -0.103),
              //       ],
              //       color: Colors.blue,
              //     ),
              //   ],
              // ),
              MarkerLayerOptions(markers: [
                Marker(
                  anchorPos: AnchorPos.align(AnchorAlign.center),
                  height: 50,
                  width: 50,
                  point: mc.userMapCenter.value,
                  builder: (ctx) => DecoratedIcon(
                    Icons.center_focus_strong,
                    color: theme.mapPinColor.value,
                    size: 42.0,
                  ),
                )
              ]),
            ],
            children: <Widget>[
              TileLayerWidget(
                options: tileLayerOptions(),
              ),
              MarkerClusterLayerWidget(
                options: markerClusterLayerOptions(),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                MapButton(
                  icon: Icons.center_focus_strong,
                  onTap: () {
                    mc.makeCenter();
                  },
                ),
                MapButton(
                  icon: Icons.zoom_in,
                  onTap: () {
                    mc.zoomIn();
                  },
                ),
                MapButton(
                  icon: Icons.zoom_out,
                  onTap: () {
                    mc.zoomOut();
                  },
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
      onPositionChanged: (postion, gesture) {
        mc.mapCenter.value = LatLng(
          postion.center!.latitude,
          postion.center!.longitude,
        );
      },
      center: mc.mapCenter.value,
      zoom: 15.0,
      plugins: [
        MarkerClusterPlugin(),
      ],
    );
  }

  TileLayerOptions tileLayerOptions() {
    return TileLayerOptions(
      urlTemplate: theme.tileLayerUrl.value,
      subdomains: kTileLayerUrlSubdomain,
      tileProvider: kCachedTileLayer,
      backgroundColor: theme.scaffoldBackground.value,
    );
  }

  MarkerClusterLayerOptions markerClusterLayerOptions() {
    return MarkerClusterLayerOptions(
      markers: mc.markers,
      polygonOptions: const PolygonOptions(
        borderColor: Colors.transparent,
        color: Colors.transparent,
        borderStrokeWidth: 3,
      ),
      onClusterTap: (_) {
        mc.resetZoom();
      },
      builder: (context, markers) {
        return FloatingActionButton(
          splashColor: theme.splashColor.value,
          backgroundColor: theme.borderColor.value,
          child: Text(
            markers.length.toString(),
            style: TextStyle(color: theme.mapPinTextColor.value),
          ),
          onPressed: null,
        );
      },
    );
  }
}

class MapButton extends StatelessWidget {
  MapButton({
    Key? key,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final void Function()? onTap;
  final ThemeController theme = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Obx(() => Material(
            color: theme.mapBtnBackgroundColor.value,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              hoverColor: theme.mapBtnHoverColor.value,
              splashColor: theme.mapBtnSplashColor.value,
              focusColor: theme.mapBtnFocusColor.value,
              highlightColor: theme.mapBtnHighlightColor.value,
              onTap: onTap,
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
                  color: theme.mapBtnTextColor.value,
                  size: 25,
                ),
              ),
            ),
          )),
    );
  }
}
