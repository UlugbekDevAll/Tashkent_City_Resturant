

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashkentcityresturant/main.dart';

class DetailDelivery extends StatefulWidget {
  const DetailDelivery({super.key});

  @override
  State<DetailDelivery> createState() => _DetailDeliveryState();
}

class _DetailDeliveryState extends State<DetailDelivery> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: Color.fromRGBO(247, 243, 235, 1),
                borderRadius: BorderRadius.circular(73)
              ),
              child: Center(
                child: SvgPicture.asset('assets/my_icons/food_ic.svg'),
              ),
            ),
            Container(
              width: 0.6,
              height: 18.h,
              child: CustomPaint(
                painter: DashedLinePainter(),
              ),
              // decoration: BoxDecoration(
              //   border: Border(
              //     left: BorderSide(
              //       color: Colors.black, // qora rang
              //       width: 2.0, // chiziqning qalinligi
              //     ),
              //   ),
              // ),
            ),
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(247, 243, 235, 1),
                  borderRadius: BorderRadius.circular(73)
              ),
              child: Center(
                child: SvgPicture.asset('assets/my_icons/food_home_ic.svg'),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Улица Беруний, 12В, Ташкент",style: TextStyle(color: Color.fromRGBO(63, 61, 60, 1),fontSize: 16.sp,fontWeight: FontWeight.w400,decoration: TextDecoration.none),),
              SizedBox(height: 4.h,),
              Text("Забрать заказ",style: TextStyle(color: Color.fromRGBO(23, 23, 23, 0.4),fontSize: 13.sp,fontWeight: FontWeight.w400,decoration: TextDecoration.none),),
              SizedBox(height: 16.h,),
              Text("062bKuhn Plains Suite 793",style: TextStyle(color: Color.fromRGBO(63, 61, 60, 1),fontSize: 16.sp,fontWeight: FontWeight.w400,decoration: TextDecoration.none),),
              SizedBox(height: 4.h,),
              Text("Доставка заказа",style: TextStyle(color: Color.fromRGBO(23, 23, 23, 0.4),fontSize: 13.sp,fontWeight: FontWeight.w400,decoration: TextDecoration.none),),
            ],
          ),
        )
      ],
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color.fromRGBO(216, 152, 65, 1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;

    double dashWidth = 1.0;
    double dashSpace = 5.0;
    double startX = 0;

    while (startX < size.height) {
      canvas.drawLine(Offset(0, startX), Offset(0, startX + dashWidth), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
