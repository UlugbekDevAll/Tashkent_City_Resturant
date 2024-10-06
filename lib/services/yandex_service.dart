import 'dart:ui';

import 'package:yandex_mapkit/yandex_mapkit.dart';

class YandexService {
  PlacemarkMapObject getMarker(Point point) {
    return PlacemarkMapObject(
      mapId: const MapObjectId('marker'),
      point: Point(latitude: point.latitude, longitude: point.longitude),
      opacity: 1,
      consumeTapEvents: true,
      onTap: (PlacemarkMapObject placeMark, Point point) {},
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          anchor: const Offset(0.55, 0.7),
          image: BitmapDescriptor.fromAssetImage('assets/images/marker_pin.png'),
          scale: 0.95,
        ),
      ),
    );
  }
}