import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofland/other/random_key/random_key.dart';

class HiveUserDatabase extends IHiveManager<HiveUser> {
  HiveUserDatabase() : super();

  Future<bool> addNewUser({
    required String username,
    required String password,
    required String email,
  }) async {
    //------------------------------
    HiveUser user = HiveUser(
      uid: RandomKey.generate(),
      createdAt: DateTime.now(),
      emailAddress: email,
      password: password,
      username: username,
      role: UserRole.manager.name,
      userType: UserType.free.name,
    );
    //------------------------------
    return await addBox(user.uid!, user);
  }

  HiveUser checkUser(String username, String password) {
    try {
      List<HiveUser> users = listBox();
      //
      final response = findHiveUser(users, username, password);
      return response ?? HiveUser.empty();
      //
    } catch (e) {
      return HiveUser.empty();
    }
  }

  HiveUser? findHiveUser(
      List<HiveUser> userList, String username, String password) {
    for (var element in userList) {
      if (element.username == username && element.password == password) {
        return element;
      }
    }
    return null;
  }
}
