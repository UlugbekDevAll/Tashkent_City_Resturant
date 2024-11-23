

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gif/gif.dart';
import 'package:tashkentcityresturant/main.dart';

class ProcessButton extends StatefulWidget {
  final String image;
  const ProcessButton({super.key, required this.image});

  @override
  State<ProcessButton> createState() => _ProcessButtonState();
}

class _ProcessButtonState extends State<ProcessButton> with TickerProviderStateMixin {
  late GifController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GifController(vsync: this);

    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        _controller.repeat(min: 0, max: 29, period: Duration(seconds: 5)); // Animation start
      }
    });

  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
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
        child: Gif(
          controller: _controller,
          width: 24,
          height: 24,
          image: AssetImage(widget.image),  // Replace with your GIF path
        ),
      ),
    );
  }
}
