// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kiraci.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TBLKiraciAdapter extends TypeAdapter<TBLKiraci> {
  @override
  final int typeId = 5;

  @override
  TBLKiraci read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TBLKiraci(
      uid: fields[0] as String?,
      userUid: fields[1] as String?,
      customer: fields[2] as CustomerModel<dynamic>?,
      isActive: fields[3] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, TBLKiraci obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.userUid)
      ..writeByte(2)
      ..write(obj.customer)
      ..writeByte(3)
      ..write(obj.isActive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TBLKiraciAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
