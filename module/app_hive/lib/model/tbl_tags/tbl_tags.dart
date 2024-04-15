import 'package:app_hive/app_hive.dart';
import 'package:app_hive/index.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'tbl_tags.g.dart';

@HiveType(typeId: HiveTypes.tags)
final class TBLTags extends BaseDBModel<TBLTags> {
  @HiveField(10)
  final String? userUid;
  @HiveField(11)
  final String? tag;
  @HiveField(12)
  final Color? color;
  @HiveField(13)
  final String? description;

  TBLTags({
    required super.uid,
    required super.isActive,
    this.userUid,
    this.tag,
    this.color,
    this.description,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.createdBy,
    super.updatedBy,
    super.deletedBy,
    super.isDelete,
  });

  TBLTags.empty({
    super.uid,
    super.isActive,
    this.userUid,
    this.tag,
    this.color,
    this.description,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.createdBy,
    super.updatedBy,
    super.deletedBy,
    super.isDelete,
  });

  @override
  TBLTags fromJson(Map<String, dynamic> json) {
    return TBLTags(
      uid: json['uid'],
      isActive: bool.tryParse(json['isActive']),
      userUid: json['userUid'],
      tag: json['tag'],
      color: int.tryParse(json['color']) != null
          ? Color(int.parse(json['color']))
          : null,
      description: json['description'],
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
      deletedAt: DateTime.tryParse(json['deletedAt']),
      createdBy: json['createdBy'],
      updatedBy: json['updatedBy'],
      deletedBy: json['deletedBy'],
      isDelete: bool.tryParse(json['isDelete']),
    );
  }

  factory TBLTags.fromJson(Map<String, dynamic> json) {
    return TBLTags(
      uid: json['uid'],
      isActive: bool.tryParse(json['isActive']),
      userUid: json['userUid'],
      tag: json['tag'],
      color: int.tryParse(json['color']) != null
          ? Color(int.parse(json['color']))
          : null,
      description: json['description'],
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
      deletedAt: DateTime.tryParse(json['deletedAt']),
      createdBy: json['createdBy'],
      updatedBy: json['updatedBy'],
      deletedBy: json['deletedBy'],
      isDelete: bool.tryParse(json['isDelete']),
    );
  }

  @override
  List<Object?> get props => [
        super.uid,
        super.isActive,
        userUid,
        tag,
        color,
        description,
        super.createdAt,
        super.updatedAt,
        super.deletedAt,
        super.createdBy,
        super.updatedBy,
        super.deletedBy,
        super.isDelete,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'uid': super.uid,
      'isActive': super.isActive.toString(),
      'userUid': userUid,
      'tag': tag,
      'color': color?.value.toString(),
      'description': description,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'createdBy': createdBy,
      'updatedBy': updatedBy,
      'deletedBy': deletedBy,
      'isDelete': isDelete.toString(),
    };
  }

  @override
  TBLTags copyWith({
    String? uid,
    bool? isActive,
    String? userUid,
    String? tag,
    Color? color,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    String? createdBy,
    String? updatedBy,
    String? deletedBy,
    bool? isDelete,
  }) {
    return TBLTags(
      uid: uid ?? this.uid,
      isActive: isActive ?? this.isActive,
      userUid: userUid ?? this.userUid,
      tag: tag ?? this.tag,
      color: color ?? this.color,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      deletedBy: deletedBy ?? this.deletedBy,
      isDelete: isDelete ?? this.isDelete,
    );
  }
}
