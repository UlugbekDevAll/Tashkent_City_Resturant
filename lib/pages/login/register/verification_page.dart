import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashkentcityresturant/main.dart';
import 'package:tashkentcityresturant/pages/login/register/register_page/sign_up_page.dart';
import 'package:tashkentcityresturant/pages/login/register/widget/builder_header.dart';
import 'package:tashkentcityresturant/pages/profile/widget/label_edit_text.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final FocusNode phoneFocusNode = FocusNode();
  final TextEditingController phoneController = TextEditingController();
  bool _isValid=false;
  void _checkCode(){
    setState(() {

      if(phoneController.text.length==4){
        _isValid=true;
      }else{
        _isValid=false;
      }
    });
  }

  int _seconds = 59;
  Timer? _timer;

  void _startTimer(){
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }
  @override
  void initState(){
    super.initState();
    _startTimer();
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String displayTime = '0:${_seconds < 10 ? '0' : ''}$_seconds';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Color.fromRGBO(247, 243, 235, 1),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BuilderHeader(),
                  Divider(
                    thickness: 0.4,
                    color: Color.fromRGBO(23, 23, 23, 0.3),
                  ),
                  SizedBox(height: 40.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Text(
                          "Подтвердите свой номер телефона",
                          style: TextStyle(
                            color: Color.fromRGBO(23, 23, 23, 1),
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                "Мы только что отправили вам проверочный код на номер телефона ",
                                style: TextStyle(
                                  color: Color.fromRGBO(23, 23, 23, 0.4),
                                  fontSize: 16.sp,
                                ),
                              ),
                              TextSpan(
                                text: "+7 995 120 1228",
                                style: TextStyle(
                                  color: Color.fromRGBO(23, 23, 23, 1),
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 64.h),
                        LabelEditText(
                          label: "Код проверки",
                          paddingLeft: 0,
                        ),
                        TextField(
                          controller: phoneController,
                          maxLength: 4,
                          maxLengthEnforcement: MaxLengthEnforcement.none,
                          keyboardType: TextInputType.number,
                          onChanged: (_) => _checkCode(),
                          focusNode: phoneFocusNode,
                          style: const TextStyle(
                            color: Color.fromRGBO(23, 23, 23, 1),
                            fontSize: 16,
                          ),

                          decoration: InputDecoration(
                            counterText: '',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(23, 23, 23, 0.3),
                                width: 1,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(23, 23, 23, 0.6),
                                width: 1,
                              ),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 54.0,top: 70.0),
            child: Row(
              children: [
                SizedBox(width: 16.w),
                Container(
                  width: 104.w,
                  height: 44.h,
                  child: ElevatedButton(
                    onPressed: (){
                      if (_seconds == 0) {
                        setState(() {
                          _seconds = 59;
                        });
                        _startTimer();
                      }
                    },
                    child:  _seconds >0 ? Text(displayTime,style: TextStyle(color: Color.fromRGBO(23, 23, 23, 0.6)),): SvgPicture.asset('assets/my_icons/repeat_timer_ic.svg') ,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(255, 253, 251, 1),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(64))
                      ),

                      shadowColor: Colors.transparent,
                    ),


                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Container(
                    height: 44.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Далее",style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: _isValid ? Color.fromRGBO(57, 126, 91, 1) : Color.fromRGBO(57, 126, 91, 0.5),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(40))
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 19.w),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
