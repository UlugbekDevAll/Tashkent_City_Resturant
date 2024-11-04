
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'MarkerData.dart';
import 'marker_service.dart';

final markerServiceProvider = Provider((ref) => MarkerService('https://api.xn--80akjaht2adec3d.xn--p1ai/api'));

final markersProvider = FutureProvider<List<MarkerData>>((ref) async {
  final service = ref.watch(markerServiceProvider);
  return await service.fetchMarkers();
});