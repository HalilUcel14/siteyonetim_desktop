import 'package:codeofland/codeofland.dart';
import 'package:hive/hive.dart';

import '../../app_hive.dart';

part 'kiraci.g.dart';

// TODO: TBLTenant Class

@HiveType(typeId: HiveTypes.kiraciType)
final class TBLKiraci extends BaseModel<TBLKiraci> {
  @override
  @HiveField(0)
  final String? uid;
  @HiveField(1)
  final String? userUid;
  @HiveField(2)
  final CustomerModel? customer;

  TBLKiraci({
    required this.uid,
    required this.userUid,
    required this.customer,
  });

  TBLKiraci.empty({
    this.uid,
    this.userUid,
    this.customer,
  });

  @override
  TBLKiraci fromJson(Map<String, dynamic> json) {
    return TBLKiraci(
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
