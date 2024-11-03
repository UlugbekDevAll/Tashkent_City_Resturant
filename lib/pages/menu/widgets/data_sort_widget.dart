import 'package:flutter/material.dart';
import 'package:tashkentcityresturant/pages/menu/widgets/sort_item.dart';


class DataSortWidget extends StatelessWidget {
  const DataSortWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return const SortItem();
      },
    );
  }
}
