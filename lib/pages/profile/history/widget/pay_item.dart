import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashkentcityresturant/main.dart';

class PayItem extends StatefulWidget {
  final String title;
  final String description;
  const PayItem({super.key, required this.title, required this.description});

  @override
  State<PayItem> createState() => _PayItemState();
}

class _PayItemState extends State<PayItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8.h,),
        Row(
          children: [
            Text(widget.title,style: TextStyle(color: Color.fromRGBO(23, 23, 23, 0.4),fontSize: 13.sp,fontWeight: FontWeight.w400,decoration: TextDecoration.none),),
            Spacer(),
            Text(widget.description,style: TextStyle(color: Color.fromRGBO(63, 61, 60, 1),fontSize: 16.sp,fontWeight: FontWeight.w400,decoration: TextDecoration.none),),
          ],
        ),
        SizedBox(height: 8.h,),
        Container(
          width: 1.sw,
          height: 0.4,
          color: Color.fromRGBO(23, 23, 23, 0.3),
        )
      ],
    );
  }
}
