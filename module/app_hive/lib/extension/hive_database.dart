import 'package:app_hive/index.dart';
import 'package:codeofland/codeofland.dart';

extension HiveDatabaseExtension on HiveDatabaseManager<HiveUser> {
  Future<HiveUser?> isHasUser(String user, String pass) async {
    final List<HiveUser> data = await listBox();
    final response = data.firstWhere(
      (myUser) =>
          myUser.username.isNotNullOrEmpty &&
          myUser.password.isNotNullOrEmpty &&
          myUser.username == user &&
          myUser.password == pass,
      orElse: () => HiveUser.empty(),
    );

    if (response.uid == null) return null;
    //
    return response;
  }
}
