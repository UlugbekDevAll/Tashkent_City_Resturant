import 'dart:convert';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tashkentcityresturant/pages/map/riverpod/MarkerData.dart';
import 'package:tashkentcityresturant/pages/map/riverpod/markersProvider.dart';
import 'package:tashkentcityresturant/pages/map/widgets/bottom_bar_sheet_map.dart';
import 'package:tashkentcityresturant/pages/menu/widgets/switch_button.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:http/http.dart' as http;

import '../../services/address.dart';
import '../../services/address_hive.dart';
import '../../services/yandex_service.dart';




class MapPage extends ConsumerStatefulWidget {
  final Point point;

  const MapPage(this.point, {super.key});

  @override
  ConsumerState<MapPage> createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage> {
  bool switchButtonMapPage = false;
  late YandexMapController mapController;
  List<MapObject> mapObjects = [];
  late double lat;
  late double long;
  late double currentLat;
  late double currentLong;
  late CameraPosition _cameraPosition;
  String _address = "Manzilni topish...";
  CameraPosition? _lastCameraPosition;


  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      print('Location permissions are denied forever.');
    } else {
      await _getCurrentLocation();
    }
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentLat=position.latitude;
      currentLong=position.longitude;
    });
    _cameraPosition = CameraPosition(target: Point(latitude: position.latitude, longitude: position.longitude)); // Moskvada boshlang'ich koordinata

    _updateCamera(Point(latitude: currentLat, longitude: currentLong));
  }


  // Future<void> getAddressFromCoordinates(double latitude, double longitude) async {
  //   final String url =
  //       "https://geocode-maps.yandex.ru/1.x/?geocode=$longitude,$latitude&format=json&apikey=$apiKey";
  //
  //   final response = await http.get(Uri.parse(url));
  //
  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> data = json.decode(response.body);
  //     if (data['response']['GeoObjectCollection']['featureMember'].isNotEmpty) {
  //       String address = data['response']['GeoObjectCollection']['featureMember'][0]['GeoObject']['name'];
  //       setState(() {
  //         _address = address;
  //       });
  //     } else {
  //       setState(() {
  //         _address = "Manzil topilmadi";
  //       });
  //     }
  //   } else {
  //     setState(() {
  //       _address = "Xato yuz berdi!";
  //     });
  //   }
  // }

  // Future<void> getAddress(double latitude, double longitude) async {
  //   try {
  //     List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
  //     if (placemarks.isNotEmpty) {
  //       Placemark placemark = placemarks.last;
  //       String address = '${placemark.street}, ${placemark.locality}, ${placemark.country}';
  //       print('Address: $address');
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }




  void updateMapObjects(List<MarkerData> markers) {
    mapObjects.clear();
    mapObjects.addAll(markers.map((marker) => switchButtonMapPage
        ? YandexService().getAlternateMarker(Point(latitude: marker.latitude, longitude: marker.longitude))
        : YandexService().getMarker(Point(latitude: marker.latitude, longitude: marker.longitude))
    ));

    setState(() {
      lat=markers[0].latitude;
      long=markers[0].longitude;
    });
  }

  void _updateCamera(Point point) {

    if(!switchButtonMapPage){
      if(currentLong!=null && currentLat!=null){

        mapController.moveCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: Point(latitude: currentLat, longitude: currentLong), zoom: 17.0),
          ),
          animation: const MapAnimation(type: MapAnimationType.smooth, duration: 2),
        );
      }else{

        Future.delayed(const Duration(milliseconds: 100), () {
          // final zoomLevel = switchButtonMapPage ? 15.0 : 17.0;
          mapController.moveCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(target: point, zoom: 17.0),
            ),
            animation: const MapAnimation(type: MapAnimationType.smooth, duration: 2),
          );
        });
      }
    }else{
      mapController.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: point, zoom: 17.0),
        ),
        animation: const MapAnimation(type: MapAnimationType.smooth, duration: 2),
      );
    }

    }

    Future<void> _updateCameraSwitch(Point point) async{
      mapController.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: point, zoom: 17.0),
        ),
        animation: const MapAnimation(type: MapAnimationType.smooth, duration: 2),
      );
    }


  @override
  Widget build(BuildContext context) {
    final markersAsyncValue = ref.watch(markersProvider);

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
              onCameraPositionChanged: (CameraPosition position, CameraUpdateReason reason, bool isGesture) {
                // double latitude = position.target.latitude;
                // double longitude = position.target.longitude;
                //
                //
                // getAddress(latitude, longitude);
              },
              onMapCreated: (YandexMapController yandexMapController) {
                mapController = yandexMapController;
                yandexMapController.moveCamera(CameraUpdate.newCameraPosition(_cameraPosition));
              },
            ),
            _buildMarkerIndicator(),
            _buildControlPanel(),
            _buildBottomControls(),
          ],
        ),
      ),
    );
  }

  Widget _buildMarkerIndicator() {
    return  Visibility(
      visible: !switchButtonMapPage,
      child: Padding(
          padding: EdgeInsets.only(bottom: 247.0),
          child: Center(
            child: Image.asset('assets/images/marker_pin.png', width: 50.0, height: 50.0),
          ),

      ),
    );
  }

  Widget _buildControlPanel() {
    return Column(
      children: [
        SizedBox(height: 70.0), // Adjust according to your UI
        Row(
          children: [
            SizedBox(width: 16.0), // Adjust according to your UI
            _buildToggleSwitch(),
            Spacer(),
            _buildClearMapButton(),
            SizedBox(width: 16.0), // Adjust according to your UI
          ],
        ),
      ],
    );
  }

  Widget _buildToggleSwitch() {
    return AnimatedToggleSwitch<bool>.size(
      current: switchButtonMapPage,
      values: [false, true],
      iconOpacity: 0.5,
      indicatorSize: Size(145.0, 48.0),
      customIconBuilder: (context, local, global) => Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              local.value ? 'assets/my_icons/chayxana_mini_ic.svg' : 'assets/my_icons/home_profile_ic.svg',
              color: Color.lerp(Colors.black, Colors.white, local.animationValue),
            ),
            Text(
              local.value ? 'В чайхане' : 'Доставка',
              style: TextStyle(color: Color.lerp(Colors.black, Colors.white, local.animationValue)),
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
      onChanged: (value) async {
        setState(() {
          switchButtonMapPage = value;
        });
        final markers = await ref.read(markersProvider.future);
        updateMapObjects(markers);
        _updateCamera(Point(latitude: lat, longitude: long));

      },
    );
  }

  Widget _buildClearMapButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 48.0, // Adjust according to your UI
        width: 48.0, // Adjust according to your UI
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(120),
        ),
        child: Center(
          child: SvgPicture.asset('assets/my_icons/clear_map_ic.svg'),
        ),
      ),
    );
  }

  Widget _buildBottomControls() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildCurrentLocationButton(),
              SizedBox(width: 16.0),
            ],
          ),
          if (switchButtonMapPage) ...[
            SizedBox(height: 43.0),
          ],
          AnimatedSize(
            duration: const Duration(milliseconds: 500),
            child: switchButtonMapPage
                ? SizedBox.shrink(key: ValueKey('emptyContainer'))
                : Column(
              key: ValueKey('mapIndicator'),
              children: [
                SizedBox(height: 4.0),
                SvgPicture.asset('assets/my_icons/map_indicator.svg'),
                SizedBox(height: 4.0),
                BottomBarSheetMap(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentLocationButton() {
    return GestureDetector(
      onTap: (){
        _updateCamera(Point(latitude: currentLat, longitude: currentLong));
      },
      child: Container(
        height: 48.0,
        width: 48.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(120),
        ),
        child: Center(
          child: SvgPicture.asset('assets/my_icons/current_location_ic.svg'),
        ),
      ),
    );
  }


}





