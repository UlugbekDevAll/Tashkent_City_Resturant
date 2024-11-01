

import 'package:hive/hive.dart';
import 'package:tashkentcityresturant/services/address.dart';


class AddressHive {
  Future<void> saveAddresses(List<Address> addresses) async {
    var box = await Hive.openBox<List<Address>>('addressBox');
    await box.put('addresses', addresses);
  }

  Future<List<Address>> loadAddresses() async {
    var box = await Hive.openBox<List<Address>>('addressBox');
    return box.get('addresses', defaultValue: []) ?? [];
  }
}




