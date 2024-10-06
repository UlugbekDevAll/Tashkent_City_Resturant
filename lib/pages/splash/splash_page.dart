
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashkentcityresturant/pages/home/home_page.dart';
import 'package:tashkentcityresturant/utils/my_colors.dart';

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
    _setFullScreen();
  }

  void navigate() async{
    Widget page= const HomePage();

    Future.delayed(const Duration(seconds: 1), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> page));
    });
  }

  void _setFullScreen(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
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

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/splash_screen.png'),

            ],
          ),
        ],
      ),
    );
  }
}
