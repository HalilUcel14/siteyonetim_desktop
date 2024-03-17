import 'package:codeofland/codeofland.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../app_hive.dart';

class AppMetaDataBase extends IHiveManager<AppMetaData> {
  AppMetaDataBase() : super();

  ValueListenable<Box<AppMetaData>> get boxListenable => box.listenable();

  AppMetaData? get meta => box.get(MetaKeys.key.text);

  String? get userUid => meta?.user?.uid;

  Future<bool> logOutUser() async {
    return await updateBox(
      MetaKeys.key.text,
      AppMetaData(
        uid: MetaKeys.key.text,
        user: null,
        lastSign: null,
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
