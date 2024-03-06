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

  TBLEvSahibi({
    required this.uid,
    required this.userUid,
    required this.customer,
  });

  TBLEvSahibi.empty({
    this.uid,
    this.userUid,
    this.customer,
  });

  @override
  TBLEvSahibi fromJson(Map<String, dynamic> json) {
    return TBLEvSahibi(
      uid: json['uid'],
      userUid: json['userUid'],
      customer: customer?.fromJson(json['customer']),
    );
  }

  @override
  List<Object?> get props => [uid, userUid, customer];

  @override
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'userUid': userUid,
      'customer': customer?.toJson(),
    };
  }
}
