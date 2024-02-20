import 'package:codeofland/codeofland.dart';
import 'package:hive/hive.dart';

import '../../index.dart';

part 'user_model.g.dart';

@HiveType(typeId: HiveTypes.hiveUserType)
final class HiveUser extends BaseModel<HiveUser> {
  @override
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? username;
  @HiveField(2)
  final String? password;
  @HiveField(3)
  final DateTime? createdAt;
  @HiveField(4)
  final String? role;

  const HiveUser({
    required this.id,
    required this.username,
    required this.password,
    required this.createdAt,
    required this.role,
  });

  const HiveUser.empty({
    this.id,
    this.username,
    this.password,
    this.createdAt,
    this.role,
  });

  @override
  HiveUser fromJson(Map<String, dynamic> json) {
    return HiveUser(
      id: json['id'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      createdAt: json['createdAt'] as DateTime,
      role: json['role'] as String,
    );
  }

  factory HiveUser.fromJson(Map<String, dynamic> json) {
    return HiveUser(
      id: json['id'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      createdAt: json['createdAt'] as DateTime,
      role: json['role'] as String,
    );
  }

  @override
  List<Object?> get props => [id, username, password, createdAt, role];

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "password": password,
      "createdAt": createdAt,
      "role": role,
    };
  }
}
