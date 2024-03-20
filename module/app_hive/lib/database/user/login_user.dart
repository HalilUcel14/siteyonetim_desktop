import 'package:app_hive/app_hive.dart';
import 'package:codeofland/feauture/exception/index.dart';

class DBLoginUser {
  bool signIn(String username, String password) {
    try {
      HiveUser? response = HiveBoxesObject.of.userDB.listBox().firstWhere(
            (e) => e.username == username && e.password == password,
            orElse: () => HiveUser.empty(),
          );
      // --------------------

      if (!response.isNull) {
        HiveBoxesObject.of.metaDB.logInUser(response);
        return true;
      }
      return false;
    } catch (e) {
      HiveException.read(e.toString()).debugPrint;
      return false;
    }
  }

  Future<bool> signUp(String username, String email, String password) async {
    try {
      if (HiveBoxesObject.of.userDB.isHaveUserName(username)) {
        return Future.value(false);
      }
      if (HiveBoxesObject.of.userDB.isHaveEmail(email)) {
        return Future.value(false);
      }
      //
      return await HiveBoxesObject.of.userDB.createUser(
        username: username,
        emailAddress: email,
        password: password,
      );
    } catch (e) {
      HiveException.write(e.toString()).debugPrint;
      return Future.value(false);
    }
  }

  bool signOut() {
    try {
      HiveBoxesObject.of.metaDB.logOutUser();
      return true;
    } catch (e) {
      HiveException.read(e.toString()).debugPrint;
      return false;
    }
  }
}
