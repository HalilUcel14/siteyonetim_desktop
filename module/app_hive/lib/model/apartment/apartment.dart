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
  final String? userUid;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? address;
  @HiveField(4)
  final int? floorCount;
  @HiveField(5)
  final int? flatsCount;
  @HiveField(6)
  final DateTime? buildYear;
  @HiveField(7)
  final bool? haveElevator;
  @HiveField(8)
  final bool? isActive;

  TBLApartment({
    required this.uid,
    required this.userUid,
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
    this.userUid,
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
      userUid: json['userUid'],
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
      'userUid': userUid,
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
        userUid,
        name,
        address,
        floorCount,
        flatsCount,
        buildYear,
        haveElevator,
        isActive,
      ];
}
