

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tashkentcityresturant/models/products_model.dart';

class ProductListView extends StatefulWidget {
  final List<ProductsModel> products;
  final Function(int) onTotalCountChanged;

  ProductListView({required this.products, required this.onTotalCountChanged});

  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  late List<int> _counters;

  @override
  void initState() {
    super.initState();
    _counters = List<int>.filled(widget.products.length, 0);
  }

  void _increment(int index) {
    setState(() {
      _counters[index]++;
      widget.onTotalCountChanged(getTotalCount());
    });
  }

  void _decrement(int index) {
    if (_counters[index] > 0) {
      setState(() {
        _counters[index]--;
        widget.onTotalCountChanged(getTotalCount());
      });
    }
  }

  int getTotalCount() {
    int total = 0;
    for (int i = 0; i < _counters.length; i++) {
      total += _counters[i];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.products.length,
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final product = widget.products[index];
        return Container(
          width: 224.w,
          height: 302.h,
          margin: EdgeInsets.only(
            left: index == 0 ? 16 : 0,
            right: 8,
          ),
          decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 253, 251, 1),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                child: Container(
                  height: 184.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: Color.fromRGBO(243, 239, 233, 1)),
                  child: Center(
                    child: Image.network(
                      'https://api.justdev24.ru/file//${product.photo}',
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                        return Text('Rasm yuklanishda xato: $error');
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                product.price.toString(),
                style: TextStyle(color: Color.fromRGBO(161, 105, 30, 1), fontSize: 14.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 6.h),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(
                  product.name ?? "Error",
                  style: TextStyle(color: Color.fromRGBO(63, 61, 60, 1), fontSize: 18.sp, fontWeight: FontWeight.w400),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 12.h),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(200)),
                      border: Border.all(color: Color.fromRGBO(23, 23, 23, 0.1), width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (_counters[index] > 0) ...[
                        SizedBox(width: 16.w),
                        GestureDetector(
                          onTap: () => _decrement(index),
                          child: SvgPicture.asset('assets/my_icons/minus_ic.svg'),
                        ),
                        Spacer(),
                        Text(
                          '${_counters[index]}',
                          style: TextStyle(fontSize: 15.sp),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () => _increment(index),
                          child: SvgPicture.asset('assets/my_icons/plus_ic.svg'),
                        ),
                        SizedBox(width: 16.w)
                      ],
                      if(_counters[index]==0)...[
                        GestureDetector(
                          onTap: () => _increment(index),
                          child: SvgPicture.asset('assets/my_icons/plus_ic.svg'),
                        ),
                      ]


                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
