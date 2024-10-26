import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashkentcityresturant/main.dart';
import 'package:tashkentcityresturant/pages/home/home_page.dart';
import 'package:tashkentcityresturant/pages/login/login_pages/widgets/login_body.dart';
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
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (_) => HomePage()));
            },
            child: Row(
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
          LoginBody(heightNumber: 56.0,)
        ],
      ),
    );
  }
}
