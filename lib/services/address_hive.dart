

import 'package:hive/hive.dart';
import 'package:tashkentcityresturant/services/address.dart';

class AddressHive {
  Future<void> saveAddresses(List<Address> addresses) async {
    var box = await Hive.openBox<Address>('addressBox');
    await box.clear();
    for (var i = 0; i < addresses.length; i++) {
      await box.put(i, addresses[i]);
    }
  }

  Future<List<Address>> loadAddresses() async {
    final box = await Hive.openBox<Address>('addressBox');
    return box.values.toList(); // Returns a list of Address objects
  }
}





