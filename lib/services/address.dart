import 'package:hive/hive.dart';

part 'address.g.dart';

@HiveType(typeId: 0)
class Address {
  @HiveField(0)
  final String city;

  @HiveField(1)
  final String door;

  @HiveField(2)
  final String codeDoor;

  @HiveField(3)
  final String floor;

  @HiveField(4)
  final String doorNumber;

  @HiveField(5)
  final String comment;

  @HiveField(6)
  final bool isMain;

  Address(this.city, this.door, this.codeDoor, this.floor, this.doorNumber, this.comment,this.isMain);
}

