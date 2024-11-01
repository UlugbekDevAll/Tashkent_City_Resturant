

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashkentcityresturant/core/configs/theme/app_colors.dart';
import 'package:tashkentcityresturant/main.dart';
import 'package:tashkentcityresturant/pages/profile/widget/address/widgets/address_item.dart';

import '../../../services/address.dart';
import '../../../services/address_hive.dart';
import '../../home/widgets/address_display_widget.dart';
import 'address/widgets/add_address_widget.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final AddressHive addressHive = AddressHive();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(32),topLeft: Radius.circular(32))
        ),
        child: Column(
          children: [
            SizedBox(height: 16.h,),
            Text("Адреса",style: TextStyle(color: AppColors.primaryColor,fontSize: 20.sp,fontWeight: FontWeight.w400),),

            SizedBox(height: 24.h,),
            FutureBuilder<List<Address>>(
              future: addressHive.loadAddresses(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {

                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {

                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {

                  List<Address> addresses = snapshot.data ?? [];

                  if (addresses.isEmpty) {
                    return Center(child: Text('Адреса не найдены'));
                  }


                  return ListView.builder(
                    itemCount: addresses.length,
                    itemBuilder: (context, index) {
                      Address address = addresses[index];
                      return ListTile(
                        title: Text(address.address),
                        subtitle: Text(address.isMain ? 'Main Address' : 'Secondary Address'),
                      );
                    },
                  );
                }
              },
            ),

            AddressItem(),
            SizedBox(height: 16.h,),
            AddAddressWidget(),
            SizedBox(height: 27.h,),
          ],
        ),
      ),
    );
  }
}
