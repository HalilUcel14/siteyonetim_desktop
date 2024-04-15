import 'dart:convert';

import 'package:app_hive/app_hive.dart';
import 'package:hive/hive.dart';

part 'customer.g.dart';

@HiveType(typeId: HiveTypes.customerType)
final class TBLCustomer extends BaseDBModel<TBLCustomer> {
  @HiveField(10)
  final String? userUid;
  @HiveField(11)
  final String? name;
  @HiveField(12)
  final String? email;
  @HiveField(13)
  final String? identityNo;
  @HiveField(14)
  final String? phone;
  @HiveField(15)
  final String? address;
  @HiveField(16)
  final bool? isCompany;
  @HiveField(17)
  final String? taxOffice;
  @HiveField(18)
  final String? taxNo;

  TBLCustomer({
    required super.isActive,
    required super.uid,
    required this.userUid,
    required this.name,
    required this.email,
    required this.identityNo,
    required this.phone,
    required this.address,
    required this.isCompany,
    required this.taxOffice,
    required this.taxNo,
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
  TBLCustomer fromJson(Map<String, dynamic> json) {
    return TBLCustomer(
      uid: json['uid'],
      userUid: json['userUid'],
      name: json['name'],
      email: json['email'],
      identityNo: json['identityNo'],
      phone: json['phone'],
      address: json['address'],
      isCompany: bool.tryParse(json['isCompany']),
      taxOffice: json['taxOffice'],
      taxNo: json['taxNo'],
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

  TBLCustomer.empty({
    this.userUid,
    this.name,
    this.email,
    this.identityNo,
    this.phone,
    this.address,
    this.isCompany,
    this.taxOffice,
    this.taxNo,
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

  factory TBLCustomer.fromJson(Map<String, dynamic> json) {
    return TBLCustomer(
      uid: json['uid'],
      userUid: json['userUid'],
      name: json['name'],
      email: json['email'],
      identityNo: json['identityNo'],
      phone: json['phone'],
      address: json['address'],
      isCompany: bool.tryParse(json['isCompany']),
      taxOffice: json['taxOffice'],
      taxNo: json['taxNo'],
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
        name,
        email,
        identityNo,
        phone,
        address,
        isCompany,
        taxOffice,
        taxNo,
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
      'name': name,
      'email': email,
      'identityNo': identityNo,
      'phone': phone,
      'address': address,
      'isCompany': isCompany?.toString(),
      'taxOffice': taxOffice,
      'taxNo': taxNo,
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
  TBLCustomer copyWith(
      {String? uid,
      String? userUid,
      String? name,
      String? email,
      String? identityNo,
      String? phone,
      String? address,
      bool? isCompany,
      String? taxOffice,
      String? taxNo,
      bool? isActive,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? deletedAt,
      String? createdBy,
      String? updatedBy,
      String? deletedBy,
      bool? isDelete,
      List<String>? tags}) {
    return TBLCustomer(
      uid: uid ?? this.uid,
      userUid: userUid ?? this.userUid,
      name: name ?? this.name,
      email: email ?? this.email,
      identityNo: identityNo ?? this.identityNo,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      isCompany: isCompany ?? this.isCompany,
      taxOffice: taxOffice ?? this.taxOffice,
      taxNo: taxNo ?? this.taxNo,
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
