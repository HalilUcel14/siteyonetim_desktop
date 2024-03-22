import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';

class DBApartment {
  static DBApartment? _of;
  static DBApartment get of => _of ??= DBApartment._();
  DBApartment._();

  Future<HiveResponse<TBLApartment>> create({
    required String name,
    String? address,
    required int floorCount,
    required int flatsCount,
    required DateTime buildYear,
    bool haveElevator = false,
  }) async {
    try {
      // --------------------
      String? userId = HiveBoxesObject.of.metaDB.userUid;
      // --------------------
      if (userId.isNullOrEmpty) {
        return HiveResponse(
          data: null,
          message: 'Aktif Kullanıcı Bulunamadı!',
          hasError: true,
        );
      }
      // --------------------
      TBLApartment apartment = TBLApartment(
        uid: RandomKey.generate(),
        userUid: userId,
        name: name,
        address: address,
        floorCount: floorCount,
        flatsCount: flatsCount,
        buildYear: buildYear,
        haveElevator: haveElevator,
        isActive: true,
      );
      // --------------------
      final checkName = HiveBoxesObject.of.apartmentDB.isHasName(apartment);
      // --------------------
      if (checkName) {
        return HiveResponse(
          data: null,
          message: 'Apartman İsmi Daha Önce Kullanılmıştır!',
          hasError: true,
        );
      }
      // --------------------
      final checkUid = HiveBoxesObject.of.apartmentDB.isHasUid(apartment);
      // --------------------
      if (checkUid) {
        return HiveResponse(
          data: null,
          message: 'Bu apartman zaten mevcut!',
          hasError: true,
        );
      }
      // --------------------
      final created = await HiveBoxesObject.of.apartmentDB.addBox(
        apartment.uid!,
        apartment,
      );
      // --------------------
      if (created) {
        return HiveResponse(
          data: apartment,
          message: 'Apartman başarıyla oluşturuldu!',
          hasError: false,
        );
      } else {
        return HiveResponse(
          data: null,
          message: 'Apartman oluşturulurken bir hata oluştu!',
          hasError: true,
        );
      }
    } catch (e) {
      return HiveResponse(
        data: null,
        message: 'Apartman oluşturulurken bir hata oluştu!',
        hasError: true,
      );
    }
  }
}
