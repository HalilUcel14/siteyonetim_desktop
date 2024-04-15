// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TBLCustomerAdapter extends TypeAdapter<TBLCustomer> {
  @override
  final int typeId = 9;

  @override
  TBLCustomer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TBLCustomer(
      isActive: fields[1] as bool?,
      uid: fields[0] as String?,
      userUid: fields[10] as String?,
      name: fields[11] as String?,
      email: fields[12] as String?,
      identityNo: fields[13] as String?,
      phone: fields[14] as String?,
      address: fields[15] as String?,
      isCompany: fields[16] as bool?,
      taxOffice: fields[17] as String?,
      taxNo: fields[18] as String?,
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
  void write(BinaryWriter writer, TBLCustomer obj) {
    writer
      ..writeByte(19)
      ..writeByte(10)
      ..write(obj.userUid)
      ..writeByte(11)
      ..write(obj.name)
      ..writeByte(12)
      ..write(obj.email)
      ..writeByte(13)
      ..write(obj.identityNo)
      ..writeByte(14)
      ..write(obj.phone)
      ..writeByte(15)
      ..write(obj.address)
      ..writeByte(16)
      ..write(obj.isCompany)
      ..writeByte(17)
      ..write(obj.taxOffice)
      ..writeByte(18)
      ..write(obj.taxNo)
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
      other is TBLCustomerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
