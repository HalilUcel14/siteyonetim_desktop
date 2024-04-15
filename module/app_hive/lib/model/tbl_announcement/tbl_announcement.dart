import 'dart:convert';

import 'package:app_hive/app_hive.dart';
import 'package:app_hive/index.dart';
import 'package:hive/hive.dart';

part 'tbl_announcement.g.dart';

@HiveType(typeId: HiveTypes.announcement)
final class TBLAnnouncement extends BaseDBModel<TBLAnnouncement> {
  @HiveField(10)
  final String? userUid;
  @HiveField(11)
  final List<String>? apartmentUid;
  @HiveField(12)
  final String? title;
  @HiveField(13)
  final String? content;
  @HiveField(14)
  final DateTime? date;
  @HiveField(15)
  final bool? isPublished;

  TBLAnnouncement({
    required super.uid,
    required super.isActive,
    required this.userUid,
    required this.apartmentUid,
    required this.title,
    required this.content,
    required this.date,
    required this.isPublished,
    super.isDelete,
    super.createdBy,
    super.updatedBy,
    super.createdAt,
    super.updatedAt,
    super.deletedBy,
    super.deletedAt,
    super.tags,
  });

  TBLAnnouncement.empty({
    this.userUid,
    this.apartmentUid,
    this.title,
    this.content,
    this.date,
    this.isPublished,
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
  TBLAnnouncement fromJson(Map<String, dynamic> json) {
    return TBLAnnouncement(
      uid: json['uid'],
      isActive: bool.tryParse(json['isActive']),
      userUid: json['userUid'],
      apartmentUid: jsonDecode(json['apartmentUid']),
      title: json['title'],
      content: json['content'],
      date: DateTime.tryParse(json['date']),
      isPublished: bool.tryParse(json['isPublished']),
      isDelete: bool.tryParse(json['isDelete']),
      createdBy: json['createdBy'],
      updatedBy: json['updatedBy'],
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
      deletedBy: json['deletedBy'],
      deletedAt: DateTime.tryParse(json['deletedAt']),
      tags: jsonDecode(json['tags']),
    );
  }

  factory TBLAnnouncement.fromJson(Map<String, dynamic> json) {
    return TBLAnnouncement(
      uid: json['uid'],
      isActive: bool.tryParse(json['isActive']),
      userUid: json['userUid'],
      apartmentUid: jsonDecode(json['apartmentUid']),
      title: json['title'],
      content: json['content'],
      date: DateTime.tryParse(json['date']),
      isPublished: bool.tryParse(json['isPublished']),
      isDelete: bool.tryParse(json['isDelete']),
      createdBy: json['createdBy'],
      updatedBy: json['updatedBy'],
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
      deletedBy: json['deletedBy'],
      deletedAt: DateTime.tryParse(json['deletedAt']),
      tags: jsonDecode(json['tags']),
    );
  }

  @override
  List<Object?> get props => [
        uid,
        isActive,
        userUid,
        apartmentUid,
        title,
        content,
        date,
        isPublished,
        isDelete,
        createdBy,
        updatedBy,
        createdAt,
        updatedAt,
        deletedBy,
        deletedAt,
        tags,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'isActive': isActive?.toString(),
      'userUid': userUid,
      'apartmentUid': jsonEncode(apartmentUid),
      'title': title,
      'content': content,
      'date': date?.toIso8601String(),
      'isPublished': isPublished?.toString(),
      'isDelete': isDelete?.toString(),
      'createdBy': createdBy,
      'updatedBy': updatedBy,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedBy': deletedBy,
      'deletedAt': deletedAt?.toIso8601String(),
      'tags': jsonEncode(tags),
    };
  }

  @override
  TBLAnnouncement copyWith(
      {String? uid,
      bool? isActive,
      String? userUid,
      List<String>? apartmentUid,
      String? title,
      String? content,
      DateTime? date,
      bool? isPublished,
      bool? isDelete,
      String? createdBy,
      String? updatedBy,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? deletedBy,
      DateTime? deletedAt,
      List<String>? tags}) {
    return TBLAnnouncement(
      uid: uid ?? this.uid,
      isActive: isActive ?? this.isActive,
      userUid: userUid ?? this.userUid,
      apartmentUid: apartmentUid ?? this.apartmentUid,
      title: title ?? this.title,
      content: content ?? this.content,
      date: date ?? this.date,
      isPublished: isPublished ?? this.isPublished,
      isDelete: isDelete ?? this.isDelete,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedAt: deletedAt ?? this.deletedAt,
      tags: tags ?? this.tags,
    );
  }
}
