

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashkentcityresturant/core/configs/assets/app_icons.dart';
import 'package:tashkentcityresturant/core/configs/theme/app_colors.dart';
import 'package:tashkentcityresturant/main.dart';

class ProfileButton extends StatefulWidget {
  final String icon_title;
  final String title;
  final VoidCallback? onTap;
  const ProfileButton({super.key, required this.icon_title, required this.title,  this.onTap});

  @override
  State<ProfileButton> createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: double.infinity,
          height: 52.h,
          decoration: BoxDecoration(
            color: AppColors.tertiaryBg,
            borderRadius: BorderRadius.all(Radius.circular(16.0))
          ),
          child: Row(
            children: [
              SizedBox(width: 12.w,),
              SvgPicture.asset(widget.icon_title),
              SizedBox(width: 8.w,),
              Text(widget.title,style: TextStyle(color: AppColors.secondaryColor,fontSize: 16.sp,fontWeight: FontWeight.w400,decoration: TextDecoration.none),),
              Spacer(),
              SvgPicture.asset(AppIcons.goButtonIcon),
              SizedBox(width: 12.w,)
            ],
          ),
        ),
      ),
    );
  }
}
