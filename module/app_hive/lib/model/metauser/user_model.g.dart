// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveUserAdapter extends TypeAdapter<HiveUser> {
  @override
  final int typeId = 2;

  @override
  HiveUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveUser(
      isActive: fields[1] as bool?,
      uid: fields[0] as String?,
      username: fields[10] as String?,
      emailAddress: fields[11] as String?,
      password: fields[12] as String?,
      userRole: fields[13] as String?,
      plans: fields[14] as String?,
      createdAt: fields[5] as DateTime?,
      updatedAt: fields[6] as DateTime?,
      createdBy: fields[3] as String?,
      updatedBy: fields[4] as String?,
      deletedBy: fields[7] as String?,
      deletedAt: fields[8] as DateTime?,
      isDelete: fields[2] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveUser obj) {
    writer
      ..writeByte(15)
      ..writeByte(10)
      ..write(obj.username)
      ..writeByte(11)
      ..write(obj.emailAddress)
      ..writeByte(12)
      ..write(obj.password)
      ..writeByte(13)
      ..write(obj.userRole)
      ..writeByte(14)
      ..write(obj.plans)
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
      other is HiveUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
