import 'package:codeofland/codeofland.dart';
import 'package:hive/hive.dart';

import '../../index.dart';

part 'daire.g.dart';

@HiveType(typeId: HiveTypes.daireType)
final class TBLDaire extends BaseModel<TBLDaire> {
  @override
  @HiveField(0)
  final String? uid;
  @HiveField(1)
  final String? apartmentUid;
  @HiveField(2)
  final int? floor;
  @HiveField(3)
  final int? flats;
  @HiveField(4)
  final int? squareMeter;
  @HiveField(5)
  final int? netSquareMeter;
  @HiveField(6)
  final int? roomCount;
  @HiveField(7)
  final TBLEvSahibi? owner;
  @HiveField(8)
  final TBLKiraci? tenant;
  @HiveField(9)
  final bool? isActive;

  TBLDaire({
    required this.uid,
    required this.apartmentUid,
    required this.floor,
    required this.flats,
    required this.squareMeter,
    required this.netSquareMeter,
    required this.roomCount,
    required this.owner,
    required this.tenant,
    required this.isActive,
  });

  TBLDaire.empty({
    this.uid,
    this.apartmentUid,
    this.floor,
    this.flats,
    this.squareMeter,
    this.netSquareMeter,
    this.roomCount,
    this.owner,
    this.tenant,
    this.isActive,
  });

  @override
  TBLDaire fromJson(Map<String, dynamic> json) {
    return TBLDaire(
      uid: json['uid'],
      apartmentUid: json['apartmentUid'],
      floor: int.tryParse(json['floor']),
      flats: int.tryParse(json['flats']),
      squareMeter: int.tryParse(json['squareMeter']),
      netSquareMeter: int.tryParse(json['netSquareMeter']),
      roomCount: int.tryParse(json['roomCount']),
      owner: owner?.fromJson(json['owner']),
      tenant: tenant?.fromJson(json['tenant']),
      isActive: bool.tryParse(json['isActive']),
    );
  }

  @override
  List<Object?> get props => [
        uid,
        apartmentUid,
        floor,
        flats,
        squareMeter,
        netSquareMeter,
        roomCount,
        owner,
        tenant,
        isActive,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'apartmentUid': apartmentUid,
      'floor': floor.toString(),
      'flats': flats.toString(),
      'squareMeter': squareMeter.toString(),
      'netSquareMeter': netSquareMeter.toString(),
      'roomCount': roomCount.toString(),
      'owner': owner?.toJson(),
      'tenant': tenant?.toJson(),
      'isActive': isActive.toString(),
    };
  }
}
