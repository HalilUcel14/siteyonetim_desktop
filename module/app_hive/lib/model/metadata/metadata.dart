import 'package:codeofland/codeofland.dart';
import 'package:hive/hive.dart';

import '../../index.dart';

part 'metadata.g.dart';

@HiveType(typeId: HiveTypes.metadataType)
final class AppMetaData extends BaseModel<AppMetaData> {
  @override
  @HiveField(0)
  final String? uid;
  @HiveField(1)
  final HiveUser? user;
  @HiveField(2)
  final DateTime? lastSign;

  AppMetaData({
    required this.uid,
    required this.user,
    required this.lastSign,
  });

  AppMetaData.empty({
    this.uid,
    this.user,
    this.lastSign,
  });

  @override
  AppMetaData fromJson(Map<String, dynamic> json) {
    return AppMetaData(
      uid: json['uid'],
      user: HiveUser.fromJson(json['user']),
      lastSign: json['lastSign'],
    );
  }

  factory AppMetaData.fromJson(Map<String, dynamic> json) {
    return AppMetaData(
      uid: json['uid'],
      user: HiveUser.fromJson(json['user']),
      lastSign: json['lastSign'],
    );
  }

  @override
  List<Object?> get props => [uid, user, lastSign];

  @override
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "user": user?.toJson(),
      "lastSign": lastSign,
    };
  }
}
