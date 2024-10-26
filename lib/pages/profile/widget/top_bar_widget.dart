

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/configs/assets/app_icons.dart';

class TopBarWidget extends StatefulWidget {
  final String title;
  const TopBarWidget({super.key, required this.title});

  @override
  State<TopBarWidget> createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 17.sp,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff3F3D3C),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(AppIcons.closeDialog),
              SizedBox(width:16.w)
            ],
          ),
        ],
      ),
    );
  }
}
