

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashkentcityresturant/main.dart';
import 'package:tashkentcityresturant/pages/login/login_pages/widgets/login_body.dart';
import 'package:tashkentcityresturant/pages/profile/widget/top_bar_widget.dart';

class RegisterDialog extends StatefulWidget {
  const RegisterDialog({super.key});

  @override
  State<RegisterDialog> createState() => _RegisterDialogState();
}

class _RegisterDialogState extends State<RegisterDialog> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color.fromRGBO(247, 243, 235, 1),
      child: Column(
        children: [
          TopBarWidget(title: "Профиль"),
          SizedBox(height: 11.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: double.infinity,
              height: 0.4.h,
              color: Color.fromRGBO(23, 23, 23, 0.3),
            ),
          ),
          LoginBody(heightNumber: 56.w,)
        ],
      ),
    );
  }
}
