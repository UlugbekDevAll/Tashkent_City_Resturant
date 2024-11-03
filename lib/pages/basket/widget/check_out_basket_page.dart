

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashkentcityresturant/main.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashkentcityresturant/pages/order_process/order_process_page.dart';
import 'package:tashkentcityresturant/pages/profile/history/widget/pay_item.dart';

class CheckOutBasketPage extends StatefulWidget {
  const CheckOutBasketPage({super.key});

  @override
  State<CheckOutBasketPage> createState() => _CheckOutBasketPageState();
}

class _CheckOutBasketPageState extends State<CheckOutBasketPage> {

  final TextEditingController _commentController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 243, 235, 1),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset('assets/my_icons/close_sheet_dialog.svg'),
                  SizedBox(width: 16.0)
                ],
              ),
              SizedBox(height: 11.0),
              Container(
                width: double.infinity,
                height: 0.4,
                margin: EdgeInsets.symmetric(horizontal: 8),
                color: Color.fromRGBO(23, 23, 23, 0.3),
              ),
              SizedBox(height: 32.0),
              Row(
                children: [
                  SizedBox(width: 16.0),
                  Text(
                    "Доставка",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Color.fromRGBO(23, 23, 23, 1),
                      fontSize: 28.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.0),
              Row(
                children: [
                  SizedBox(width: 28.0),
                  Text(
                    "Адрес",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Color.fromRGBO(23, 23, 23, 1),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Container(
                width: double.infinity,
                height: 52.0,
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 253, 251, 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 12.0),
                    Text(
                      "Народного Ополчения 47к1с1",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Color.fromRGBO(63, 61, 60, 1),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    SvgPicture.asset('assets/my_icons/go_button_ic.svg'),
                    SizedBox(width: 12.0)
                  ],
                ),
              ),
              SizedBox(height: 24.0),
              Row(
                children: [
                  SizedBox(width: 28.0),
                  Text(
                    "Способ оплаты",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Color.fromRGBO(63, 61, 60, 1),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(216, 152, 65, 1), width: 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 115.0,
                      height: 72.0,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 253, 251, 1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 8.0),
                          Row(
                            children: [
                              SizedBox(width: 8.0),
                              SvgPicture.asset('assets/my_icons/tinkoff_ic.svg', color: Color.fromRGBO(216, 152, 65, 1)),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              SizedBox(width: 8.0),
                              Text(
                                "Тинькофф",
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Color.fromRGBO(216, 152, 65, 1),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.0),
              Container(
                height: 48.0,
                margin: EdgeInsets.symmetric(horizontal: 16.0), // Margin qo'shish
                child: TextField(
                  controller: _commentController,

                  decoration: InputDecoration(
                    labelText: 'Добавить комментарий',
                    border: UnderlineInputBorder(), // Faqat pastki chegara
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey), // Ochiq rang
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(216, 152, 65, 1)), // Fokaslangan rang
                    ),
                  ),
                ),
              ),
              SizedBox(height: 132.h,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 16.0),child: Column(
               children: [
                 PayItem(title: "Доставка", description: "0 ₽"),
                 PayItem(title: "Итого", description: "1 385 ₽"),
               ],
              ),),
              SizedBox(height: 32.h,),
              Container(
                width: 1.sw,
                height: 56.h,
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                    onPressed: () {

                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => OrderProcessPage()
                      )
                      );

                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(57, 126, 91, 1),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
                    child: Text(
                      "Оформить заказ за 1 385 ₽",
                      style: TextStyle(
                          color: Color.fromRGBO(255, 253, 251, 1),
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp),
                    )),
              )

            ],
          ),
        ),
      ),
    );
  }
}

