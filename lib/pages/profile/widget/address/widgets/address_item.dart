import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashkentcityresturant/main.dart';

class AddressItem extends StatefulWidget {
  const AddressItem({super.key});

  @override
  State<AddressItem> createState() => _AddressItemState();
}

class _AddressItemState extends State<AddressItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 40.h,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 20.w,
                height: 20.h,
                child: Checkbox(
                  activeColor: Color.fromRGBO(216, 152, 65, 1),
                  checkColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}
