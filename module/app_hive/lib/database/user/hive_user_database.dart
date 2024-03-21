import 'package:codeofland/codeofland.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../app_hive.dart';

class HiveUserDatabase extends IHiveManager<HiveUser> {
  HiveUserDatabase() : super();

  ValueListenable<Box<HiveUser>> get valueList => box.listenable();

  Future<HiveUser> createUser(
    String username,
    String emailAddress,
    String password,
  ) async {
    try {
      HiveUser user = HiveUser(
        uid: RandomKey.generate(),
        username: username,
        emailAddress: emailAddress,
        password: password,
        createdAt: DateTime.now(),
        isActive: true,
        role: UserRole.manager.name,
        userType: UserType.free.name,
      );
      //
      await addBox(user.uid!, user);
      //
      return user;
    } catch (e) {
      HiveException.write(e.toString()).debugPrint;
      return HiveUser.empty();
    }
  }
}
