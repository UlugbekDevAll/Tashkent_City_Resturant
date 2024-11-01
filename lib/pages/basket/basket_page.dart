import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashkentcityresturant/main.dart';
import 'package:tashkentcityresturant/pages/basket/widget/basket_food.dart';
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
            Container(
              width: 1.sw,
              height: 0.5,
              color: Color.fromRGBO(23, 23, 23, 0.3),
              margin: EdgeInsets.symmetric(horizontal: 8.0),
            ),
            SizedBox(height: 20.h,),
            ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 2,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return BasketFood();
                }
            )
          ],
        ));
  }
}
