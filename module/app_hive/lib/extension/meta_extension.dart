import 'package:app_hive/app_hive.dart';

extension MetaDataExtension on AppMetaData? {
  bool get isNull => this == null;

  bool get isValidUid {
    if (isNull) return false;
    if (this!.uid != MetaKeys.key.text) return false;
    return true;
  }

  bool get isValid3Day {
    if (isNull) return false;
    if (this!.lastSign == null) return false;
    if (DateTime.now().difference(this!.lastSign!).inDays > 3) return false;
    return true;
  }

  bool get isHaveUser {
    if (isNull) return false;
    if (this!.user == null) return false;
    if (this!.user!.uid == null || this!.user!.uid == "") return false;
    return true;
  }
}

extension MetaDBExtension on AppMetaDataBase {
  bool get isActiveUser {
    if (!meta.isValidUid) return false;
    if (!meta.isValid3Day) return false;
    if (!meta.isHaveUser) return false;
    return true;
  }
}
