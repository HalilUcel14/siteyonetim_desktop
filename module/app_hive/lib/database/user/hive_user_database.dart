import 'package:codeofland/codeofland.dart';

import '../../app_hive.dart';

final class HiveUserDatabase extends IHiveManager<HiveUser> {
  HiveUserDatabase() : super();
}

extension HiveUserDatabaseCreateExtension on HiveUserDatabase {
  Future<HiveResponse<HiveUser>> create({
    required String username,
    required String emailAddress,
    required String password,
  }) async {
    try {
      if (username.isNullOrEmpty ||
          emailAddress.isNullOrEmpty ||
          password.isNullOrEmpty) {
        return HiveResponse<HiveUser>(
          data: null,
          message: 'Kullanıcı Adı veya Email Boş Olamaz',
          hasError: true,
        );
      }
      // ------------------------------
      if (isHaveUserName(username)) {
        return HiveResponse<HiveUser>(
          data: null,
          message: 'Kullanıcı Adı Kullanılıyor',
          hasError: true,
        );
      }
      // ------------------------------
      if (isHaveEmail(emailAddress)) {
        return HiveResponse<HiveUser>(
          data: null,
          message: 'Email Adresi Kullanılıyor',
          hasError: true,
        );
      }
      // ------------------------------
      HiveUser user = HiveUser(
        isActive: true,
        uid: RandomKey.generate(),
        username: username,
        emailAddress: emailAddress,
        password: password,
        userRole: UserRole.manager.name,
        plans: PlansType.free.name,
        createdAt: DateTime.now(),
        isDelete: false,
      );
      // ------------------------------
      final response = await addBox(user.uid!, user);
      // ------------------------------
      if (response) {
        return HiveResponse<HiveUser>(
          data: user,
          message: 'Kayıt Başarılı',
          hasError: false,
        );
      }
      // ------------------------------
      return HiveResponse<HiveUser>(
        data: null,
        message: 'Kayıt Yapılamadı',
        hasError: true,
      );
      // ------------------------------
    } catch (e) {
      return HiveResponse<HiveUser>(
        data: null,
        message: e.toString(),
        hasError: true,
      );
    }
  }
}

extension HiveUserDBSignInExtension on HiveUserDatabase {
  Future<HiveResponse<HiveUser>> signIn({
    required String username,
    required String password,
  }) async {
    try {
      if (username.isNullOrEmpty || password.isNullOrEmpty) {
        return HiveResponse<HiveUser>(
          data: null,
          message: 'Kullanıcı Adı veya Şifre Boş Olamaz',
          hasError: true,
        );
      }
      // ------------------------------
      if (!isHaveUserName(username)) {
        return HiveResponse<HiveUser>(
          data: null,
          message: 'Kullanıcı Bulunamadı',
          hasError: true,
        );
      }
      // ------------------------------
      final user = getUserFromUsername(username);
      // ------------------------------
      if (user?.password != password) {
        return HiveResponse<HiveUser>(
          data: null,
          message: 'Şifre Hatalı',
          hasError: true,
        );
      }
      // ------------------------------

      return HiveResponse<HiveUser>(
        data: user,
        message: 'Giriş Başarılı',
        hasError: false,
      );
      // ------------------------------
    } catch (e) {
      HiveException.read(e.toString()).debugPrint;
      return HiveResponse<HiveUser>(
        data: null,
        message: e.toString(),
        hasError: true,
      );
    }
  }
}

extension HiveUserDBSignOutExtension on HiveUserDatabase {
  Future<HiveResponse<bool>> signOut() async {
    try {
      final response = await HiveBoxesObject.of.metaDB.logOutUser();
      // ------------------------------
      if (response) {
        return HiveResponse<bool>(
          data: response,
          message: 'Çıkış Başarılı',
          hasError: false,
        );
      }
      // ------------------------------
      return HiveResponse<bool>(
        data: response,
        message: 'Çıkış Yapılamadı',
        hasError: true,
      );
      // ------------------------------
    } catch (e) {
      HiveException.read(e.toString()).debugPrint;
      return HiveResponse<bool>(
        data: false,
        message: e.toString(),
        hasError: true,
      );
    }
  }
}
