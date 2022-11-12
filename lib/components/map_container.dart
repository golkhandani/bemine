import 'package:be_mine/controllers/featured_items_controller.dart';
import 'package:be_mine/controllers/theme_controller.dart';
import 'package:be_mine/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';

import '../controllers/map_controller.dart';

class MapContainer extends StatefulWidget {
  const MapContainer({Key? key}) : super(key: key);

  @override
  State<MapContainer> createState() => _MapContainerState();
}

class _MapContainerState extends State<MapContainer> {
  final ThemeController theme = Get.put(ThemeController());

  final SplashController sc = Get.put(SplashController());

  late MapContainerController mcc;

  @override
  void initState() {
    // This is some how a problem of working with FlutterMap and GetX
    mcc = Get.put(MapContainerController());
    mcc.mapController = MapController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          mapController: mcc.mapController,
          options: mapOptions(),
          layers: [
            MarkerLayerOptions(markers: mcc.markers),
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
    print("___ mapOptions: ${sc.mapCenterItem.value}");
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
