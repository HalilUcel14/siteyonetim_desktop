// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tbl_tags.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TBLTagsAdapter extends TypeAdapter<TBLTags> {
  @override
  final int typeId = 17;

  @override
  TBLTags read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TBLTags(
      uid: fields[0] as String?,
      isActive: fields[1] as bool?,
      userUid: fields[10] as String?,
      tag: fields[11] as String?,
      color: fields[12] as Color?,
      description: fields[13] as String?,
      createdAt: fields[5] as DateTime?,
      updatedAt: fields[6] as DateTime?,
      deletedAt: fields[8] as DateTime?,
      createdBy: fields[3] as String?,
      updatedBy: fields[4] as String?,
      deletedBy: fields[7] as String?,
      isDelete: fields[2] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, TBLTags obj) {
    writer
      ..writeByte(14)
      ..writeByte(10)
      ..write(obj.userUid)
      ..writeByte(11)
      ..write(obj.tag)
      ..writeByte(12)
      ..write(obj.color)
      ..writeByte(13)
      ..write(obj.description)
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
      other is TBLTagsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
