// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppMetaDataAdapter extends TypeAdapter<AppMetaData> {
  @override
  final int typeId = 1;

  @override
  AppMetaData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppMetaData(
      id: fields[0] as String?,
      user: fields[1] as HiveUser?,
      lastSign: fields[2] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, AppMetaData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.user)
      ..writeByte(2)
      ..write(obj.lastSign);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppMetaDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
