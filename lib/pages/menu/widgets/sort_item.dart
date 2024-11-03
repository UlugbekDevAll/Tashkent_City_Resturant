

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashkentcityresturant/main.dart';
import 'package:tashkentcityresturant/pages/menu/widgets/product_item.dart';


class SortItem extends StatelessWidget {
  const SortItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Новинки",
          style: TextStyle(
            color: const Color.fromRGBO(23, 23, 23, 1),
            fontWeight: FontWeight.w400,
            fontSize: 34.sp,
          ),
        ),
        SizedBox(
          height: 700,
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(child: Text('Item $index')),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  if (index + 1 < 20)
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(child: Text('Item ${index + 1}')),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
