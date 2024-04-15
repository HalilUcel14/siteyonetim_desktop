// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tbl_announcement.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TBLAnnouncementAdapter extends TypeAdapter<TBLAnnouncement> {
  @override
  final int typeId = 18;

  @override
  TBLAnnouncement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TBLAnnouncement(
      uid: fields[0] as String?,
      isActive: fields[1] as bool?,
      userUid: fields[10] as String?,
      apartmentUid: (fields[11] as List?)?.cast<String>(),
      title: fields[12] as String?,
      content: fields[13] as String?,
      date: fields[14] as DateTime?,
      isPublished: fields[15] as bool?,
      isDelete: fields[2] as bool?,
      createdBy: fields[3] as String?,
      updatedBy: fields[4] as String?,
      createdAt: fields[5] as DateTime?,
      updatedAt: fields[6] as DateTime?,
      deletedBy: fields[7] as String?,
      deletedAt: fields[8] as DateTime?,
      tags: (fields[9] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, TBLAnnouncement obj) {
    writer
      ..writeByte(16)
      ..writeByte(10)
      ..write(obj.userUid)
      ..writeByte(11)
      ..write(obj.apartmentUid)
      ..writeByte(12)
      ..write(obj.title)
      ..writeByte(13)
      ..write(obj.content)
      ..writeByte(14)
      ..write(obj.date)
      ..writeByte(15)
      ..write(obj.isPublished)
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
      other is TBLAnnouncementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
