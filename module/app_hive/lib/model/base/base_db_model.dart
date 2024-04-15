import 'package:codeofland/codeofland.dart';
import 'package:hive/hive.dart';

abstract class BaseDBModel<T> extends BaseModel<T> {
  @override
  @HiveField(0)
  final String? uid;
  @HiveField(1)
  final bool? isActive;
  @HiveField(2)
  final bool? isDelete;
  @HiveField(3)
  final String? createdBy;
  @HiveField(4)
  final String? updatedBy;
  @HiveField(5)
  final DateTime? createdAt;
  @HiveField(6)
  final DateTime? updatedAt;
  @HiveField(7)
  final String? deletedBy;
  @HiveField(8)
  final DateTime? deletedAt;
  @HiveField(9)
  final List<String>? tags;

  BaseDBModel({
    required this.isActive,
    required this.uid,
    this.isDelete,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedBy,
    this.deletedAt,
    this.tags,
  });

  T copyWith();
}
