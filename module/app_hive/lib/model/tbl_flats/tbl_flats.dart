import 'dart:convert';

import 'package:app_hive/app_hive.dart';
import 'package:hive/hive.dart';

import '../../index.dart';

part 'tbl_flats.g.dart';

@HiveType(typeId: HiveTypes.flatType)
final class TBLFlats extends BaseDBModel<TBLFlats> {
  @HiveField(10)
  final String? userUid;
  @HiveField(11)
  final String? apartmentUid;
  @HiveField(12)
  final String? contractUid;
  @HiveField(13)
  final String? subscriptionUid;
  @HiveField(14)
  final int? floor;
  @HiveField(15)
  final int? flat;
  @HiveField(16)
  final double? squareMeter;
  @HiveField(17)
  final double? netMeter;
  @HiveField(18)
  final String? roomType;

  TBLFlats({
    required super.isActive,
    required super.uid,
    required this.userUid,
    required this.apartmentUid,
    required this.contractUid,
    required this.subscriptionUid,
    required this.floor,
    required this.flat,
    required this.squareMeter,
    required this.netMeter,
    required this.roomType,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.createdBy,
    super.updatedBy,
    super.deletedBy,
    super.isDelete,
    super.tags,
  });

  TBLFlats.empty({
    this.userUid,
    this.apartmentUid,
    this.contractUid,
    this.subscriptionUid,
    this.floor,
    this.flat,
    this.squareMeter,
    this.netMeter,
    this.roomType,
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
  TBLFlats fromJson(Map<String, dynamic> json) {
    return TBLFlats(
      uid: json['uid'],
      userUid: json['userUid'],
      apartmentUid: json['apartmentUid'],
      contractUid: json['contractUid'],
      subscriptionUid: json['subscriptionUid'],
      floor: int.tryParse(json['floor']),
      flat: int.tryParse(json['flat']),
      squareMeter: double.tryParse(json['squareMeter']),
      netMeter: double.tryParse(json['netMeter']),
      roomType: json['roomType'],
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

  factory TBLFlats.fromJson(Map<String, dynamic> json) {
    return TBLFlats(
      uid: json['uid'],
      userUid: json['userUid'],
      apartmentUid: json['apartmentUid'],
      contractUid: json['contractUid'],
      subscriptionUid: json['subscriptionUid'],
      floor: int.tryParse(json['floor']),
      flat: int.tryParse(json['flat']),
      squareMeter: double.tryParse(json['squareMeter']),
      netMeter: double.tryParse(json['netMeter']),
      roomType: json['roomType'],
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
        contractUid,
        subscriptionUid,
        floor,
        flat,
        squareMeter,
        netMeter,
        roomType,
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
      'contractUid': contractUid,
      'subscriptionUid': subscriptionUid,
      'floor': floor?.toString(),
      'flat': flat?.toString(),
      'squareMeter': squareMeter?.toString(),
      'netMeter': netMeter?.toString(),
      'roomType': roomType,
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
  TBLFlats copyWith(
      {String? uid,
      String? userUid,
      String? apartmentUid,
      String? contractUid,
      String? subscriptionUid,
      int? floor,
      int? flat,
      double? squareMeter,
      double? netMeter,
      String? roomType,
      bool? isActive,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? deletedAt,
      String? createdBy,
      String? updatedBy,
      String? deletedBy,
      bool? isDelete,
      List<String>? tags}) {
    return TBLFlats(
      uid: uid ?? this.uid,
      userUid: userUid ?? this.userUid,
      apartmentUid: apartmentUid ?? this.apartmentUid,
      contractUid: contractUid ?? this.contractUid,
      subscriptionUid: subscriptionUid ?? this.subscriptionUid,
      floor: floor ?? this.floor,
      flat: flat ?? this.flat,
      squareMeter: squareMeter ?? this.squareMeter,
      netMeter: netMeter ?? this.netMeter,
      roomType: roomType ?? this.roomType,
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
