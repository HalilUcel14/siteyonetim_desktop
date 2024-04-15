import 'package:hive/hive.dart';

import '../../index.dart';

part 'user_model.g.dart';

@HiveType(typeId: HiveTypes.hiveUserType)
final class HiveUser extends BaseDBModel<HiveUser> {
  @HiveField(10)
  final String? username;
  @HiveField(11)
  final String? emailAddress;
  @HiveField(12)
  final String? password;
  @HiveField(13)
  final String? userRole;
  @HiveField(14)
  final String? plans;

  HiveUser({
    required super.isActive,
    required super.uid,
    required this.username,
    required this.emailAddress,
    required this.password,
    required this.userRole,
    required this.plans,
    super.createdAt,
    super.updatedAt,
    super.createdBy,
    super.updatedBy,
    super.deletedBy,
    super.deletedAt,
    super.isDelete,
  });

  HiveUser.empty({
    super.isActive,
    super.uid,
    this.username,
    this.emailAddress,
    this.password,
    this.userRole,
    this.plans,
    super.createdAt,
    super.updatedAt,
    super.createdBy,
    super.updatedBy,
    super.deletedBy,
    super.deletedAt,
    super.isDelete,
  });

  @override
  HiveUser fromJson(Map<String, dynamic> json) {
    return HiveUser(
      uid: json['uid'],
      username: json['username'],
      emailAddress: json['emailAddress'],
      password: json['password'],
      userRole: json['userRole'],
      plans: json['plans'],
      isActive: bool.tryParse(json['isActive']),
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
      createdBy: json['createdBy'],
      updatedBy: json['updatedBy'],
      deletedBy: json['deletedBy'],
      deletedAt: DateTime.tryParse(json['deletedAt']),
      isDelete: bool.tryParse(json['isDelete']),
    );
  }

  factory HiveUser.fromJson(Map<String, dynamic> json) {
    return HiveUser(
      uid: json['uid'],
      username: json['username'],
      emailAddress: json['emailAddress'],
      password: json['password'],
      userRole: json['userRole'],
      plans: json['plans'],
      isActive: bool.tryParse(json['isActive']),
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
      createdBy: json['createdBy'],
      updatedBy: json['updatedBy'],
      deletedBy: json['deletedBy'],
      deletedAt: DateTime.tryParse(json['deletedAt']),
      isDelete: bool.tryParse(json['isDelete']),
    );
  }

  @override
  List<Object?> get props => [
        uid,
        username,
        emailAddress,
        password,
        userRole,
        plans,
        createdAt,
        updatedAt,
        createdBy,
        updatedBy,
        deletedBy,
        deletedAt,
        isDelete,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "username": username,
      "emailAddress": emailAddress,
      "password": password,
      "userRole": userRole,
      "plans": plans,
      "isActive": isActive.toString(),
      "createdAt": createdAt?.toIso8601String(),
      "updatedAt": updatedAt?.toIso8601String(),
      "createdBy": createdBy,
      "updatedBy": updatedBy,
      "deletedBy": deletedBy,
      "deletedAt": deletedAt?.toIso8601String(),
      "isDelete": isDelete.toString(),
    };
  }

  @override
  HiveUser copyWith({
    String? uid,
    String? username,
    String? emailAddress,
    String? password,
    String? userRole,
    String? plans,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? createdBy,
    String? updatedBy,
    String? deletedBy,
    DateTime? deletedAt,
    bool? isDelete,
  }) {
    return HiveUser(
      uid: uid ?? this.uid,
      username: username ?? this.username,
      emailAddress: emailAddress ?? this.emailAddress,
      password: password ?? this.password,
      userRole: userRole ?? this.userRole,
      plans: plans ?? this.plans,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedAt: deletedAt ?? this.deletedAt,
      isDelete: isDelete ?? this.isDelete,
    );
  }
}
