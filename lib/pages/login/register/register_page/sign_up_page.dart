

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashkentcityresturant/main.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: Color.fromRGBO(247, 243, 235, 1),
      body:Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 16.w,),
              SvgPicture.asset("assets/my_icons/back_ic.svg"),
              SizedBox(width: 4.w),
              Text("Назад",style: TextStyle(color: Color.fromRGBO(63, 61, 60, 1)),),
              Spacer(),
              Text("Регистрация",style: TextStyle(color: Color.fromRGBO(23, 23, 23, 0.3),fontWeight: FontWeight.w400,fontSize: 16.sp),),
              SizedBox(width: 16.w,)
            ],
          )
        ],
      ),
    );
  }
}
