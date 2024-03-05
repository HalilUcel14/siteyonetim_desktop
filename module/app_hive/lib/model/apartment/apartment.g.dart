// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apartment.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TBLApartmentAdapter extends TypeAdapter<TBLApartment> {
  @override
  final int typeId = 3;

  @override
  TBLApartment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TBLApartment(
      uid: fields[0] as String?,
      userUid: fields[1] as String?,
      name: fields[2] as String?,
      address: fields[3] as String?,
      floorCount: fields[4] as int?,
      flatsCount: fields[5] as int?,
      buildYear: fields[6] as DateTime?,
      haveElevator: fields[7] as bool?,
      isActive: fields[8] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, TBLApartment obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.userUid)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.floorCount)
      ..writeByte(5)
      ..write(obj.flatsCount)
      ..writeByte(6)
      ..write(obj.buildYear)
      ..writeByte(7)
      ..write(obj.haveElevator)
      ..writeByte(8)
      ..write(obj.isActive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TBLApartmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
