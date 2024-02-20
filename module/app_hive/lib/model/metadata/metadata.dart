import 'package:codeofland/codeofland.dart';
import 'package:hive/hive.dart';

import '../../index.dart';

part 'metadata.g.dart';

@HiveType(typeId: HiveTypes.metadataType)
final class AppMetaData extends BaseModel<AppMetaData> {
  @override
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final HiveUser? user;
  @HiveField(2)
  final DateTime? lastSign;

  const AppMetaData({
    required this.id,
    required this.user,
    required this.lastSign,
  });

  const AppMetaData.empty({
    this.id,
    this.user = const HiveUser.empty(),
    this.lastSign,
  });

  @override
  AppMetaData fromJson(Map<String, dynamic> json) {
    return AppMetaData(
      id: json['id'],
      user: HiveUser.fromJson(json['user']),
      lastSign: json['lastSign'],
    );
  }

  factory AppMetaData.fromJson(Map<String, dynamic> json) {
    return AppMetaData(
      id: json['id'],
      user: HiveUser.fromJson(json['user']),
      lastSign: json['lastSign'],
    );
  }

  @override
  List<Object?> get props => [id, user, lastSign];

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "user": user?.toJson(),
      "lastSign": lastSign,
    };
  }
}
