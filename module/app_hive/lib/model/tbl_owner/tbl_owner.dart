import 'dart:convert';

import 'package:app_hive/app_hive.dart';
import 'package:hive/hive.dart';

part 'tbl_owner.g.dart';

@HiveType(typeId: HiveTypes.ownerType)
final class TBLOwner extends BaseDBModel<TBLOwner> {
  @HiveField(10)
  final String? userUid;
  @HiveField(11)
  final TBLCustomer? customer;

  TBLOwner({
    required super.isActive,
    required super.uid,
    required this.userUid,
    required this.customer,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.createdBy,
    super.updatedBy,
    super.deletedBy,
    super.isDelete,
    super.tags,
  });

  TBLOwner.empty({
    this.userUid,
    this.customer,
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
  TBLOwner fromJson(Map<String, dynamic> json) {
    return TBLOwner(
      uid: json['uid'],
      userUid: json['userUid'],
      customer: TBLCustomer.fromJson(json['customer']),
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

  factory TBLOwner.fromJson(Map<String, dynamic> json) {
    return TBLOwner(
      uid: json['uid'],
      userUid: json['userUid'],
      customer: TBLCustomer.fromJson(json['customer']),
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
        customer,
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
      'customer': customer?.toJson(),
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
  TBLOwner copyWith(
      {String? uid,
      String? userUid,
      TBLCustomer? customer,
      bool? isActive,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? deletedAt,
      String? createdBy,
      String? updatedBy,
      String? deletedBy,
      bool? isDelete,
      List<String>? tags}) {
    return TBLOwner(
      uid: uid ?? this.uid,
      userUid: userUid ?? this.userUid,
      customer: customer ?? this.customer,
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
