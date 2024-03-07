import 'package:codeofland/codeofland.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../app_hive.dart';

class AppMetaDataBase extends IHiveManager<AppMetaData> {
  AppMetaDataBase() : super();

  ValueListenable<Box<AppMetaData>> get boxListenable => box.listenable();

  AppMetaData? get meta => box.get(MetaKeys.key.text);

  bool get isNullable {
    if (meta?.lastSign == null ||
        meta?.uid == null ||
        meta?.user?.uid == null) {
      return true;
    }
    return false;
  }

  Future<bool> logOutUser(String id) async {
    return await updateBox(
      id,
      AppMetaData(
        uid: id,
        user: HiveUser.empty(),
        lastSign: DateTime.now().subtract(
          DurationConst.day(7).duration,
        ),
      ),
    );
  }

  Future<bool> logInUser(HiveUser user) async {
    return await updateBox(
      MetaKeys.key.text,
      AppMetaData(
        uid: MetaKeys.key.text,
        user: user,
        lastSign: DateTime.now(),
      ),
    );
  }
}
