import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tashkentcityresturant/main.dart';
import 'package:http/http.dart' as http;
import 'package:tashkentcityresturant/pages/home/home_page.dart';
import 'package:tashkentcityresturant/pages/login/login_pages/login_page.dart';
import 'package:tashkentcityresturant/pages/login/register/verification_page.dart';
import 'package:tashkentcityresturant/pages/login/register/widget/builder_header.dart';
import 'package:tashkentcityresturant/pages/profile/widget/label_edit_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController phoneController = TextEditingController(text: '+7 ');
  final TextEditingController discountController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  final maskFormatter = MaskTextInputFormatter(
    mask: '+7 ### ### ####',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  bool isPasswordObscured = true;
  bool isConfirmPasswordObscured = true;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initSharedPref();
    phoneFocusNode.addListener(_onPhoneFocusChange);

  }
  void initSharedPref()async{
    prefs= await SharedPreferences.getInstance();
  }

  bool _isValid1 = false;
  bool _isPasswordCheck=false;

  void _checkValidity() {
    setState(() {
      _isValid1 = phoneController.text.isNotEmpty && passwordController.text.isNotEmpty && confirmPasswordController.text.isNotEmpty;
    });
  }

  void _isPasswordCheckFunc(){
    setState(() {
      _isPasswordCheck=passwordController.text==confirmPasswordController.text;
    });
  }

  void _registerFunc() async
  {
    if(_isPasswordCheck){
      if(_isValid1&&_isPasswordCheck){
        var reqBody={
          "phone":phoneController.text,
          "password":passwordController.text
        };
        var response= await http.post(
            Uri.parse("https://api.xn--80akjaht2adec3d.xn--p1ai/api/register"),
            headers: {"Content-Type":"application/json"},
            body: jsonEncode(reqBody)
        );

        var jsonResponse=jsonDecode(response.body);

        prefs.setString("tokenDb", jsonResponse['token']);

        if(response.statusCode==200 ||response.statusCode==201){

          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (_) => HomePage()
          )
          );
        }else{
          Fluttertoast.showToast(
            msg: "Serverda xatolik",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      }
    }else{
      Fluttertoast.showToast(
        msg: "Введите пароль правильно",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }

  }


  @override
  void dispose() {
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  void _onPhoneFocusChange() {
    if (phoneFocusNode.hasFocus && phoneController.text == '+7 ') {
      phoneController.text = '+7';
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      isPasswordObscured = !isPasswordObscured;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      isConfirmPasswordObscured = !isConfirmPasswordObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 243, 235, 1),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: [
                    BuilderHeader(),
                    _buildDivider(),
                    _buildTitle(),
                    _buildPhoneInput(),
                    _buildPasswordInput("Установите пароль", isPasswordObscured, _togglePasswordVisibility,passwordController),
                    _buildPasswordInput("Подтвердите пароль", isConfirmPasswordObscured, _toggleConfirmPasswordVisibility,confirmPasswordController),
                    _buildDiscountInput("Промокод"),
                  ],
                ),
              ),
              _buildNextButton(),
              _buildLoginRedirectButton(),
            ],
          ),
        ),
      ),
    );
  }



  Widget _buildDivider() {
    return const Divider(
      thickness: 0.4,
      color: Color.fromRGBO(23, 23, 23, 0.3),
    );
  }

  Widget _buildTitle() {
    return const Padding(
      padding: EdgeInsets.only(top: 40.0),
      child: Text(
        "Давайте создадим аккаунт",
        style: TextStyle(
          color: Color.fromRGBO(23, 23, 23, 1),
          fontSize: 34,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildPhoneInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24.h,),
        const Text(
          "Номер Телефона",
          style: TextStyle(
            color: Color.fromRGBO(23, 23, 23, 0.4),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextField(
          inputFormatters: [maskFormatter],
          onChanged: (_) => _checkValidity(),
          keyboardType: TextInputType.phone,
          controller: phoneController,
          focusNode: phoneFocusNode,
          style: const TextStyle(color: Color.fromRGBO(23, 23, 23, 1), fontSize: 16),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(23, 23, 23, 0.3), width: 1),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(23, 23, 23, 0.6), width: 1),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
          ),
        ),
        const SizedBox(height: 24.0),
      ],
    );
  }

  Widget _buildPasswordInput(String label, bool isObscured, VoidCallback toggleVisibility,TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color.fromRGBO(23, 23, 23, 0.4),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextField(
          obscureText: isObscured,
          controller: controller,
            onChanged: (_){_isPasswordCheckFunc(); _checkValidity();},
          style: const TextStyle(color: Color.fromRGBO(23, 23, 23, 1), fontSize: 16),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(23, 23, 23, 0.3), width: 1),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(23, 23, 23, 0.6), width: 1),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0),
            ),
            suffixIcon: IconButton(
              icon: Container(
                width: 24.w,
                height: 24.h,
                child: isObscured
                    ? SvgPicture.asset('assets/my_icons/show_ic.svg')
                    : SvgPicture.asset('assets/my_icons/hide_ic.svg'),
              ),
              onPressed: toggleVisibility,
            ),
          ),
        ),
        const SizedBox(height: 24.0),
      ],
    );
  }

  Widget _buildDiscountInput(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color.fromRGBO(23, 23, 23, 0.4),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextField(
          controller: discountController,
          style: const TextStyle(color: Color.fromRGBO(23, 23, 23, 1), fontSize: 16),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(23, 23, 23, 0.3), width: 1),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(23, 23, 23, 0.6), width: 1),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
          ),
        ),
        const SizedBox(height: 24.0),
      ],
    );
  }

  Widget _buildNextButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: double.infinity,
        height: 56.0,
        child: ElevatedButton(
          onPressed: _isValid1? () {
            _registerFunc();
          }:(){

          },
          child: const Text(
            "Далее",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          style: ElevatedButton.styleFrom(
            // backgroundColor: Colors.black,
            backgroundColor: _isValid1 ? Color.fromRGBO(57, 126, 91, 1) : Color.fromRGBO(57, 126, 91, 0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            elevation: 0,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginRedirectButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: double.infinity,
        height: 48.0,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => LoginPage()),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "У вас уже есть аккаунт?",
                style: TextStyle(
                  color: Color.fromRGBO(23, 23, 23, 0.6),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                " Войти",
                style: TextStyle(
                  color: Color.fromRGBO(216, 152, 65, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            elevation: 0,
          ),
        ),
      ),
    );
  }
}


