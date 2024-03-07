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
  late final CompanyDatabase companyDB;
  late final IndividualDatabase individualDB;
  late final DaireDatabase daireDB;
  late final EvSahibiDatabase evSahibiDB;
  late final KiraciDatabase kiraciDB;

  Future<void> initBoxes() async {
    apartmentDB = ApartmentDatabase();
    userDB = HiveUserDatabase();
    metaDB = AppMetaDataBase();
    companyDB = CompanyDatabase();
    individualDB = IndividualDatabase();
    daireDB = DaireDatabase();
    evSahibiDB = EvSahibiDatabase();
    kiraciDB = KiraciDatabase();

    //

    await apartmentDB.openBox();
    await userDB.openBox();
    await metaDB.openBox();
    await companyDB.openBox();
    await individualDB.openBox();
    await daireDB.openBox();
    await evSahibiDB.openBox();
    await kiraciDB.openBox();

    //
  }

  void closeBoxes() async {
    apartmentDB.closeBox();
    userDB.closeBox();
    metaDB.closeBox();
    companyDB.closeBox();
    individualDB.closeBox();
    daireDB.closeBox();
    evSahibiDB.closeBox();
    kiraciDB.closeBox();
  }
}
