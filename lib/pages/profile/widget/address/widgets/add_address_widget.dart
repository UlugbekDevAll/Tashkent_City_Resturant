
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashkentcityresturant/main.dart';
import 'package:tashkentcityresturant/pages/map/map_page.dart';
import 'package:tashkentcityresturant/utils/cache_values.dart';

class AddAddressWidget extends StatefulWidget {
  const AddAddressWidget({super.key});

  @override
  State<AddAddressWidget> createState() => _AddAddressWidgetState();
}

class _AddAddressWidgetState extends State<AddAddressWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => MapPage(CacheKeys.currentUserPosition)));
      },
      child: Container(
        width: 1.sw,
        height: 40.h,
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(200),
          border: Border.all(color: Color.fromRGBO(23, 23, 23, 0.1),width: 1)
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/my_icons/plus_ic.svg',width: 12.w,height: 12.h,color: Color.fromRGBO(23, 23, 23, 0.6),fit: BoxFit.fill,),
              SizedBox(width: 4.w,),
              Text("Новый адрес",style: TextStyle(color: Color.fromRGBO(63, 61, 60, 1),fontSize: 12.sp,fontWeight: FontWeight.w400),)
            ],
          ),
        ),
      ),
    );
  }
}
