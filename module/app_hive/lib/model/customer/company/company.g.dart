// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TBLCompanyAdapter extends TypeAdapter<TBLCompany> {
  @override
  final int typeId = 8;

  @override
  TBLCompany read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TBLCompany(
      uid: fields[0] as String?,
      userUid: fields[1] as String?,
      name: fields[2] as String?,
      identityNo: fields[4] as String?,
      email: fields[3] as String?,
      phone: fields[5] as String?,
      address: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TBLCompany obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.userUid)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.identityNo)
      ..writeByte(5)
      ..write(obj.phone)
      ..writeByte(6)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TBLCompanyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
