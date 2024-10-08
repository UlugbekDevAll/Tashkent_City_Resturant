import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashkentcityresturant/pages/map/widgets/bottom_bar_sheet_map.dart';
import 'package:tashkentcityresturant/pages/menu/widgets/switch_button.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../services/yandex_service.dart';
import '../../utils/cache_values.dart';

class MapPage extends StatefulWidget {
  final Point point;

  const MapPage(this.point, {super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  bool loading = true;
  late YandexMapController mapController;
  List<MapObject> mapObjects = [];

  @override
  void initState() {
    mapObjects.add(YandexService().getMarker(widget.point));
    moveCamera();
    super.initState();
  }

  void moveCamera() {
    Future.delayed(const Duration(milliseconds: 250), () {
      setState(() {});
      Future.delayed(const Duration(milliseconds: 700), () {
        mapController.moveCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: widget.point,
                zoom: 14,
              ),
            ),
            animation:
                const MapAnimation(type: MapAnimationType.smooth, duration: 2));
      });
    });
  }

  bool switchButtonMapPage = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            YandexMap(
              mapType: MapType.vector,
              rotateGesturesEnabled: false,
              zoomGesturesEnabled: true,
              tiltGesturesEnabled: true,
              scrollGesturesEnabled: true,
              nightModeEnabled: false,
              mapObjects: mapObjects,
              onMapCreated: (YandexMapController yandexMapController) async {
                mapController = yandexMapController;
              },
              onMapTap: (point) {
                CacheKeys.openLink(
                    "yandexmaps://maps.yandex.com/?pt=${widget.point.longitude},${widget.point.latitude}&z=12");
              },
            ),

            Column(
              children: [
                SizedBox(height: 70.h),
                Row(
                  children: [
                    SizedBox(width: 16.h),
                    AnimatedToggleSwitch<bool>.size(
                      current: switchButtonMapPage,
                      values: [false, true],
                      iconOpacity: 0.5,
                      indicatorSize: Size(145.w, 48.h),
                      customIconBuilder: (context, local, global) => Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              local.value
                                  ? 'assets/my_icons/chayxana_mini_ic.svg'
                                  : 'assets/my_icons/home_profile_ic.svg',
                              color: Color.lerp(Colors.black, Colors.white,
                                  local.animationValue),
                            ),
                            Text(
                              local.value ? 'В чайхане' : 'Доставка',
                              style: TextStyle(
                                  color: Color.lerp(Colors.black, Colors.white,
                                      local.animationValue)),
                            ),
                          ],
                        ),
                      ),
                      borderWidth: 5.0,
                      iconAnimationType: AnimationType.onHover,
                      style: ToggleStyle(
                        indicatorColor: Color.fromRGBO(216, 152, 65, 1),
                        borderColor: Colors.transparent,
                        borderRadius: BorderRadius.circular(80),
                      ),
                      selectedIconScale: 1.0,
                      onChanged: (value) =>
                          setState(() => switchButtonMapPage = value),
                    )
                  ],
                ),
              ],
            ),

            // Position the BottomBarSheetMap at the bottom of the screen
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,

              child: BottomBarSheetMap(),
            ),
          ],
        ),
      ),
    );
  }
}
