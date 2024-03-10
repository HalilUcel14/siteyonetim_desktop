// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'individual.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TBLIndividualAdapter extends TypeAdapter<TBLIndividual> {
  @override
  final int typeId = 7;

  @override
  TBLIndividual read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TBLIndividual(
      uid: fields[0] as String?,
      name: fields[1] as String?,
      identityNo: fields[3] as String?,
      email: fields[2] as String?,
      phone: fields[4] as String?,
      address: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TBLIndividual obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.identityNo)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TBLIndividualAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
