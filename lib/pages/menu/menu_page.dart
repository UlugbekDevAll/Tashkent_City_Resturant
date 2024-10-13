



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashkentcityresturant/main.dart';

class ManuPage extends StatefulWidget {
  const ManuPage({super.key});

  @override
  State<ManuPage> createState() => _ManuPageState();
}

class _ManuPageState extends State<ManuPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: const Color.fromRGBO(247, 243, 236, 1),
        body: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 16.w,),
                SvgPicture.asset('assets/my_icons/back_ic.svg'),
                Spacer(),
                Text(
                  "Меню",
                  style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1),fontSize: 24.sp,),
                ),
                Spacer(),
                SvgPicture.asset('assets/my_icons/search_ic.svg'),
                SizedBox(width: 16.w,)
              ],
            )
          ],
        ),
      ),
    );
  }
}


