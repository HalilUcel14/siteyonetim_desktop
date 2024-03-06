// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ev_sahibi.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TBLEvSahibiAdapter extends TypeAdapter<TBLEvSahibi> {
  @override
  final int typeId = 6;

  @override
  TBLEvSahibi read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TBLEvSahibi(
      uid: fields[0] as String?,
      userUid: fields[1] as String?,
      customer: fields[2] as CustomerModel<dynamic>?,
    );
  }

  @override
  void write(BinaryWriter writer, TBLEvSahibi obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.userUid)
      ..writeByte(2)
      ..write(obj.customer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TBLEvSahibiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
