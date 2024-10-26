import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tashkentcityresturant/main.dart';
import 'package:tashkentcityresturant/pages/login/register/widget/builder_header.dart';
import 'package:tashkentcityresturant/pages/profile/widget/label_edit_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordObscured = true;
  final TextEditingController phoneController =
      TextEditingController(text: '+7 ');
  final TextEditingController passwordController = TextEditingController();
  final FocusNode phoneFocusNode = FocusNode();
  final maskFormatter = MaskTextInputFormatter(
    mask: '+7 ### ### ####',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  void _togglePasswordVisibility() {
    setState(() {
      isPasswordObscured = !isPasswordObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            BuilderHeader(
              titleText: "Войти",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(
                thickness: 0.4,
                color: Color.fromRGBO(23, 23, 23, 0.3),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [



                  SizedBox(
                    height: 38.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 16.w,
                      ),
                      Text(
                        "С возвращением",
                        style: TextStyle(
                            color: Color.fromRGBO(23, 23, 23, 1),
                            fontSize: 34.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  LabelEditText(label: "Номер Телефона"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      inputFormatters: [maskFormatter],
                      // onChanged: (_) => _checkValidity(),
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                      focusNode: phoneFocusNode,
                      style: const TextStyle(
                          color: Color.fromRGBO(23, 23, 23, 1), fontSize: 16),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(23, 23, 23, 0.3), width: 1),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(23, 23, 23, 0.6), width: 1),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  LabelEditText(label: "Введите пароль"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      obscureText: isPasswordObscured,
                      controller: passwordController,
                      // onChanged: (_) => _checkValidity(),
                      style: const TextStyle(
                          color: Color.fromRGBO(23, 23, 23, 1), fontSize: 16),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(23, 23, 23, 0.3), width: 1),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(23, 23, 23, 0.6), width: 1),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1.0),
                        ),
                        suffixIcon: IconButton(
                          icon: Container(
                            width: 24.0, // Adjust the width as needed
                            height: 24.0, // Adjust the height as needed
                            child: isPasswordObscured
                                ? SvgPicture.asset(
                                'assets/my_icons/show_ic.svg')
                                : SvgPicture.asset(
                                'assets/my_icons/hide_ic.svg'),
                          ),
                          onPressed: _togglePasswordVisibility,
                        ),
                      ),
                      // onSubmitted: (_) => _checkPassword()
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 16.w,
                      ),
                      Text(
                        "Забыли пароль?",
                        style: TextStyle(
                            color: Color.fromRGBO(23, 23, 23, 0.6),
                            fontSize: 14.sp),
                      ),
                    ],
                  ),

                ],
              ),
            )),

            Spacer(),
            Padding(
                padding: const EdgeInsets.only(bottom: 54.0,top: 10.0,left: 16.0,right: 16.0),
                child: Column(
                  children: [
                    Container(
                      height: 56.h,
                        width: double.infinity,
                        child: 
                        ElevatedButton(
                            onPressed: () {}, 
                            child: Text("Войти",style: TextStyle(color: Colors.white,fontSize: 16.sp),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(57, 126, 91, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(40))
                            ),
                            elevation: 0
                          ),
                        )
                    ),
                    SizedBox(height: 8.h,),

                    Container(
                      height: 48.h,
                      color: Colors.transparent,
                      child: ElevatedButton(onPressed: (){}, child:Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text:
                              "У вас нет аккаунта?",
                              style: TextStyle(
                                color: Color.fromRGBO(23, 23, 23, 0.6),
                                fontSize: 16.sp,
                              ),
                            ),
                            TextSpan(
                              text: "  Регистрация",
                              style: TextStyle(
                                color: Color.fromRGBO(216, 152, 65, 1),
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent,elevation: 0),
                      ),
                    )


                  ],
                ))
          ],
        ),
      ),
    );
  }
}
