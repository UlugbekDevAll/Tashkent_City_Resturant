import 'package:flutter/material.dart';
import 'package:tashkentcityresturant/services/address.dart';
import 'package:tashkentcityresturant/services/address_hive.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:collection/collection.dart';

import '../../profile/widget/address_page.dart';

class AddressDisplayWidget extends StatefulWidget {
  @override
  _AddressDisplayWidgetState createState() => _AddressDisplayWidgetState();
}
class _AddressDisplayWidgetState extends State<AddressDisplayWidget> {
  late Future<List<Address>> _addressesFuture;

  @override
  void initState() {
    super.initState();
    _addressesFuture = AddressHive().loadAddresses();
  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Address>>(
      future: _addressesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {

          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {

          print(snapshot.error);
          return Center(child: Text('Xatolik yuz berdi: ${snapshot.error}'));
        } else if (!snapshot.hasData || (snapshot.data?.isEmpty ?? true)) {
          // No data found
          return GestureDetector(
            onTap: (){
              // showModalBottomSheet(
              //   context: context,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.vertical(top: Radius.circular(32.0)), // radius ni o'zingiz xohlagan qiymatga o'zgartiring
              //   ),
              //   barrierColor: Colors.black.withOpacity(0.45),
              //   builder: (context) => SingleChildScrollView(
              //     child: AddressPage(),
              //   ),
              // );
            },
            child: Text(
              'Адреса не найдены ',
              style: TextStyle(
                color: Color.fromRGBO(23, 23, 23, 1),
                fontSize: 16.sp,
              ),
            ),
          );
        } else {
          // Data exists
          List<Address> addresses = snapshot.data!;
          // Use firstWhereOrNull to find the address where isMain == true
          Address? mainAddress = addresses.firstWhereOrNull(
                (address) => address.isMain,
          );

          if (mainAddress != null) {
            // Display the main address
            return Text(
              mainAddress.address,
              style: TextStyle(
                color: Color.fromRGBO(23, 23, 23, 1),
                fontSize: 16.sp,
              ),
            );
          } else {
            // No main address found
            return Text(
              'Ma\'lumot topilmadi',
              style: TextStyle(
                color: Color.fromRGBO(23, 23, 23, 1),
                fontSize: 16.sp,
              ),
            );
          }
        }
      },
    );
  }


}