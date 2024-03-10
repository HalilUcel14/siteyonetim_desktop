import 'package:codeofland/codeofland.dart';

abstract class CustomerModel<T> extends BaseModel<T> {
  String? get name;
  String? get email;
  String? get identityNo;
  String? get phone;
  String? get address;
}
