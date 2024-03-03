import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';

class AppMetaDataBase extends IHiveManager<AppMetaData> {
  AppMetaDataBase() : super();

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
