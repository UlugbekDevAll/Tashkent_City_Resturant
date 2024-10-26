

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashkentcityresturant/pages/login/login_pages/login_page.dart';

import '../../register/register_page/sign_up_page.dart';

class LoginBody extends StatefulWidget {
  final double? heightNumber;
  const LoginBody({super.key,  this.heightNumber});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/login_icon.png', width: 325.w),
          ],
        ),
        SizedBox(height: widget.heightNumber ?? 0.0),
        Text(
          "Войдите в профиль",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(23, 23, 23, 1),
              fontSize: 32.sp,
              fontWeight: FontWeight.w400,decoration: TextDecoration.none),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          "Чтобы заработать бонусные монеты и получить персональные предложения",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(23, 23, 23, 0.6),
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,decoration: TextDecoration.none),
        ),
        SizedBox(height: 24.h,),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Container(
              width: double.infinity,
              height: 56.h,
              child: ElevatedButton(
                  onPressed: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> SignUpPage()));},
                  child: Text("Зарегистрироваться",style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.w500,decoration: TextDecoration.none),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(57, 126, 91, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)
                    ),
                    elevation: 0,

                  )
              )
          ),
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Container(
              width: double.infinity,
              height: 56.h,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => LoginPage()));
                  },
                  child: Text("Войти",style: TextStyle(color: Color.fromRGBO(63, 61, 60, 1),fontSize: 16.sp,fontWeight: FontWeight.w500),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)
                    ),
                    elevation: 0,

                  )
              )
          ),
        ),
      ],
    );
  }
}
