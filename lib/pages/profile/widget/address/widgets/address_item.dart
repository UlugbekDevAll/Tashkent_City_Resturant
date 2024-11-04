import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return GestureDetector(
      onTap: (){
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        width: 1.sw,
        height: 41.h,
        child: Column(
          children: [
            SizedBox(height: 8.h,),
            Row(
              children: [
                SizedBox(width: 16.w,),
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

                    },
                  ),
                ),
                SizedBox(width: 8.w,),
                Text("Народного Ополчения 47к1с1",style: TextStyle(color: Color.fromRGBO(63, 61, 60, 1),fontWeight: FontWeight.w400,fontSize: 16.sp),),
                Spacer(),

                SvgPicture.asset('assets/my_icons/edit_address_ic.svg'),
                SizedBox(width: 16.w,),

              ],
            ),
            SizedBox(height: 12.h,),
            Container(
              width: 1.sw,
              height: 0.5,
              color: Color.fromRGBO(23, 23, 23, 0.1),
            )
          ],
        ),
      ),
    );
  }
}
