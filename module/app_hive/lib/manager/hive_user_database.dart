import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';

class HiveUserDatabase extends IHiveManager<HiveUser> {
  HiveUserDatabase() : super();

  HiveUser checkUser(String username, String password) {
    try {
      List<HiveUser> users = listBox();
      //
      print(users);
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
