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
  final String? name;
  @override
  @HiveField(2)
  final String? email;
  @override
  @HiveField(3)
  final String? identityNo;
  @override
  @HiveField(4)
  final String? phone;
  @override
  @HiveField(5)
  final String? address;

  TBLIndividual({
    required this.uid,
    required this.name,
    required this.identityNo,
    required this.email,
    required this.phone,
    required this.address,
  });

  TBLIndividual.empty({
    this.uid,
    this.name,
    this.identityNo,
    this.email,
    this.phone,
    this.address,
  });

  @override
  TBLIndividual fromJson(Map<String, dynamic> json) {
    return TBLIndividual(
      uid: json['uid'],
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
      'name': name,
      'identityNo': identityNo,
      'email': email,
      'phone': phone,
      'address': address,
    };
  }
}
