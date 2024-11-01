import 'package:hive/hive.dart';

part 'address.g.dart';

@HiveType(typeId: 0)
class Address {
  @HiveField(0)
  final String address;

  @HiveField(1)
  final bool isMain;

  Address(this.address, this.isMain);
}

