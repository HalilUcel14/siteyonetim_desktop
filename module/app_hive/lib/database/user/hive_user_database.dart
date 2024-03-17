import 'package:codeofland/codeofland.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../app_hive.dart';

class HiveUserDatabase extends IHiveManager<HiveUser> {
  HiveUserDatabase() : super();

  ValueListenable<Box<HiveUser>> get valueList => box.listenable();

  HiveUser customUser({
    required String username,
    required String emailAddress,
    required String password,
  }) {
    return HiveUser(
      uid: RandomKey.generate(),
      username: username,
      emailAddress: emailAddress,
      password: password,
      createdAt: DateTime.now(),
      isActive: true,
      role: UserRole.manager.name,
      userType: UserType.free.name,
    );
  }

  Future<bool> createUser({
    required String username,
    required String emailAddress,
    required String password,
  }) {
    HiveUser user = customUser(
      username: username,
      emailAddress: emailAddress,
      password: password,
    );
    return addBox(user.uid!, user);
  }
}
