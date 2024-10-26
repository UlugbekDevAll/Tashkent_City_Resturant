

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashkentcityresturant/main.dart';
import 'package:tashkentcityresturant/pages/profile/widget/history_item.dart';
import 'package:tashkentcityresturant/pages/profile/widget/top_bar_widget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          TopBarWidget(title: 'Заказы'),
          SizedBox(height: 52.h,),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 20,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index){
                  return HistoryItem();
                }
            ),
          )
        ],
      ),
    );
  }
}
