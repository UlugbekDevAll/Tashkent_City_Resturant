

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashkentcityresturant/main.dart';

class HistoryFood extends StatefulWidget {
  const HistoryFood({super.key});

  @override
  State<HistoryFood> createState() => _HistoryFoodState();
}

class _HistoryFoodState extends State<HistoryFood> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 6.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 54.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: ClipRRect(borderRadius:BorderRadius.circular(5),child: Image.asset('assets/images/stories_img_bg.png',fit: BoxFit.cover,)),
              ),
              SizedBox(width: 12.w,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Шашлычное ассорти на 4 персоны",style: TextStyle(color: Color.fromRGBO(63, 61, 60, 1),fontSize: 16.sp,fontWeight: FontWeight.w400,decoration: TextDecoration.none),),
                  Row(
                    children: [
                      Text("1 шт",style: TextStyle(color: Color.fromRGBO(23, 23, 23, 0.4),fontWeight: FontWeight.w400,fontSize: 13.sp,decoration: TextDecoration.none),),
                      SizedBox(width: 5.w,),
                      SvgPicture.asset('assets/my_icons/dot_ic.svg',color: Color.fromRGBO(23, 23, 23, 0.4),),
                      SizedBox(width: 5.w,),
                      Text("485 ₽",style: TextStyle(color: Color.fromRGBO(161, 105, 30, 1),fontSize: 13.sp,fontWeight: FontWeight.w400,decoration: TextDecoration.none),)
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 8.h),
          Container(
            width: 1.sw,
            height: 0.4.h,
            color: Color.fromRGBO(23, 23, 23, 0.1),
          ),
        ],
      ),
    );
  }
}
