import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashkentcityresturant/utils/cache_values.dart';
import 'package:tashkentcityresturant/utils/my_colors.dart';

import '../map/map_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    Container(
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
                  return Container(
                    width: 112.w,
                    margin: EdgeInsets.only(right: 6.w),
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
                  );
                },
              ),
            ),
            SizedBox(
              height: 48.h,
            ),
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
                  onTap: (){

                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=> MapPage(CacheKeys.currentUserPosition)));

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
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 40.h,
                      width: 84.w,
                      margin: EdgeInsets.only(left: index == 0 ? 16 : 0,right: 6.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(23, 23, 23, 0.1), width: 1),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(200)),
                      child: Center(
                        child: Text(
                          "Новинки",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Color.fromRGBO(23, 23, 23, 1)),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 302.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 224.w,
                      margin: EdgeInsets.only(
                        left: index == 0 ? 16 : 0,
                        right: 8,
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 253, 251, 1),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    );
                  }),
            ),

            SizedBox(
              height: 48.h,
            ),
            Row(
              children: [
                SizedBox(
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
              height: 302.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 224.w,
                      margin: EdgeInsets.only(
                        left: index == 0 ? 16 : 0,
                        right: 8,
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 253, 251, 1),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    );
                  }),
            ),

            SizedBox(height: 138.h)


          ],
        ),
      ),
    );
  }
}
