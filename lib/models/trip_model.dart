import 'package:latlong2/latlong.dart';

class Trip {
  Trip({required this.id, required this.latLng, required this.image});
  final String id;
  final String image;
  final LatLng latLng;
}
