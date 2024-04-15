// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tbl_contracts.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TBLContractsAdapter extends TypeAdapter<TBLContracts> {
  @override
  final int typeId = 10;

  @override
  TBLContracts read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TBLContracts(
      isActive: fields[1] as bool?,
      uid: fields[0] as String?,
      userUid: fields[10] as String?,
      apartmentUid: fields[11] as String?,
      flatUid: fields[12] as String?,
      tenantUid: fields[13] as String?,
      ownerUid: fields[14] as String?,
      startDate: fields[15] as DateTime?,
      endDate: fields[16] as DateTime?,
      rent: fields[17] as double?,
      deposit: fields[18] as double?,
      commission: fields[19] as double?,
      tax: fields[20] as double?,
      total: fields[21] as double?,
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
  void write(BinaryWriter writer, TBLContracts obj) {
    writer
      ..writeByte(22)
      ..writeByte(10)
      ..write(obj.userUid)
      ..writeByte(11)
      ..write(obj.apartmentUid)
      ..writeByte(12)
      ..write(obj.flatUid)
      ..writeByte(13)
      ..write(obj.tenantUid)
      ..writeByte(14)
      ..write(obj.ownerUid)
      ..writeByte(15)
      ..write(obj.startDate)
      ..writeByte(16)
      ..write(obj.endDate)
      ..writeByte(17)
      ..write(obj.rent)
      ..writeByte(18)
      ..write(obj.deposit)
      ..writeByte(19)
      ..write(obj.commission)
      ..writeByte(20)
      ..write(obj.tax)
      ..writeByte(21)
      ..write(obj.total)
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
      other is TBLContractsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
