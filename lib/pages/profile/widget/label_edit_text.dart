

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/configs/theme/app_colors.dart';

class LabelEditText extends StatefulWidget {
  final String label;
  final double? paddingLeft;
  const LabelEditText({super.key, required this.label,  this.paddingLeft});

  @override
  State<LabelEditText> createState() => _LabelEditTextState();
}

class _LabelEditTextState extends State<LabelEditText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: widget.paddingLeft ?? 16.w,),
        Text(widget.label,style: TextStyle(
            color:Color.fromRGBO(23, 23, 23, 0.4),decoration: TextDecoration.none,fontSize: 14.sp,fontWeight: FontWeight.w400
        ),textAlign: TextAlign.start,),
      ],
    );
  }
}
