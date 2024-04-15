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
      isActive: fields[1] as bool?,
      userUid: fields[10] as String?,
      name: fields[11] as String?,
      address: fields[12] as String?,
      floor: fields[13] as int?,
      flats: fields[14] as int?,
      buildYear: fields[15] as DateTime?,
      haveElevator: fields[16] as bool?,
      createdAt: fields[5] as DateTime?,
      updatedAt: fields[6] as DateTime?,
      deletedAt: fields[8] as DateTime?,
      createdBy: fields[3] as String?,
      updatedBy: fields[4] as String?,
      deletedBy: fields[7] as String?,
      isDelete: fields[2] as bool?,
      tags: (fields[9] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, TBLApartment obj) {
    writer
      ..writeByte(17)
      ..writeByte(10)
      ..write(obj.userUid)
      ..writeByte(11)
      ..write(obj.name)
      ..writeByte(12)
      ..write(obj.address)
      ..writeByte(13)
      ..write(obj.floor)
      ..writeByte(14)
      ..write(obj.flats)
      ..writeByte(15)
      ..write(obj.buildYear)
      ..writeByte(16)
      ..write(obj.haveElevator)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.isActive)
      ..writeByte(2)
      ..write(obj.isDelete)
      ..writeByte(3)
      ..write(obj.createdBy)
      ..writeByte(4)
      ..write(obj.updatedBy)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.updatedAt)
      ..writeByte(7)
      ..write(obj.deletedBy)
      ..writeByte(8)
      ..write(obj.deletedAt)
      ..writeByte(9)
      ..write(obj.tags);
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
