import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashkentcityresturant/main.dart';

class PromoCodeButton extends StatefulWidget {
  const PromoCodeButton({super.key});

  @override
  State<PromoCodeButton> createState() => _PromoCodeButtonState();
}

class _PromoCodeButtonState extends State<PromoCodeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 56.h,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 253, 251, 1),
        borderRadius: BorderRadius.circular(40)
      ),
      child:
      Row(
        children: [

          SvgPicture.asset('assets/my_icons/promo_code_ic.svg'),
          SizedBox(width:8.w ,),
          Text("Есть промокод?",style: TextStyle(color: Color.fromRGBO(63, 61, 60, 1),decoration: TextDecoration.none,fontSize: 16.sp,fontWeight: FontWeight.w400),),
          Spacer(),
          SvgPicture.asset('assets/my_icons/go_button_ic.svg',color: Color.fromRGBO(23, 23, 23, 0.4),)
        ],
      ),
    );
  }
}
