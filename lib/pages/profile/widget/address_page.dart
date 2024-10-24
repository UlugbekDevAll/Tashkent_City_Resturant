

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashkentcityresturant/core/configs/theme/app_colors.dart';
import 'package:tashkentcityresturant/main.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(32),topLeft: Radius.circular(32))
      ),
      child: Column(
        children: [
          Text("Адреса",style: TextStyle(color: AppColors.primaryColor,fontSize: 20.sp,fontWeight: FontWeight.w400),)
        ],
      ),
    );
  }
}
