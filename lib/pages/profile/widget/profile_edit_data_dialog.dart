import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashkentcityresturant/core/configs/theme/app_colors.dart';
import 'package:tashkentcityresturant/main.dart';
import 'package:tashkentcityresturant/pages/profile/widget/label_edit_text.dart';
import 'package:tashkentcityresturant/pages/profile/widget/top_bar_widget.dart';

class ProfileEditDataDialog extends StatefulWidget {
  const ProfileEditDataDialog({super.key});

  @override
  State<ProfileEditDataDialog> createState() => _ProfileEditDataDialogState();
}

class _ProfileEditDataDialogState extends State<ProfileEditDataDialog> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xffFFFDFB),
        body: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              TopBarWidget(title: "Профиль"),
              SizedBox(
                height: 59.h,
              ),
              LabelEditText(label: "Номер Телефона"),
              Container(
                height: 48.h,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _controller,
                    cursorColor: Colors.amber,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue, width: 2.0),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(23, 23, 23, 0.1), width: 1.5),
                        ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(23, 23, 23, 0.5), width: 1.5),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              LabelEditText(label: "Имя Фамилия"),
              Container(
                height: 48.h,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _controllerName,
                    cursorColor: Colors.amber,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue, width: 2.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(23, 23, 23, 0.1), width: 1.5),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(23, 23, 23, 0.5), width: 1.5),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              LabelEditText(label: "Почта"),
              Container(
                height: 48.h,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _controllerEmail,
                    cursorColor: Colors.amber,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue, width: 2.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(23, 23, 23, 0.1), width: 1.5),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(23, 23, 23, 0.5), width: 1.5),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
