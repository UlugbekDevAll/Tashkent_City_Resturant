

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashkentcityresturant/main.dart';

class AlertDialogHome extends StatefulWidget {
  const AlertDialogHome({super.key});

  @override
  State<AlertDialogHome> createState() => _AlertDialogHomeState();
}

class _AlertDialogHomeState extends State<AlertDialogHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 264.h,
      margin: EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 253, 251, 1),
        borderRadius: BorderRadius.circular(28)
      ),
      child: Column(
        children: [

          SizedBox(height: 30.h,),
          SvgPicture.asset('assets/my_icons/success_ic.svg'),
          SizedBox(height: 38.h,),
          Text("Официант уже в пути к вам!",style: TextStyle(color: Color.fromRGBO(63, 61, 60, 1),fontSize: 24.sp,fontWeight: FontWeight.w400),textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
