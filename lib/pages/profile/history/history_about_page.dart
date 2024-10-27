import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tashkentcityresturant/main.dart';
import 'package:tashkentcityresturant/pages/profile/history/widget/detail_delivery.dart';
import 'package:tashkentcityresturant/pages/profile/history/widget/history_food.dart';
import 'package:tashkentcityresturant/pages/profile/history/widget/pay_item.dart';
import 'package:tashkentcityresturant/pages/profile/widget/top_bar_widget.dart';

class HistoryAboutPage extends StatefulWidget {
  const HistoryAboutPage({super.key});

  @override
  State<HistoryAboutPage> createState() => _HistoryAboutPageState();
}

class _HistoryAboutPageState extends State<HistoryAboutPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SingleChildScrollView(
          child: Column(
                children: [
          TopBarWidget(title: "Заказ"),

          Text(
            "123304",
            style: TextStyle(
                color: Color.fromRGBO(23, 23, 23, 0.4),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Text("1 085",
                    style: TextStyle(
                        color: Color.fromRGBO(161, 105, 30, 1),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  children: [
                    Text(
                      "18 нояб 2024г",
                      style: TextStyle(
                          color: Color.fromRGBO(23, 23, 23, 0.6),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none),
                    ),
                    SizedBox(width: 8.w),
                    SvgPicture.asset(
                      'assets/my_icons/dot_ic.svg',
                      color: Color.fromRGBO(23, 23, 23, 0.6),
                      width: 4.w,
                      height: 4.h,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "18:01",
                      style: TextStyle(
                          color: Color.fromRGBO(23, 23, 23, 0.6),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none),
                    ),
                    SizedBox(width: 8.w),
                    SvgPicture.asset(
                      'assets/my_icons/dot_ic.svg',
                      color: Color.fromRGBO(23, 23, 23, 0.6),
                      width: 4.w,
                      height: 4.h,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "Доставлен",
                      style: TextStyle(
                          color: Color.fromRGBO(23, 23, 23, 0.6),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  width: 1.sw,
                  height: 0.4.h,
                  color: Color.fromRGBO(23, 23, 23, 0.1),
                ),
                SizedBox(height: 16.h,),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return HistoryFood();
                    }
                ),

                Text("Детали доставки",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 24.sp,decoration: TextDecoration.none),),
                SizedBox(height: 16.h,),
                DetailDelivery(),
                SizedBox(height: 32.h,),
                Text("Способ оплаты",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 24.sp,decoration: TextDecoration.none),),
                SizedBox(height: 16.h,),
                Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(247, 243, 235, 1),
                          borderRadius: BorderRadius.circular(73)
                      ),
                      child: Center(
                        child: SvgPicture.asset('assets/my_icons/bank_ic.svg'),
                      ),
                    ),
                    SizedBox(width: 8.w,),
                    Column(
                      children: [
                        Text("Тинькофф оплата",style: TextStyle(color: Color.fromRGBO(63, 61, 60, 1),fontWeight: FontWeight.w400,fontSize: 16.sp,decoration: TextDecoration.none),)
                      ],
                    )
                  ],
                ),
                SizedBox(height: 32.h,),
                PayItem(title: "Товары с учетом скидки", description: "1 385 ₽"),
                PayItem(title: "Бонусы", description: "50 Coins"),
                PayItem(title: "Доставка", description: "0 ₽"),
                SizedBox(height: 82.h)
              ],
            ),
          ),

                ],
              ),
        ));
  }
}
