import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tashkentcityresturant/pages/home/riverpod/fetch_rec_products.dart';
import 'package:tashkentcityresturant/pages/home/riverpod/product_category_provider.dart';
import 'package:tashkentcityresturant/pages/home/riverpod/products_provider.dart';
import 'package:tashkentcityresturant/pages/home/riverpod/rec_products_provider.dart';
import 'package:tashkentcityresturant/pages/home/widgets/product_list.dart';
import 'package:tashkentcityresturant/pages/home/widgets/story_view.dart';
import 'package:tashkentcityresturant/pages/menu/menu_page.dart';
import 'package:tashkentcityresturant/pages/profile/profile_page.dart';
import 'package:tashkentcityresturant/pages/profile/widget/register_dialog.dart';
import 'package:tashkentcityresturant/pages/stories_page/storiesPage.dart';
import 'package:tashkentcityresturant/utils/cache_values.dart';
import 'package:tashkentcityresturant/utils/my_colors.dart';
import 'package:tashkentcityresturant/utils/storage_request.dart';

import '../map/map_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();
  int _currentCategoryIndex = 0;
  int totalCount = 0;

  void updateTotalCount(int count) {
    setState(() {
      totalCount = count;
    });
  }

  void initState(){
    super.initState();
    _scrollController.addListener(() {
      int newIndex = (_scrollController.offset / 100).round();
      if (newIndex != _currentCategoryIndex) {
        setState(() {
          _currentCategoryIndex = newIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  int totalCountPop = 0;

  void updateTotalCountPop(int count) {
    setState(() {
      totalCountPop = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.splash_bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 40.w,
                    height: 40.h,
                    margin: const EdgeInsets.only(
                        left: 8.0, top: 0.0, right: 8.0, bottom: 0.0),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/my_icons/home_profile_ic.svg',
                        height: 20.h,
                        width: 20.w,
                      ),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 2.0),
                      child: Row(
                        children: [
                          Text("Народного Ополчения 47к1с1",
                              style: TextStyle(
                                  color: Color.fromRGBO(23, 23, 23, 1),
                                  fontSize: 16.sp)),
                          SvgPicture.asset('assets/my_icons/drill.svg')
                        ],
                      ),
                    ),
                    Text(
                      "Бесплатная доставка",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: Color.fromRGBO(23, 23, 23, 0.4)),
                    )
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        if(CacheKeys.token==""){
                          showCupertinoModalBottomSheet(
                            context: context,
                            builder: (context) => RegisterDialog(),
                          );
                        }else{
                          showCupertinoModalBottomSheet(
                            context: context,
                            builder: (context) => ProfilePage(),
                          );
                        }


                      },
                      child: Container(
                          width: 40.w,
                          height: 40.h,
                          margin: const EdgeInsets.only(
                              left: 0.0, top: 0.0, right: 8.0, bottom: 0.0),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/my_icons/app_bar_face_ic.svg',
                              height: 20.h,
                              width: 20.w,
                            ),
                          )),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 8.h),
            Container(
                height: 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(23, 23, 23, 0.2),
                )),
            SizedBox(height: 24.h),
            SizedBox(
              height: 144.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => StoriesPage()));
                    },
                    child: Container(
                      width: 112.w,
                      margin: EdgeInsets.only(
                          left: index == 0 ? 8.w : 0, right: 6.w),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                            color: Color.fromRGBO(208, 129, 23, 1), width: 1),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(80),
                          topRight: Radius.circular(80),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(80),
                              topRight: Radius.circular(80),
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                            child: Stack(
                              children: [
                                Image.asset('assets/images/stories_img_bg.png',
                                    fit: BoxFit.cover),
                                Container(
                                    color: Colors.yellow.withOpacity(0.1)),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Приведи друга получишь 500р",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 48.h),
            Row(
              children: [
                SizedBox(
                  width: 16.h,
                ),
                Text(
                  "Меню",
                  style: TextStyle(
                      color: Color.fromRGBO(23, 23, 23, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 34.sp,
                      fontFamily: 'Adonis'),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) =>
                            ManuPage()));
                  },
                  child: Container(
                    height: 32.h,
                    width: 64.w,
                    margin: EdgeInsets.only(right: 8.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(23, 23, 23, 0.1), width: 1),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(200))),
                    child: Center(
                      child: SvgPicture.asset('assets/my_icons/go_ic.svg'),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
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
            SizedBox(height: 16.h),
            SizedBox(
              height: 310.h,
              child: Consumer(
                builder: (context, ref, child) {
                  final products = ref.watch(productsProvider);

                  return products.when(
                      data: (products) {
                        return ProductListView(
                          products: products,
                          onTotalCountChanged: updateTotalCountPop,
                        );
                      },
                      error: (error, stack) =>
                          Center(child: Text('Xatolik yuz berdi: $error')),
                      loading: () =>
                          Center(child: CircularProgressIndicator()));
                },
              ),
            ),
            SizedBox(
              height: 48.h,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Популярные",
                  style: TextStyle(
                      color: Color.fromRGBO(23, 23, 23, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 34.sp,
                      fontFamily: 'Adonis'),
                ),
                Spacer(),
                Container(
                  height: 32.h,
                  width: 64.w,
                  margin: EdgeInsets.only(right: 8.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromRGBO(23, 23, 23, 0.1), width: 1),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(200))),
                  child: Center(
                    child: SvgPicture.asset('assets/my_icons/go_ic.svg'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 310.h,
              child: Consumer(
                builder: (context, ref, child) {
                  final products = ref.watch(recProductsProvider);

                  return products.when(
                      data: (products) {
                        return ProductListView(
                          products: products,
                          onTotalCountChanged: updateTotalCount,
                        );
                      },
                      error: (error, stack) =>
                          Center(child: Text('Xatolik yuz berdi: $error')),
                      loading: () =>
                          Center(child: CircularProgressIndicator())
                  );
                },
              ),
            ),
            SizedBox(height: 138.h)
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: totalCount + totalCountPop > 0,
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) =>
                    MapPage(CacheKeys.currentUserPosition)));
          },
          child: Container(
            width: 91.w,
            height: 56.h,
            decoration: BoxDecoration(
              color: Color.fromRGBO(57, 126, 91, 1),
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/my_icons/cart_ic.svg'),
                SizedBox(width: 4.w,),
                SvgPicture.asset('assets/my_icons/dot_ic.svg'),
                SizedBox(width: 4.w,),
                Text("${totalCountPop + totalCount}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
