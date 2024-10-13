import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashkentcityresturant/main.dart';
import 'package:tashkentcityresturant/pages/login/register/register_page/sign_up_page.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color.fromRGBO(247, 243, 235, 1),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Пропустить",
                style: TextStyle(
                  color: Color.fromRGBO(23, 23, 23, 0.8),
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                width: 16.w,
              )
            ],
          ),
          SizedBox(height: 11.h),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Container(
              height: 0.4.h,
              width: double.infinity,
              color: Color.fromRGBO(23, 23, 23, 0.3),
            ),
          ),
          SizedBox(height: 26.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/login_icon.png', width: 325.w),
            ],
          ),
          Text(
            "Войдите в профиль",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(23, 23, 23, 1),
                fontSize: 32.sp,
                fontWeight: FontWeight.w400),
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
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 24.h,),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Container(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                    onPressed: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> SignUpPage()));},
                    child: Text("Зарегистрироваться",style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.w500),),
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
                    onPressed: () {},
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
      ),
    );
  }
}
