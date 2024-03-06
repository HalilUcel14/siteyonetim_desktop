// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daire.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TBLDaireAdapter extends TypeAdapter<TBLDaire> {
  @override
  final int typeId = 4;

  @override
  TBLDaire read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TBLDaire(
      uid: fields[0] as String?,
      apartmentUid: fields[1] as String?,
      floor: fields[2] as int?,
      flats: fields[3] as int?,
      squareMeter: fields[4] as int?,
      netSquareMeter: fields[5] as int?,
      roomCount: fields[6] as int?,
      owner: fields[7] as TBLEvSahibi?,
      tenant: fields[8] as TBLKiraci?,
    );
  }

  @override
  void write(BinaryWriter writer, TBLDaire obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.apartmentUid)
      ..writeByte(2)
      ..write(obj.floor)
      ..writeByte(3)
      ..write(obj.flats)
      ..writeByte(4)
      ..write(obj.squareMeter)
      ..writeByte(5)
      ..write(obj.netSquareMeter)
      ..writeByte(6)
      ..write(obj.roomCount)
      ..writeByte(7)
      ..write(obj.owner)
      ..writeByte(8)
      ..write(obj.tenant);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TBLDaireAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
