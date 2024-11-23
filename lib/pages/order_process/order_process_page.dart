import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gif/gif.dart';
import 'package:tashkentcityresturant/main.dart';
import 'package:tashkentcityresturant/pages/home/home_page.dart';
import 'package:tashkentcityresturant/pages/order_process/widgets/process_button.dart';
import 'package:tashkentcityresturant/utils/cache_values.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'dart:math' as math;

import 'widgets/process_click.dart';

class OrderProcessPage extends StatefulWidget {
  const OrderProcessPage({super.key});

  @override
  State<OrderProcessPage> createState() => _OrderProcessPageState();
}

class _OrderProcessPageState extends State<OrderProcessPage> with TickerProviderStateMixin {
  late YandexMapController _controller;
  final List<MapObject> _mapObjects = [];
  late GifController _controller1;
  late GifController _controller2;
  late GifController _controller3;
  late GifController _controller4;

  final WebSocketChannel channel = WebSocketChannel.connect(
    Uri.parse('api.ташкентсити.рф'),
  );

  @override
  void initState() {
    super.initState();
    _controller1 = GifController(vsync: this);
    _controller2 = GifController(vsync: this);
    _controller3 = GifController(vsync: this);
    _controller4 = GifController(vsync: this);

    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        _controller1.repeat(min: 0, max: 29, period: Duration(seconds: 5));
        _controller2.repeat(min: 0, max: 29, period: Duration(seconds: 5));
        _controller3.repeat(min: 0, max: 29, period: Duration(seconds: 5));
        _controller4.repeat(min: 0, max: 29, period: Duration(seconds: 5));
      }
    });
  }




  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _moveCameraToFitBothMarkers() {
    Point point1 = CacheKeys.currentUserPosition;
    Point point2 = Point(latitude: 41.2995, longitude: 69.2401); // New point

    double minLat = math.min(point1.latitude, point2.latitude);
    double maxLat = math.max(point1.latitude, point2.latitude);
    double minLon = math.min(point1.longitude, point2.longitude);
    double maxLon = math.max(point1.longitude, point2.longitude);

    double padding = 0.05;
    minLat -= padding;
    maxLat += padding;
    minLon -= padding;
    maxLon += padding;

    BoundingBox boundingBox = BoundingBox(
      northEast: Point(latitude: maxLat, longitude: maxLon),
      southWest: Point(latitude: minLat, longitude: minLon),
    );

    _controller.moveCamera(
      CameraUpdate.newBounds(
        boundingBox,
      ),
      animation: const MapAnimation(type: MapAnimationType.smooth, duration: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          YandexMap(
            mapObjects: _mapObjects,
            onMapCreated: (YandexMapController controller) async {
              _controller = controller;
              await _addMarker(CacheKeys.currentUserPosition,
                  'assets/images/restaurant_pin.png');
              Point newPoint = Point(latitude: 41.2995, longitude: 69.2401);
              Point newPoint1 = Point(latitude: 41.3996, longitude: 69.2401);
              await _addMarker(newPoint, 'assets/images/home_img.png');
              await _addMarker(
                  newPoint1, 'assets/images/current_location_img.png');

              _moveCameraToFitBothMarkers();
            },
          ),
          Column(
            children: [
              SizedBox(
                height: 83.h,
              ),
              Row(
                children: [
                  Spacer(),
                  Spacer(),
                  Text(
                    "Заказ Nº28 в 10:50",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  Spacer(),
                  Container(
                    width: 48.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 253, 251, 1),
                        borderRadius: BorderRadius.circular(120)),
                    child: Center(
                      child:
                          SvgPicture.asset('assets/my_icons/clear_map_ic.svg'),
                    ),
                  ),
                  SizedBox(width: 16.w),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: (){
                  // AssessWaiterDialog()

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => HomePage(checkRestaurant:true)
                  )
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [SvgPicture.asset('assets/my_icons/map_indicator.svg')],
                    ),
                    Container(
                      width: 1.sw,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 26.h,
                          ),
                          Text(
                            "Приняли ваш заказ",
                            style: TextStyle(
                                color: Color.fromRGBO(23, 23, 23, 1),
                                fontWeight: FontWeight.w400,
                                fontSize: 20.sp),
                          ),
                          Text(
                            "Заказ будет доставлен в течение 30 минут",
                            style: TextStyle(
                                color: Color.fromRGBO(63, 61, 60, 0.5),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 40.h,),
                          Container(
                            width: 1.sw,
                            height: 65.h,
                            margin: EdgeInsets.symmetric(horizontal: 24),
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 1.sw,
                                      height: 1,
                                      color: Color.fromRGBO(23, 23, 23, 0.1),
                                    ),
                                  ],
                                ),
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                  width: 64.w,
                                  height: 64.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Color.fromRGBO(247, 243, 235, 1)
                                  ),
                                  child: Center(
                                    child: Gif(
                                      controller: _controller1,
                                      width: 24,
                                      height: 24,
                                      autostart: Autostart.loop,
                                      image: AssetImage('assets/gif/pan.gif'),  // Replace with your GIF path
                                    ),
                                  ),
                                ),
                                  Container(
                                    width: 64.w,
                                    height: 64.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: Color.fromRGBO(247, 243, 235, 1)
                                    ),
                                    child: Center(
                                      child: Gif(
                                        controller: _controller2,
                                        width: 24,
                                        height: 24,
                                        autostart: Autostart.loop,
                                        image: AssetImage('assets/gif/check.gif'),  // Replace with your GIF path
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 64.w,
                                    height: 64.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: Color.fromRGBO(247, 243, 235, 1)
                                    ),
                                    child: Center(
                                      child: Gif(
                                        controller: _controller3,
                                        width: 24,
                                        height: 24,
                                        autostart: Autostart.loop,
                                        image: AssetImage('assets/gif/truck.gif'),  // Replace with your GIF path
                                      ),
                                    ),
                                  ),

                                  Container(
                                    width: 64.w,
                                    height: 64.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: Color.fromRGBO(247, 243, 235, 1)
                                    ),
                                    child: Center(
                                      child: Gif(
                                        controller: _controller4,
                                        width: 24,
                                        height: 24,
                                        autostart: Autostart.loop,
                                        image: AssetImage('assets/gif/finish.gif'),  // Replace with your GIF path
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              ]
                            ),
                          ),
                          SizedBox(height: 40.h,),
                          Container(
                            width: 1.sw,
                            margin: EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              children: [
                                Expanded(child: ProcessClick(title: "Отменить заказ")),
                                SizedBox(width: 5.w,),
                                Expanded(child: ProcessClick(title: "Связаться с нами")),
                              ],
                            ),
                          ),
                          SizedBox(height: 54.h,)
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Future<void> _addMarker(Point point, String image) async {
    // Load the bitmap descriptor asynchronously
    final bitmap = await BitmapDescriptor.fromAssetImage(image);

    final marker = PlacemarkMapObject(
      mapId: MapObjectId('marker_${point.latitude}_${point.longitude}'),
      point: point,
      opacity: 1,
      consumeTapEvents: true,
      onTap: (PlacemarkMapObject placemark, Point point) {
        print('Marker tapped: $point');
      },
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          anchor: const Offset(0.5, 0.5),
          image: bitmap,
          scale: 0.95,
        ),
      ),
    );

    setState(() {
      _mapObjects.add(marker);
    });
  }
}
