import 'dart:math';

import 'package:yandex_mapkit/yandex_mapkit.dart';

class YandexService {
  // Existing method to get the default marker
  MapObject getMarker(Point point) {
    return PlacemarkMapObject(
      mapId: MapObjectId('default_marker'),
      point: point,
      icon: PlacemarkIcon.single(PlacemarkIconStyle(
        image: BitmapDescriptor.fromAssetImage('assets/images/marker_pin.png'),
        scale: 1.5,
      )),
    );
  }

  MapObject getAlternateMarker(Point point) {
    return PlacemarkMapObject(
      mapId: MapObjectId('alternate_marker'),
      point: point,
      icon: PlacemarkIcon.single(PlacemarkIconStyle(
        image:
            BitmapDescriptor.fromAssetImage('assets/images/restaurant_pin.png'),
        scale: 1,
      )),
    );
  }
}
