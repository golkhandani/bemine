import 'package:latlong2/latlong.dart';

class Trip {
  Trip({
    required this.id,
    required this.latLng,
    required this.thumbnail,
    required this.images,
    required this.title,
  });
  final String id;
  final String thumbnail;
  final List<String> images;
  final LatLng latLng;
  final String title;
}
