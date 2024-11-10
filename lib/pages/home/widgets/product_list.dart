import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tashkentcityresturant/models/products_model.dart';

import '../../login/register/register_page/sign_up_page.dart';

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
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Color.fromRGBO(243, 239, 233, 1),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                builder: (BuildContext context) {
                  return Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                            ),
                            height: 248.h,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24)),
                                    child: Image.network(
                                      fit: BoxFit.cover,
                                      'https://api.xn--80akjaht2adec3d.xn--p1ai/file//${product.photo}',
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    (loadingProgress
                                                            .expectedTotalBytes ??
                                                        1)
                                                : null,
                                          ),
                                        );
                                      },
                                      errorBuilder: (BuildContext context,
                                          Object error,
                                          StackTrace? stackTrace) {
                                        return Text('Rasm yuklanishda xato:');
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 12.w),
                                      Container(
                                        width: 40.w,
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(100)),
                                        ),
                                        child: Center(
                                          child: SvgPicture.asset(
                                              'assets/my_icons/send_ic.svg'),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: 40.w,
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(100)),
                                        ),
                                        child: Center(
                                          child: SvgPicture.asset(
                                              'assets/my_icons/like_ic.svg'),
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Text(
                            product.name ?? "Error",
                            style: TextStyle(
                                color: Color.fromRGBO(23, 23, 23, 1),
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w400,decoration: TextDecoration.none),
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Text(
                            product.description ?? "Error",
                            style: TextStyle(
                                color: Color.fromRGBO(23, 23, 23, 0.6),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,decoration: TextDecoration.none),
                          ),
                        ),
                        SizedBox(height: 110.h),
                        Container(
                          width: double.infinity,
                          height: 0.4,
                          color: Color.fromRGBO(23, 23, 23, 0.1),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 148.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(200))),
                              child: Row(
                                children: [],
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0,right: 20.0),
                              child: Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Color.fromRGBO(23, 23, 23, 0.4),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.sp,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '569',
                                          style: TextStyle(
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "485",
                                    style: TextStyle(
                                        color: Color.fromRGBO(216, 152, 65, 1),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 24.sp),
                                  ),
                                ],
                              ),
                            )

                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Container(
                              width: double.infinity,
                              height: 56.h,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (_) => SignUpPage()));
                                  },
                                  child: Text(
                                    "Добавить",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromRGBO(57, 126, 91, 1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    elevation: 0,
                                  ))),
                        ),
                        SizedBox(height: 54.h)
                      ],
                    ),
                  );
                });
          },
          child: Container(
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.network(
                          fit: BoxFit.cover,
                          'https://api.xn--80akjaht2adec3d.xn--p1ai/file//${product.photo}',
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        (loadingProgress.expectedTotalBytes ?? 1)
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (BuildContext context, Object error,
                              StackTrace? stackTrace) {
                            return Text('Rasm yuklanishda xato:');
                          },
                        ),
                    ),

                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  product.price.toString(),
                  style: TextStyle(
                      color: Color.fromRGBO(161, 105, 30, 1),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 6.h),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text(
                    product.name ?? "Error",
                    style: TextStyle(
                        color: Color.fromRGBO(63, 61, 60, 1),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 12.h),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: GestureDetector(
                    onTap: () {
                      if (_counters[index] == 0) {
                        _increment(index);
                      }
                    },
                    child: Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(200)),
                          border: Border.all(
                              color: Color.fromRGBO(23, 23, 23, 0.1),
                              width: 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (_counters[index] > 0) ...[
                            SizedBox(width: 16.w),
                            GestureDetector(
                              onTap: () => _decrement(index),
                              child: SvgPicture.asset(
                                  'assets/my_icons/minus_ic.svg'),
                            ),
                            Spacer(),
                            Text(
                              '${_counters[index]}',
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () => _increment(index),
                              child: SvgPicture.asset(
                                  'assets/my_icons/plus_ic.svg'),
                            ),
                            SizedBox(width: 16.w)
                          ],
                          if (_counters[index] == 0) ...[
                            SvgPicture.asset('assets/my_icons/plus_ic.svg'),
                          ]
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
