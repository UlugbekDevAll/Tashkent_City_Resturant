

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tashkentcityresturant/main.dart';

import '../history/history_about_page.dart';

class HistoryItem extends StatefulWidget {
  const HistoryItem({super.key});

  @override
  State<HistoryItem> createState() => _HistoryItemState();
}

class _HistoryItemState extends State<HistoryItem> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(right: 16.0,left: 16.0),
      child: GestureDetector(
        onTap: (){
          showCupertinoModalBottomSheet(
            context: context,
            builder: (context) => HistoryAboutPage(),
          );
        },
        child: Container(
            height: 72.h,
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Color.fromRGBO(23, 23, 23, 0.1), width: 0.4),
                top: BorderSide(color: Colors.transparent, width: 2.0),
                left: BorderSide(color: Colors.transparent, width: 2.0),
                right: BorderSide(color: Colors.transparent, width: 2.0),
              ),
            ),
            child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.h,),
                     Text("1 085",style: TextStyle(color: Color.fromRGBO(161, 105, 30, 1),fontSize: 18.sp,fontWeight: FontWeight.w700,decoration: TextDecoration.none)),

                      SizedBox(height: 6.h,),
                      Row(
                        children: [
                          Text("18 нояб 2024г",style: TextStyle(color: Color.fromRGBO(23, 23, 23, 0.6),fontSize: 16.sp,fontWeight: FontWeight.w400,decoration: TextDecoration.none),),
                          SizedBox(width: 8.w),
                          SvgPicture.asset('assets/my_icons/dot_ic.svg',color: Color.fromRGBO(23, 23, 23, 0.6),width: 4.w,height: 4.h,fit: BoxFit.fill,),
                          SizedBox(width: 8.w),
                          Text("18:01",style: TextStyle(color: Color.fromRGBO(23, 23, 23, 0.6),fontSize: 16.sp,fontWeight: FontWeight.w400,decoration: TextDecoration.none),),
                          SizedBox(width: 8.w),
                          SvgPicture.asset('assets/my_icons/dot_ic.svg',color: Color.fromRGBO(23, 23, 23, 0.6),width: 4.w,height: 4.h,fit: BoxFit.fill,),
                          SizedBox(width: 8.w),
                          Text("Доставлен",style: TextStyle(color: Color.fromRGBO(23, 23, 23, 0.6),fontSize: 16.sp,fontWeight: FontWeight.w400,decoration: TextDecoration.none),),

                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  SvgPicture.asset('assets/my_icons/go_button_ic.svg')

                 ],
            ),

        ),
      ),
    );
  }
}
