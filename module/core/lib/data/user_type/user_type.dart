import 'package:core/core.dart';

final class UserTypeData {
  static UserTypeData? _of;
  static UserTypeData get of => _of ??= UserTypeData._();
  UserTypeData._();

  //
  Map<String, UserTypeModel> map(UserType type) => {
        UserType.free.name: UserTypeModel(1, 6),
        UserType.normal.name: UserTypeModel(3, 25),
        UserType.premium.name: UserTypeModel(10, 100),
        UserType.proPlus.name: UserTypeModel(25, 250),
        UserType.express.name: UserTypeModel(999, 99999),
      };
}
