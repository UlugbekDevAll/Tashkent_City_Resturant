

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashkentcityresturant/main.dart';


class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 253, 251, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      height: 302.h,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 184.h,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(243, 239, 233, 1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Image.asset('assets/images/stories_img_bg.png'),
            ),
          ),
          Text(
            "485 ₽",
            style: TextStyle(
              color: const Color.fromRGBO(161, 105, 30, 1),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "Мясо гарнир",
            style: TextStyle(
              color: const Color.fromRGBO(63, 61, 60, 1),
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
