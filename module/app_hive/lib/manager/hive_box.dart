import 'package:app_hive/app_hive.dart';

final class HiveBoxesObject {
  static HiveBoxesObject? _of;
  static HiveBoxesObject get of => _of ??= HiveBoxesObject._();
  HiveBoxesObject._();
  //
  //
  late final ApartmentDatabase apartmentDB;
  late final HiveUserDatabase userDB;
  late final AppMetaDataBase metaDB;

  Future<void> initBoxes() async {
    apartmentDB = ApartmentDatabase();
    userDB = HiveUserDatabase();
    metaDB = AppMetaDataBase();
    //

    await apartmentDB.openBox();
    await userDB.openBox();
    await metaDB.openBox();
    //
  }

  void closeBoxes() async {
    apartmentDB.closeBox();
    userDB.closeBox();
    metaDB.closeBox();
  }
}
