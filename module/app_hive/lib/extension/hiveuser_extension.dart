import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';

extension HiveUserNullExtension on HiveUser? {
  bool get isNull {
    if (this == null) return true;
    if (this == HiveUser.empty()) return true;
    if (this!.uid.isNullOrEmpty) return true;
    if (this!.username.isNullOrEmpty) return true;
    return false;
  }
}

extension HiveUserDBExtension on HiveUserDatabase {
  bool isHaveUserName(String username) {
    try {
      HiveUser? response = listBox().firstWhere(
        (element) => element.username == username,
        orElse: () => HiveUser.empty(),
      );
      return !response.isNull;
    } catch (e) {
      HiveException.read(e.toString()).debugPrint;
      return false;
    }
  }

  bool isHaveEmail(String email) {
    try {
      HiveUser? response = listBox().firstWhere(
        (element) => element.emailAddress == email,
        orElse: () => HiveUser.empty(),
      );
      return !response.isNull;
    } catch (e) {
      HiveException.read(e.toString()).debugPrint;
      return false;
    }
  }
}
