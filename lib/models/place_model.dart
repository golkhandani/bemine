import 'package:latlong2/latlong.dart';

class Place {
  Place({
    required this.id,
    required this.latLng,
    required this.thumbnail,
    required this.images,
    required this.title,
    required this.description,
  });
  final String id;
  final String thumbnail;
  final List<String> images;
  final LatLng latLng;
  final String title;
  final String description;
}
