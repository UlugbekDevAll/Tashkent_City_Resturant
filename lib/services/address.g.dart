// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressAdapter extends TypeAdapter<Address> {
  @override
  final int typeId = 0;

  @override
  Address read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Address(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as bool
    );
  }

  @override
  void write(BinaryWriter writer, Address obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.city)
      ..writeByte(1)
      ..write(obj.door)
      ..writeByte(2)
      ..write(obj.codeDoor)
      ..writeByte(3)
      ..write(obj.floor)
      ..writeByte(4)
      ..write(obj.doorNumber)
      ..writeByte(5)
      ..write(obj.comment)
      ..writeByte(6)
      ..write(obj.isMain);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
