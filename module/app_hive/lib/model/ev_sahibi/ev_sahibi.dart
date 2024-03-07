import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:hive/hive.dart';

part 'ev_sahibi.g.dart';

// TODO: TBLFlatOwner Class
@HiveType(typeId: HiveTypes.evSahibiType)
final class TBLEvSahibi extends BaseModel<TBLEvSahibi> {
  @override
  @HiveField(0)
  final String? uid;
  @HiveField(1)
  final String? userUid;
  @HiveField(2)
  final CustomerModel? customer;
  @HiveField(3)
  final bool? isActive;

  TBLEvSahibi({
    required this.uid,
    required this.userUid,
    required this.customer,
    required this.isActive,
  });

  TBLEvSahibi.empty({
    this.uid,
    this.userUid,
    this.customer,
    this.isActive,
  });

  @override
  TBLEvSahibi fromJson(Map<String, dynamic> json) {
    return TBLEvSahibi(
      uid: json['uid'],
      userUid: json['userUid'],
      customer: customer?.fromJson(json['customer']),
      isActive: bool.tryParse(json['isActive']),
    );
  }

  @override
  List<Object?> get props => [uid, userUid, customer, isActive];

  @override
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'userUid': userUid,
      'customer': customer?.toJson(),
      'isActive': isActive.toString(),
    };
  }
}
