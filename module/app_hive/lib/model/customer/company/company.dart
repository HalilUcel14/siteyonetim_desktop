import 'package:hive/hive.dart';

import '../../../index.dart';

part 'company.g.dart';

@HiveType(typeId: HiveTypes.companyType)
final class TBLCompany extends CustomerModel<TBLCompany> {
  @override
  @HiveField(0)
  final String? uid;
  @override
  @HiveField(1)
  final String? userUid;
  @override
  @HiveField(2)
  final String? name;
  @override
  @HiveField(3)
  final String? email;
  @override
  @HiveField(4)
  final String? identityNo;
  @override
  @HiveField(5)
  final String? phone;
  @override
  @HiveField(6)
  final String? address;

  TBLCompany({
    required this.uid,
    required this.userUid,
    required this.name,
    required this.identityNo,
    required this.email,
    required this.phone,
    required this.address,
  });

  TBLCompany.empty({
    this.uid,
    this.userUid,
    this.name,
    this.identityNo,
    this.email,
    this.phone,
    this.address,
  });

  @override
  TBLCompany fromJson(Map<String, dynamic> json) {
    return TBLCompany(
      uid: json['uid'],
      userUid: json['userUid'],
      name: json['name'],
      identityNo: json['identityNo'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
    );
  }

  @override
  List<Object?> get props => [
        uid,
        userUid,
        name,
        identityNo,
        email,
        phone,
        address,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'userUid': userUid,
      'name': name,
      'identityNo': identityNo,
      'email': email,
      'phone': phone,
      'address': address,
    };
  }
}
