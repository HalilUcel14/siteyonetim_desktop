import 'package:codeofland/codeofland.dart';
import 'package:codeofland/other/random_key/random_key.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../app_hive.dart';

class HiveUserDatabase extends IHiveManager<HiveUser> {
  HiveUserDatabase() : super();

  ValueListenable<Box<HiveUser>> get valueList => box.listenable();

  // ---------------------------------

  Future<bool> addNewUser(
      {required String username,
      required String password,
      required String email}) async {
    //------------------------------
    HiveUser user = HiveUser(
      uid: RandomKey.generate(),
      createdAt: DateTime.now(),
      emailAddress: email,
      password: password,
      username: username,
      role: UserRole.manager.name,
      userType: UserType.free.name,
      isActive: true,
    );
    //------------------------------
    return await addBox(user.uid!, user);
  }

  ///
  ///
  /// --------------- [ Login Form check] ---------------
  HiveUser checkUser(String username, String password) {
    try {
      HiveUser? response;
      List<HiveUser> users = listBox();
      //
      for (var user in users) {
        if (user.username == username && user.password == password) {
          response = user;
          break;
        }
      }
      //
      return response ?? HiveUser.empty();
      //
    } catch (e) {
      return HiveUser.empty();
    }
  }
}








  // HiveUser? findHiveUser(
  //     List<HiveUser> userList, String username, String password) {
  //   for (var element in userList) {
  //     if (element.username == username && element.password == password) {
  //       return element;
  //     }
  //   }
  //   return null;
  // }