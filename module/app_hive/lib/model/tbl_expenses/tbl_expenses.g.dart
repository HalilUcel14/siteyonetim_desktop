// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tbl_expenses.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TBLExpensesAdapter extends TypeAdapter<TBLExpenses> {
  @override
  final int typeId = 13;

  @override
  TBLExpenses read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TBLExpenses(
      isActive: fields[1] as bool?,
      uid: fields[0] as String?,
      userUid: fields[10] as String?,
      expenseTypeUid: fields[11] as String?,
      apartmentUid: fields[12] as String?,
      flatUid: fields[13] as String?,
      amount: fields[14] as double?,
      date: fields[15] as DateTime?,
      description: fields[16] as String?,
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
  void write(BinaryWriter writer, TBLExpenses obj) {
    writer
      ..writeByte(17)
      ..writeByte(10)
      ..write(obj.userUid)
      ..writeByte(11)
      ..write(obj.expenseTypeUid)
      ..writeByte(12)
      ..write(obj.apartmentUid)
      ..writeByte(13)
      ..write(obj.flatUid)
      ..writeByte(14)
      ..write(obj.amount)
      ..writeByte(15)
      ..write(obj.date)
      ..writeByte(16)
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
      other is TBLExpensesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
