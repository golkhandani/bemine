import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class CachedTileProvider extends TileProvider {
  const CachedTileProvider();
  @override
  ImageProvider getImage(Coords<num> coords, TileLayerOptions options) {
    final url = getTileUrl(coords, options);
    return NetworkImage(url);
  }
}
