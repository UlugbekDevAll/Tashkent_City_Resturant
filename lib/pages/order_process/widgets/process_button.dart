

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashkentcityresturant/main.dart';

class ProcessButton extends StatefulWidget {
  final String image;
  const ProcessButton({super.key, required this.image});

  @override
  State<ProcessButton> createState() => _ProcessButtonState();
}

class _ProcessButtonState extends State<ProcessButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64.w,
      height: 64.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(247, 243, 235, 1)
      ),
      child: Center(
        child: SvgPicture.asset(widget.image,color: Color.fromRGBO(216, 152, 65, 1),),
      ),
    );
  }
}
