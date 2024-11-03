import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashkentcityresturant/main.dart';
import 'package:tashkentcityresturant/pages/home/widgets/product_list.dart';
import 'package:tashkentcityresturant/pages/menu/widgets/data_sort_widget.dart';

import '../home/riverpod/product_category_provider.dart';
import '../home/riverpod/rec_products_provider.dart';

class ManuPage extends StatefulWidget {
  const ManuPage({super.key});

  @override
  State<ManuPage> createState() => _ManuPageState();
}

class _ManuPageState extends State<ManuPage> {
  int totalCount = 0;

  void updateTotalCount(int count) {
    setState(() {
      totalCount = count;
    });
  }

  int totalCountPop = 0;

  void updateTotalCountPop(int count) {
    setState(() {
      totalCountPop = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: const Color.fromRGBO(247, 243, 236, 1),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  SvgPicture.asset('assets/my_icons/back_ic.svg'),
                  Spacer(),
                  Text(
                    "Меню",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 24.sp,
                    ),
                  ),
                  Spacer(),
                  SvgPicture.asset('assets/my_icons/search_ic.svg'),
                  SizedBox(
                    width: 16.w,
                  )
                ],
              ),
              SizedBox(height: 21.h),
              SizedBox(
                height: 40.h,
                child: Consumer(
                  builder: (context, ref, child) {
                    final categoriesAsyncValue =
                        ref.watch(productsCategoryProvider);

                    return categoriesAsyncValue.when(
                        data: (categories) {
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categories.length,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                final category = categories[index];
                                return Container(
                                  height: 40.h,
                                  width: 84.w,
                                  margin: EdgeInsets.only(
                                      left: index == 0 ? 16 : 0, right: 6.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color.fromRGBO(23, 23, 23, 0.1),
                                          width: 1),
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(200)),
                                  child: Center(
                                    child: Text(
                                      category.name ?? 'Noma\'lum',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Color.fromRGBO(23, 23, 23, 1)),
                                    ),
                                  ),
                                );
                              });
                        },
                        error: (error, stack) =>
                            Center(child: Text('Xatolik yuz berdi: $error')),
                        loading: () =>
                            Center(child: CircularProgressIndicator()));
                  },
                ),
              ),

              Expanded(
                child:SingleChildScrollView(child: DataSortWidget()),
              )




            ],
          ),
        ),
      ),
    );
  }
}
