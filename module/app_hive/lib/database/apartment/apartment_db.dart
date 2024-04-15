import 'package:codeofland/codeofland.dart';

import '../../app_hive.dart';

final class ApartmentDatabase extends IHiveManager<TBLApartment> {
  ApartmentDatabase() : super();
}

extension CreateApartmentDB on ApartmentDatabase {
  Future<HiveResponse<TBLApartment>> create({
    required String name,
    String? address,
    required int floor,
    required int flats,
    required DateTime buildYear,
    bool haveElevator = false,
  }) async {
    try {
      if (HiveBoxesObject.of.metaDB.userUid.isNullOrEmpty) {
        return HiveResponse<TBLApartment>(
          data: null,
          message: 'Aktif Kullanıcı Bulunamadı!',
          hasError: true,
        );
      }

      TBLApartment apartment = TBLApartment(
        uid: RandomKey.generate(),
        userUid: HiveBoxesObject.of.metaDB.userUid,
        name: name,
        address: address,
        floor: floor,
        flats: flats,
        buildYear: buildYear,
        haveElevator: haveElevator,
        isActive: true,
        createdAt: DateTime.now(),
      );
      // --------------------
      final response = await addBox(apartment.uid!, apartment);
      // --------------------
      if (response) {
        return HiveResponse<TBLApartment>(
          data: apartment,
          message: 'Apartman başarıyla oluşturuldu!',
          hasError: false,
        );
      }
      // --------------------
      return HiveResponse<TBLApartment>(
        data: null,
        message: 'Apartman oluşturulurken bir hata oluştu!',
        hasError: true,
      );
      // --------------------
    } catch (e) {
      return HiveResponse<TBLApartment>(
        data: null,
        message: e.toString(),
        hasError: true,
      );
    }
  }
}
