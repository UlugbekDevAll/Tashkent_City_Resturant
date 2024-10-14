import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tashkentcityresturant/main.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController controller = TextEditingController(text: '+7 ');

  final FocusNode _focusNode1 = FocusNode();


  final maskFormatter = MaskTextInputFormatter(
    mask: '+7 ### ### ####',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );
  bool _isObscured = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }
  bool _isObscured1 = true;

  void _togglePasswordVisibility1() {
    setState(() {
      _isObscured1 = !_isObscured1;
    });
  }

  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode1.requestFocus();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        if (controller.text == '+7 ') {
          controller.text = '+7';
        }
      }
    });
  }

  @override
  void dispose() {
    focusNode.dispose(); // Fokusni tozalash
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: Color.fromRGBO(247, 243, 235, 1),
      body: GestureDetector(
        onTap: (){
          focusNode.dispose();
        },
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 16.w,
                ),
                SvgPicture.asset("assets/my_icons/back_ic.svg"),
                SizedBox(width: 4.w),
                Text(
                  "Назад",
                  style: TextStyle(color: Color.fromRGBO(63, 61, 60, 1)),
                ),
                Spacer(),
                Text(
                  "Регистрация",
                  style: TextStyle(
                      color: Color.fromRGBO(23, 23, 23, 0.3),
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp),
                ),
                SizedBox(
                  width: 16.w,
                )
              ],
            ),
            SizedBox(
              height: 9.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Container(
                width: double.infinity,
                height: 0.4.h,
                color: Color.fromRGBO(23, 23, 23, 0.3),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                "Давайте создадим аккаунт",
                style: TextStyle(
                    color: Color.fromRGBO(23, 23, 23, 1),
                    fontSize: 34.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                SizedBox(width: 16.w),
                Text(
                  "Номер Телефона",
                  style: TextStyle(
                      color: Color.fromRGBO(23, 23, 23, 0.4),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0,right: 16.0),
              child: TextField(
                inputFormatters: [maskFormatter],
                keyboardType: TextInputType.phone,
                controller: controller,
                focusNode: focusNode,
                style: TextStyle(color: Color.fromRGBO(23, 23, 23, 1),fontSize: 16.sp),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(23, 23, 23, 0.3), width: 1), // Ochiq holatda rang
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(23, 23, 23, 0.6), width: 1), // Fokusda rang
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0), // Xato holatda rang
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                SizedBox(width: 16.w),
                Text(
                  "Установите пароль",
                  style: TextStyle(
                      color: Color.fromRGBO(23, 23, 23, 0.4),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0,right: 16.0),
              child: TextField(
                obscureText: _isObscured,
                style: TextStyle(color: Color.fromRGBO(23, 23, 23, 1),fontSize: 16.sp),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(23, 23, 23, 0.3), width: 1), // Ochiq holatda rang
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(23, 23, 23, 0.6), width: 1), // Fokusda rang
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.0), // Xato holatda rang
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                SizedBox(width: 16.w),
                Text(
                  "Подтвердите пароль",
                  style: TextStyle(
                      color: Color.fromRGBO(23, 23, 23, 0.4),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0,right: 16.0),
              child: TextField(
                focusNode: _focusNode1,
                obscureText: _isObscured1,
                style: TextStyle(color: Color.fromRGBO(23, 23, 23, 1),fontSize: 16.sp),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(23, 23, 23, 0.3), width: 1), // Ochiq holatda rang
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(23, 23, 23, 0.6), width: 1), // Fokusda rang
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.0), // Xato holatda rang
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscured1 ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordVisibility1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
