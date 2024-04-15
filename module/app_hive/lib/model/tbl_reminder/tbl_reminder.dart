import 'dart:convert';

import 'package:app_hive/app_hive.dart';
import 'package:app_hive/index.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'tbl_reminder.g.dart';

@HiveType(typeId: HiveTypes.reminder)
final class TBLReminder extends BaseDBModel<TBLReminder> {
  @HiveField(10)
  final String? userUid;
  @HiveField(11)
  final String? title;
  @HiveField(12)
  final String? description;
  @HiveField(13)
  final DateTime? reminderDate;
  @HiveField(14)
  final bool? isDone;
  @HiveField(15)
  final String? reminderType;
  @HiveField(16)
  final bool? isFavorite;
  @HiveField(17)
  final Color? color;
  @HiveField(18)
  final DateTime? repeatDate;
  @HiveField(19)
  final String? note;

  TBLReminder({
    required super.isActive,
    required super.uid,
    required this.userUid,
    required this.title,
    this.description,
    required this.reminderDate,
    this.isDone,
    this.reminderType,
    this.isFavorite,
    required this.color,
    required this.repeatDate,
    this.note,
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
  TBLReminder copyWith(
      {String? uid,
      String? userUid,
      String? title,
      String? description,
      DateTime? reminderDate,
      bool? isDone,
      String? reminderType,
      bool? isFavorite,
      Color? color,
      bool? isActive,
      DateTime? repeatDate,
      String? note,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? deletedAt,
      String? createdBy,
      String? updatedBy,
      String? deletedBy,
      bool? isDelete,
      List<String>? tags}) {
    return TBLReminder(
      uid: uid ?? this.uid,
      userUid: userUid ?? this.userUid,
      title: title ?? this.title,
      description: description ?? this.description,
      reminderDate: reminderDate ?? this.reminderDate,
      isDone: isDone ?? this.isDone,
      reminderType: reminderType ?? this.reminderType,
      isFavorite: isFavorite ?? this.isFavorite,
      color: color ?? this.color,
      repeatDate: repeatDate ?? this.repeatDate,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      deletedBy: deletedBy ?? this.deletedBy,
      isDelete: isDelete ?? this.isDelete,
      isActive: isActive ?? this.isActive,
      tags: tags ?? this.tags,
    );
  }

  @override
  TBLReminder fromJson(Map<String, dynamic> json) {
    return TBLReminder(
      uid: json['uid'],
      userUid: json['userUid'],
      title: json['title'],
      description: json['description'],
      reminderDate: DateTime.tryParse(json['reminderDate']),
      isDone: bool.tryParse(json['isDone']),
      reminderType: json['reminderType'],
      isFavorite: bool.tryParse(json['isFavorite']),
      color: int.tryParse(json['color']) != null
          ? Color(int.parse(json['color']))
          : null,
      repeatDate: DateTime.tryParse(json['repeatDate']),
      note: json['note'],
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

  factory TBLReminder.fromJson(Map<String, dynamic> json) {
    return TBLReminder(
      uid: json['uid'],
      userUid: json['userUid'],
      title: json['title'],
      description: json['description'],
      reminderDate: DateTime.tryParse(json['reminderDate']),
      isDone: bool.tryParse(json['isDone']),
      reminderType: json['reminderType'],
      isFavorite: bool.tryParse(json['isFavorite']),
      color: int.tryParse(json['color']) != null
          ? Color(int.parse(json['color']))
          : null,
      repeatDate: DateTime.tryParse(json['repeatDate']),
      note: json['note'],
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
        title,
        description,
        reminderDate,
        isDone,
        reminderType,
        isFavorite,
        color,
        repeatDate,
        note,
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
      'title': title,
      'description': description,
      'reminderDate': reminderDate?.toIso8601String(),
      'isDone': isDone?.toString(),
      'reminderType': reminderType,
      'isFavorite': isFavorite?.toString(),
      'color': color?.value,
      'repeatDate': repeatDate?.toIso8601String(),
      'note': note,
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
}
