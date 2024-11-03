import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashkentcityresturant/main.dart';

class BasketFood extends StatefulWidget {
  const BasketFood({super.key});

  @override
  State<BasketFood> createState() => _BasketFoodState();
}

class _BasketFoodState extends State<BasketFood> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 92.h,
      child: Row(
        children: [
          Container(
              width: 90.w,
              height: 80.h,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/stories_img_bg.png',
                    fit: BoxFit.fill,
                  ))),
          SizedBox(
            width: 12.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 220.w,
                  child: Text(
                    "Шашлычное ассорти на 4 персоны",
                    style: TextStyle(
                        color: Color.fromRGBO(63, 61, 60, 1),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none),
                  )),
              // Text("350 г",style: TextStyle(color: Color.fromRGBO(23, 23, 23, 0.4),fontSize: 13.sp,fontWeight: FontWeight.w400,decoration: TextDecoration.none),)

              SizedBox(
                height: 10.h,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 56.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 253, 251, 1),
                            borderRadius: BorderRadius.circular(200)),
                        child: Center(
                          child: SvgPicture.asset('assets/my_icons/minus_ic.svg'),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text("1",style: TextStyle(color: Color.fromRGBO(23, 23, 23, 1),fontWeight: FontWeight.w500,fontSize: 15.sp,decoration: TextDecoration.none),),
                      SizedBox(width: 8.w),
                      Container(
                        width: 56.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 253, 251, 1),
                            borderRadius: BorderRadius.circular(200)),
                        child: Center(
                          child: SvgPicture.asset('assets/my_icons/plus_ic.svg'),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
