

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BuilderHeader extends StatefulWidget {
  final String? titleText;
  const BuilderHeader({super.key,  this.titleText});

  @override
  State<BuilderHeader> createState() => _BuilderHeaderState();
}

class _BuilderHeaderState extends State<BuilderHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 8.w),
        SvgPicture.asset("assets/my_icons/back_ic.svg"),
        SizedBox(width: 4.w),
        const Text("Назад", style: TextStyle(color: Color.fromRGBO(63, 61, 60, 1))),
        const Spacer(),
        Text(
          widget.titleText ?? "Регистрация",
          style: TextStyle(
            color: Color.fromRGBO(23, 23, 23, 0.3),
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
          ),
        ),
        const SizedBox(width: 16.0),
      ],
    );
  }
}
