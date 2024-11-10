
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashkentcityresturant/pages/home/home_page.dart';
import 'package:tashkentcityresturant/pages/login/register/verification_page.dart';
import 'package:tashkentcityresturant/pages/login/search_page.dart';
import 'package:tashkentcityresturant/pages/order_process/order_process_page.dart';
import 'package:tashkentcityresturant/utils/my_colors.dart';

import 'animated_icon.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState(){

    navigate();
    super.initState();

  }

  void navigate() async{
    Widget page= const SearchPage();

    Future.delayed(const Duration(seconds: 2), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> HomePage()));
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.splash_bg,
      body: Stack(
        children: [

          Positioned.fill(
            child: SvgPicture.asset(
              'assets/my_icons/splash_screen_bg_ic.svg',
              fit: BoxFit.cover,
            ),
          ),

          Center(
            child: Column(
              children: [
                SizedBox(height: 30.h,),
                Center(
                  child: AnimationDemo(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
