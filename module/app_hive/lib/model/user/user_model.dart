import 'package:codeofland/codeofland.dart';
import 'package:hive/hive.dart';

import '../../index.dart';

part 'user_model.g.dart';

@HiveType(typeId: HiveTypes.hiveUserType)
final class HiveUser extends BaseModel<HiveUser> {
  @override
  @HiveField(0)
  final String? uid;
  @HiveField(1)
  final String? username;
  @HiveField(2)
  final String? emailAddress;
  @HiveField(3)
  final String? password;
  @HiveField(4)
  final DateTime? createdAt;
  @HiveField(5)
  final String? role;
  @HiveField(6)
  final String? userType;
  @HiveField(7)
  final bool? isActive;

  HiveUser({
    required this.uid,
    required this.username,
    required this.emailAddress,
    required this.password,
    required this.createdAt,
    required this.role,
    required this.userType,
    required this.isActive,
  });

  HiveUser.empty({
    this.uid,
    this.username,
    this.password,
    this.emailAddress,
    this.createdAt,
    this.role,
    this.userType,
    this.isActive,
  });

  @override
  HiveUser fromJson(Map<String, dynamic> json) {
    return HiveUser(
      uid: json['uid'] as String,
      username: json['username'] as String,
      emailAddress: json['emailAddress'] as String,
      password: json['password'] as String,
      createdAt: DateTime.parse(json['createdAt']),
      role: json['role'] as String,
      userType: json['userType'] as String,
      isActive: bool.tryParse(json['isActive']),
    );
  }

  factory HiveUser.fromJson(Map<String, dynamic> json) {
    return HiveUser(
      uid: json['uid'] as String,
      username: json['username'] as String,
      emailAddress: json['emailAddress'] as String,
      password: json['password'] as String,
      createdAt: DateTime.parse(json['createdAt']),
      role: json['role'] as String,
      userType: json['userType'] as String,
      isActive: bool.tryParse(json['isActive']),
    );
  }

  @override
  List<Object?> get props =>
      [uid, username, emailAddress, password, createdAt, role, userType];

  @override
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "username": username,
      "emailAddress": emailAddress,
      "password": password,
      "createdAt": createdAt?.toIso8601String(),
      "role": role,
      "userType": userType,
      "isActive": isActive.toString(),
    };
  }
}
