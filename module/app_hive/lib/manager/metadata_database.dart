import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';

class AppMetaDataBase extends IHiveManager<AppMetaData> {
  AppMetaDataBase() : super();

  Future<void> logOutUser(String id) async {
    await updateBox(
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
}
