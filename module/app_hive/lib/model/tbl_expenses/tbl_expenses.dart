import 'dart:convert';

import 'package:app_hive/app_hive.dart';
import 'package:app_hive/index.dart';
import 'package:hive/hive.dart';

part 'tbl_expenses.g.dart';

@HiveType(typeId: HiveTypes.expenses)
final class TBLExpenses extends BaseDBModel<TBLExpenses> {
  @HiveField(10)
  final String? userUid;
  @HiveField(11)
  final String? expenseTypeUid;
  @HiveField(12)
  final String? apartmentUid;
  @HiveField(13)
  final String? flatUid;
  @HiveField(14)
  final double? amount;
  @HiveField(15)
  final DateTime? date;
  @HiveField(16)
  final String? description;

  TBLExpenses({
    required super.isActive,
    required super.uid,
    required this.userUid,
    required this.expenseTypeUid,
    required this.apartmentUid,
    required this.flatUid,
    required this.amount,
    required this.date,
    required this.description,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.createdBy,
    super.updatedBy,
    super.deletedBy,
    super.isDelete,
    super.tags,
  });

  TBLExpenses.empty({
    this.userUid,
    this.expenseTypeUid,
    this.apartmentUid,
    this.flatUid,
    this.amount,
    this.date,
    this.description,
    super.uid,
    super.isActive,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.createdBy,
    super.updatedBy,
    super.deletedBy,
    super.isDelete,
    super.tags,
  });

  @override
  TBLExpenses fromJson(Map<String, dynamic> json) {
    return TBLExpenses(
      uid: json['uid'],
      userUid: json['userUid'],
      expenseTypeUid: json['expenseTypeUid'],
      apartmentUid: json['apartmentUid'],
      flatUid: json['flatUid'],
      amount: double.tryParse(json['amount']),
      date: DateTime.tryParse(json['date']),
      description: json['description'],
      isActive: bool.tryParse(json['isActive']),
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
      deletedAt: DateTime.tryParse(json['deletedAt']),
      createdBy: json['createdBy'],
      updatedBy: json['updatedBy'],
      deletedBy: json['deletedBy'],
      isDelete: bool.tryParse(json['isDelete']),
      tags: jsonDecode(json['tags']),
    );
  }

  factory TBLExpenses.fromJson(Map<String, dynamic> json) {
    return TBLExpenses(
      uid: json['uid'],
      userUid: json['userUid'],
      expenseTypeUid: json['expenseTypeUid'],
      apartmentUid: json['apartmentUid'],
      flatUid: json['flatUid'],
      amount: double.tryParse(json['amount']),
      date: DateTime.tryParse(json['date']),
      description: json['description'],
      isActive: bool.tryParse(json['isActive']),
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
      deletedAt: DateTime.tryParse(json['deletedAt']),
      createdBy: json['createdBy'],
      updatedBy: json['updatedBy'],
      deletedBy: json['deletedBy'],
      isDelete: bool.tryParse(json['isDelete']),
      tags: jsonDecode(json['tags']),
    );
  }

  @override
  List<Object?> get props => [
        uid,
        userUid,
        expenseTypeUid,
        apartmentUid,
        flatUid,
        amount,
        date,
        description,
        isActive,
        createdAt,
        updatedAt,
        deletedAt,
        createdBy,
        updatedBy,
        deletedBy,
        isDelete,
        tags,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'userUid': userUid,
      'expenseTypeUid': expenseTypeUid,
      'apartmentUid': apartmentUid,
      'flatUid': flatUid,
      'amount': amount?.toString(),
      'date': date?.toIso8601String(),
      'description': description,
      'isActive': isActive?.toString(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'createdBy': createdBy,
      'updatedBy': updatedBy,
      'deletedBy': deletedBy,
      'isDelete': isDelete?.toString(),
      'tags': jsonEncode(tags),
    };
  }

  @override
  TBLExpenses copyWith(
      {String? uid,
      String? userUid,
      String? expenseTypeUid,
      String? apartmentUid,
      String? flatUid,
      double? amount,
      DateTime? date,
      String? description,
      bool? isActive,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? deletedAt,
      String? createdBy,
      String? updatedBy,
      String? deletedBy,
      bool? isDelete,
      List<String>? tags}) {
    return TBLExpenses(
      uid: uid ?? this.uid,
      userUid: userUid ?? this.userUid,
      expenseTypeUid: expenseTypeUid ?? this.expenseTypeUid,
      apartmentUid: apartmentUid ?? this.apartmentUid,
      flatUid: flatUid ?? this.flatUid,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      deletedBy: deletedBy ?? this.deletedBy,
      isDelete: isDelete ?? this.isDelete,
      tags: tags ?? this.tags,
    );
  }
}
