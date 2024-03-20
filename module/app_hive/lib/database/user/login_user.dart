import 'package:app_hive/app_hive.dart';
import 'package:codeofland/feauture/exception/index.dart';

class DBLoginUser {
  static DBLoginUser? _of;
  static DBLoginUser get of => _of ??= DBLoginUser._init();
  DBLoginUser._init();

  Future<HiveResponse<HiveUser>> signIn(
      String username, String password) async {
    try {
      HiveUser? user = HiveBoxesObject.of.userDB.listBox().firstWhere(
            (e) => e.username == username && e.password == password,
            orElse: () => HiveUser.empty(),
          );
      // --------------------
      if (user.isNull) {
        return HiveResponse(
          data: null,
          message: 'Kullanıcı ve Parola Eşleşmedi',
          hasError: true,
        );
      }

      final logTest = await HiveBoxesObject.of.metaDB.logInUser(user);
      //
      if (logTest) {
        return HiveResponse(
          data: user,
          message: 'Giriş Başarılı',
          hasError: false,
        );
      }
      return HiveResponse(
        data: null,
        message: 'Giriş Yapılamadı',
        hasError: true,
      );
    } catch (e) {
      HiveException.read(e.toString()).debugPrint;
      return HiveResponse(data: null, message: e.toString(), hasError: true);
    }
  }

  Future<bool> signUp(
      {required String username,
      required String email,
      required String password}) async {
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
