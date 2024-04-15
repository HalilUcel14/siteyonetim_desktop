import 'dart:convert';

import 'package:hive/hive.dart';

import '../../index.dart';

part 'apartment.g.dart';

@HiveType(typeId: HiveTypes.apartmentType)
final class TBLApartment extends BaseDBModel<TBLApartment> {
  @HiveField(10)
  final String? userUid;
  @HiveField(11)
  final String? name;
  @HiveField(12)
  final String? address;
  @HiveField(13)
  final int? floor;
  @HiveField(14)
  final int? flats;
  @HiveField(15)
  final DateTime? buildYear;
  @HiveField(16)
  final bool? haveElevator;

  TBLApartment({
    required super.uid,
    required super.isActive,
    required this.userUid,
    required this.name,
    required this.address,
    required this.floor,
    required this.flats,
    required this.buildYear,
    required this.haveElevator,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.createdBy,
    super.updatedBy,
    super.deletedBy,
    super.isDelete,
    super.tags,
  });

  TBLApartment.empty({
    this.userUid,
    this.name,
    this.address,
    this.floor,
    this.flats,
    this.buildYear,
    this.haveElevator,
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
  TBLApartment fromJson(Map<String, dynamic> json) {
    return TBLApartment(
      uid: json['uid'],
      userUid: json['userUid'],
      name: json['name'],
      address: json['address'],
      floor: int.tryParse(json['floor']),
      flats: int.tryParse(json['flats']),
      buildYear: DateTime.tryParse(json['buildYear']),
      haveElevator: bool.tryParse(json['haveElevator']),
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

  factory TBLApartment.fromJson(Map<String, dynamic> json) {
    return TBLApartment(
      uid: json['uid'],
      userUid: json['userUid'],
      name: json['name'],
      address: json['address'],
      floor: int.tryParse(json['floor']),
      flats: int.tryParse(json['flats']),
      buildYear: DateTime.tryParse(json['buildYear']),
      haveElevator: bool.tryParse(json['haveElevator']),
      isActive: bool.tryParse(json['isActive']),
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
      deletedAt: DateTime.tryParse(json['deletedAt']),
      createdBy: json['createdBy'],
      updatedBy: json['updatedBy'],
      deletedBy: json['deletedBy'],
      isDelete: bool.tryParse(json['isDelete']),
      tags: jsonDecode(json['tags']), // List<String>.from(json['tags']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'userUid': userUid,
      'name': name,
      'address': address,
      'floor': floor?.toString(),
      'flats': flats?.toString(),
      'buildYear': buildYear?.toIso8601String(),
      'haveElevator': haveElevator?.toString(),
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
  List<Object?> get props => [
        uid,
        userUid,
        name,
        address,
        floor,
        flats,
        buildYear,
        haveElevator,
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
  TBLApartment copyWith({
    String? uid,
    bool? isActive,
    String? userUid,
    String? name,
    String? address,
    int? floor,
    int? flats,
    DateTime? buildYear,
    bool? haveElevator,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    String? createdBy,
    String? updatedBy,
    String? deletedBy,
    bool? isDelete,
    List<String>? tags,
  }) {
    return TBLApartment(
      uid: uid ?? this.uid,
      isActive: isActive ?? this.isActive,
      userUid: userUid ?? this.userUid,
      name: name ?? this.name,
      address: address ?? this.address,
      floor: floor ?? this.floor,
      flats: flats ?? this.flats,
      buildYear: buildYear ?? this.buildYear,
      haveElevator: haveElevator ?? this.haveElevator,
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
