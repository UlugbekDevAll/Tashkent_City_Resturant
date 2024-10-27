import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashkentcityresturant/main.dart';
import 'package:tashkentcityresturant/pages/profile/widget/top_bar_widget.dart';

class InvitePage extends StatefulWidget {
  const InvitePage({super.key});

  @override
  State<InvitePage> createState() => _InvitePageState();
}

class _InvitePageState extends State<InvitePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Column(
      children: [
        TopBarWidget(title: "Пригласить друга"),
        SizedBox(
          height: 27.h,
        ),
        Container(
          width: 1.sw,
          height: 582.h,
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: BoxDecoration(
              color: Color.fromRGBO(216, 152, 65, 1),
              borderRadius: BorderRadius.all(Radius.circular(24))),
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Column(
                            children: [
                              SvgPicture.asset(
                                'assets/my_icons/invite_bg_ic.svg',
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 182.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      'assets/my_icons/invite_center_ic.svg'),
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}
