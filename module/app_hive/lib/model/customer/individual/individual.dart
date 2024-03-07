import 'package:hive/hive.dart';

import '../../../index.dart';

part 'individual.g.dart';

@HiveType(typeId: HiveTypes.individualType)
final class TBLIndividual extends CustomerModel<TBLIndividual> {
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
  @HiveField(7)
  final bool? isActive;

  TBLIndividual({
    required this.uid,
    required this.userUid,
    required this.name,
    required this.identityNo,
    required this.email,
    required this.phone,
    required this.address,
    this.isActive,
  });

  TBLIndividual.empty({
    this.uid,
    this.userUid,
    this.name,
    this.identityNo,
    this.email,
    this.phone,
    this.address,
    this.isActive,
  });

  @override
  TBLIndividual fromJson(Map<String, dynamic> json) {
    return TBLIndividual(
      uid: json['uid'],
      userUid: json['userUid'],
      name: json['name'],
      identityNo: json['identityNo'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      isActive: bool.tryParse(json['isActive']),
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
        isActive,
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
      'isActive': isActive.toString(),
    };
  }
}
