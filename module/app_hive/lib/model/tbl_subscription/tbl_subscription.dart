import 'dart:convert';

import 'package:app_hive/app_hive.dart';
import 'package:app_hive/index.dart';
import 'package:hive/hive.dart';

part 'tbl_subscription.g.dart';

@HiveType(typeId: HiveTypes.subscription)
final class TBLSubscription extends BaseDBModel<TBLSubscription> {
  @HiveField(10)
  final String? userUid;
  @HiveField(11)
  final String? flatUid;
  @HiveField(12)
  final String? waterSubsNo;
  @HiveField(13)
  final String? electricitySubsNo;
  @HiveField(14)
  final String? gasSubsNo;
  @HiveField(15)
  final String? internetSubsNo;
  @HiveField(16)
  final String? tvSubsNo;
  @HiveField(17)
  final String? phoneSubsNo;

  TBLSubscription({
    required super.isActive,
    required super.uid,
    required this.flatUid,
    required this.userUid,
    required this.waterSubsNo,
    required this.electricitySubsNo,
    required this.gasSubsNo,
    required this.internetSubsNo,
    required this.tvSubsNo,
    required this.phoneSubsNo,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.createdBy,
    super.updatedBy,
    super.deletedBy,
    super.isDelete,
    super.tags,
  });

  TBLSubscription.empty({
    this.userUid,
    this.flatUid,
    this.waterSubsNo,
    this.electricitySubsNo,
    this.gasSubsNo,
    this.internetSubsNo,
    this.tvSubsNo,
    this.phoneSubsNo,
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
  TBLSubscription fromJson(Map<String, dynamic> json) {
    return TBLSubscription(
      uid: json['uid'],
      userUid: json['userUid'],
      flatUid: json['flatUid'],
      waterSubsNo: json['waterSubsNo'],
      electricitySubsNo: json['electricitySubsNo'],
      gasSubsNo: json['gasSubsNo'],
      internetSubsNo: json['internetSubsNo'],
      tvSubsNo: json['tvSubsNo'],
      phoneSubsNo: json['phoneSubsNo'],
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

  factory TBLSubscription.fromJson(Map<String, dynamic> json) {
    return TBLSubscription(
      uid: json['uid'],
      userUid: json['userUid'],
      flatUid: json['flatUid'],
      waterSubsNo: json['waterSubsNo'],
      electricitySubsNo: json['electricitySubsNo'],
      gasSubsNo: json['gasSubsNo'],
      internetSubsNo: json['internetSubsNo'],
      tvSubsNo: json['tvSubsNo'],
      phoneSubsNo: json['phoneSubsNo'],
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
        flatUid,
        waterSubsNo,
        electricitySubsNo,
        gasSubsNo,
        internetSubsNo,
        tvSubsNo,
        phoneSubsNo,
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
      'flatUid': flatUid,
      'waterSubsNo': waterSubsNo,
      'electricitySubsNo': electricitySubsNo,
      'gasSubsNo': gasSubsNo,
      'internetSubsNo': internetSubsNo,
      'tvSubsNo': tvSubsNo,
      'phoneSubsNo': phoneSubsNo,
      'isActive': isActive,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'createdBy': createdBy,
      'updatedBy': updatedBy,
      'deletedBy': deletedBy,
      'isDelete': isDelete,
      'tags': jsonEncode(tags),
    };
  }

  @override
  TBLSubscription copyWith(
      {String? uid,
      String? userUid,
      String? flatUid,
      String? waterSubsNo,
      String? electricitySubsNo,
      String? gasSubsNo,
      String? internetSubsNo,
      String? tvSubsNo,
      String? phoneSubsNo,
      bool? isActive,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? deletedAt,
      String? createdBy,
      String? updatedBy,
      String? deletedBy,
      bool? isDelete,
      List<String>? tags}) {
    return TBLSubscription(
      uid: uid ?? this.uid,
      userUid: userUid ?? this.userUid,
      flatUid: flatUid ?? this.flatUid,
      waterSubsNo: waterSubsNo ?? this.waterSubsNo,
      electricitySubsNo: electricitySubsNo ?? this.electricitySubsNo,
      gasSubsNo: gasSubsNo ?? this.gasSubsNo,
      internetSubsNo: internetSubsNo ?? this.internetSubsNo,
      tvSubsNo: tvSubsNo ?? this.tvSubsNo,
      phoneSubsNo: phoneSubsNo ?? this.phoneSubsNo,
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
