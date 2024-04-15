import 'dart:convert';

import 'package:app_hive/app_hive.dart';
import 'package:app_hive/index.dart';
import 'package:hive/hive.dart';

part 'tbl_contracts.g.dart';

@HiveType(typeId: HiveTypes.contractType)
final class TBLContracts extends BaseDBModel<TBLContracts> {
  @HiveField(10)
  final String? userUid;
  @HiveField(11)
  final String? apartmentUid;
  @HiveField(12)
  final String? flatUid;
  @HiveField(13)
  final String? tenantUid;
  @HiveField(14)
  final String? ownerUid;
  @HiveField(15)
  final DateTime? startDate;
  @HiveField(16)
  final DateTime? endDate;
  @HiveField(17)
  final double? rent;
  @HiveField(18)
  final double? deposit;
  @HiveField(19)
  final double? commission;
  @HiveField(20)
  final double? tax;
  @HiveField(21)
  final double? total;

  TBLContracts({
    required super.isActive,
    required super.uid,
    required this.userUid,
    required this.apartmentUid,
    required this.flatUid,
    this.tenantUid,
    this.ownerUid,
    required this.startDate,
    required this.endDate,
    required this.rent,
    required this.deposit,
    required this.commission,
    required this.tax,
    required this.total,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.createdBy,
    super.updatedBy,
    super.deletedBy,
    super.isDelete,
    super.tags,
  });

  TBLContracts.empty({
    this.userUid,
    this.apartmentUid,
    this.flatUid,
    this.tenantUid,
    this.ownerUid,
    this.startDate,
    this.endDate,
    this.rent,
    this.deposit,
    this.commission,
    this.tax,
    this.total,
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
  TBLContracts fromJson(Map<String, dynamic> json) {
    return TBLContracts(
      uid: json['uid'],
      userUid: json['userUid'],
      apartmentUid: json['apartmentUid'],
      flatUid: json['flatUid'],
      tenantUid: json['tenantUid'],
      ownerUid: json['ownerUid'],
      startDate: DateTime.tryParse(json['startDate']),
      endDate: DateTime.tryParse(json['endDate']),
      rent: double.tryParse(json['rent']),
      deposit: double.tryParse(json['deposit']),
      commission: double.tryParse(json['commission']),
      tax: double.tryParse(json['tax']),
      total: double.tryParse(json['total']),
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

  factory TBLContracts.fromJson(Map<String, dynamic> json) {
    return TBLContracts(
      uid: json['uid'],
      userUid: json['userUid'],
      apartmentUid: json['apartmentUid'],
      flatUid: json['flatUid'],
      tenantUid: json['tenantUid'],
      ownerUid: json['ownerUid'],
      startDate: DateTime.tryParse(json['startDate']),
      endDate: DateTime.tryParse(json['endDate']),
      rent: double.tryParse(json['rent']),
      deposit: double.tryParse(json['deposit']),
      commission: double.tryParse(json['commission']),
      tax: double.tryParse(json['tax']),
      total: double.tryParse(json['total']),
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
        apartmentUid,
        flatUid,
        tenantUid,
        ownerUid,
        startDate,
        endDate,
        rent,
        deposit,
        commission,
        tax,
        total,
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
      'apartmentUid': apartmentUid,
      'flatUid': flatUid,
      'tenantUid': tenantUid,
      'ownerUid': ownerUid,
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'rent': rent?.toString(),
      'deposit': deposit?.toString(),
      'commission': commission?.toString(),
      'tax': tax?.toString(),
      'total': total?.toString(),
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
  TBLContracts copyWith(
      {String? uid,
      String? userUid,
      String? apartmentUid,
      String? flatUid,
      String? tenantUid,
      String? ownerUid,
      DateTime? startDate,
      DateTime? endDate,
      double? rent,
      double? deposit,
      double? commission,
      double? tax,
      double? total,
      bool? isActive,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? deletedAt,
      String? createdBy,
      String? updatedBy,
      String? deletedBy,
      bool? isDelete,
      List<String>? tags}) {
    return TBLContracts(
      uid: uid ?? this.uid,
      userUid: userUid ?? this.userUid,
      apartmentUid: apartmentUid ?? this.apartmentUid,
      flatUid: flatUid ?? this.flatUid,
      tenantUid: tenantUid ?? this.tenantUid,
      ownerUid: ownerUid ?? this.ownerUid,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      rent: rent ?? this.rent,
      deposit: deposit ?? this.deposit,
      commission: commission ?? this.commission,
      tax: tax ?? this.tax,
      total: total ?? this.total,
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
