import 'package:codeofland/codeofland.dart';
import 'package:hive/hive.dart';

import '../../index.dart';

part 'apartment.g.dart';

@HiveType(typeId: HiveTypes.apartmentType)
final class TBLApartment extends BaseModel<TBLApartment> {
  @override
  @HiveField(0)
  final String? uid;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? address;
  @HiveField(3)
  final int? floorCount;
  @HiveField(4)
  final int? flatsCount;
  @HiveField(5)
  final DateTime? buildYear;
  @HiveField(6)
  final bool? haveElevator;
  @HiveField(7)
  final bool? isActive;

  TBLApartment({
    required this.uid,
    required this.name,
    required this.address,
    required this.floorCount,
    required this.flatsCount,
    required this.buildYear,
    required this.haveElevator,
    required this.isActive,
  });

  TBLApartment.empty({
    this.uid,
    this.address,
    this.buildYear,
    this.flatsCount,
    this.floorCount,
    this.haveElevator,
    this.isActive,
    this.name,
  });

  @override
  TBLApartment fromJson(Map<String, dynamic> json) {
    return TBLApartment(
      uid: json['uid'],
      name: json['name'],
      address: json['address'],
      floorCount:
          json['floorCount'] != null ? int.tryParse(json['floorCount']) : null,
      flatsCount:
          json['flatsCount'] != null ? int.tryParse(json['flatsCount']) : null,
      buildYear: json['buildYear'] != null
          ? DateTime.tryParse(json['buildYear'])
          : null,
      haveElevator: json['haveElevator'] != null
          ? bool.tryParse(json['haveElevator'])
          : null,
      isActive:
          json['isActive'] != null ? bool.tryParse(json['isActive']) : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'address': address,
      'floorCount': floorCount.toString(),
      'flatsCount': flatsCount.toString(),
      'buildYear': buildYear?.toIso8601String(),
      'haveElevator': haveElevator.toString(),
      'isActive': isActive.toString(),
    };
  }

  @override
  List<Object?> get props => [
        uid,
        name,
        address,
        floorCount,
        flatsCount,
        buildYear,
        haveElevator,
        isActive,
      ];
}
