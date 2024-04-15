// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tbl_subscription.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TBLSubscriptionAdapter extends TypeAdapter<TBLSubscription> {
  @override
  final int typeId = 14;

  @override
  TBLSubscription read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TBLSubscription(
      isActive: fields[1] as bool?,
      uid: fields[0] as String?,
      flatUid: fields[11] as String?,
      userUid: fields[10] as String?,
      waterSubsNo: fields[12] as String?,
      electricitySubsNo: fields[13] as String?,
      gasSubsNo: fields[14] as String?,
      internetSubsNo: fields[15] as String?,
      tvSubsNo: fields[16] as String?,
      phoneSubsNo: fields[17] as String?,
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
  void write(BinaryWriter writer, TBLSubscription obj) {
    writer
      ..writeByte(18)
      ..writeByte(10)
      ..write(obj.userUid)
      ..writeByte(11)
      ..write(obj.flatUid)
      ..writeByte(12)
      ..write(obj.waterSubsNo)
      ..writeByte(13)
      ..write(obj.electricitySubsNo)
      ..writeByte(14)
      ..write(obj.gasSubsNo)
      ..writeByte(15)
      ..write(obj.internetSubsNo)
      ..writeByte(16)
      ..write(obj.tvSubsNo)
      ..writeByte(17)
      ..write(obj.phoneSubsNo)
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
      other is TBLSubscriptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
