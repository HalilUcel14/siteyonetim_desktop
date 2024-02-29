import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';

class HiveUserDatabase extends IHiveManager<HiveUser> {
  HiveUserDatabase() : super();

  HiveUser checkUser(String username, String password) {
    try {
      List<HiveUser> users = listBox();
      return users.firstWhere(
        (e) => e.username == username && e.password == password,
      );
      //
    } catch (e) {
      return HiveUser.empty();
    }
  }
}
