

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashkentcityresturant/main.dart';

class ProcessClick extends StatefulWidget {
  final String title;
  const ProcessClick({super.key, required this.title});

  @override
  State<ProcessClick> createState() => _ProcessClickState();
}

class _ProcessClickState extends State<ProcessClick> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: Color.fromRGBO(23, 23, 23, 0.1),
          width: 1.0,
        ),
      ),
      child: Center(
        child: Text(widget.title,style: TextStyle(color: Color.fromRGBO(23, 23, 23, 0.6),fontWeight: FontWeight.w400,fontSize: 14.sp),),
      ),
    );
  }
}
