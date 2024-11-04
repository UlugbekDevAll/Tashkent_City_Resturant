



import 'package:url_launcher/url_launcher_string.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class CacheKeys{
  static Future<bool> openLink(String link) => launchUrlString(link, mode: LaunchMode.externalApplication);
  static Point currentUserPosition = const Point(latitude: 55.734498, longitude: 37.488296);
  static String token = "";
}