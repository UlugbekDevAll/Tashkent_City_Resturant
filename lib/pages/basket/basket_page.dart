import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tashkentcityresturant/main.dart';
import 'package:tashkentcityresturant/pages/basket/widget/basket_food.dart';
import 'package:tashkentcityresturant/pages/basket/widget/check_out_basket_page.dart';
import 'package:tashkentcityresturant/pages/basket/widget/promo_code_button.dart';
import 'package:tashkentcityresturant/pages/profile/history/widget/pay_item.dart';
import 'package:tashkentcityresturant/pages/profile/widget/top_bar_widget.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Color.fromRGBO(247, 243, 235, 1),
        child: Column(
          children: [
            TopBarWidget(title: "Корзина"),
            SizedBox(height: 5.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Container(
                    width: 1.sw,
                    height: 0.5,
                    color: Color.fromRGBO(23, 23, 23, 0.3),
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 2,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return BasketFood();
                      }),
                  Row(
                    children: [
                      Text(
                        "Добавить к заказу?",
                        style: TextStyle(
                            color: Color.fromRGBO(23, 23, 23, 1),
                            fontWeight: FontWeight.w400,
                            fontSize: 28.sp,
                            decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  PromoCodeButton(),
                  SizedBox(
                    height: 40.h,
                  ),
                  PayItem(
                      title: "Товары с учетом скидки", description: "1 385 ₽"),
                  PayItem(title: "Бонусы", description: "50 Coins"),
                  PayItem(title: "Доставка", description: "0 ₽"),
                  SizedBox(
                    height: 24.h,
                  ),
                  Container(
                    width: 1.sw,
                    height: 56.h,
                    child: ElevatedButton(
                        onPressed: () {
                          showCupertinoModalBottomSheet(
                            context: context,
                            builder: (context) => CheckOutBasketPage(),
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
          ],
        ));
  }
}
