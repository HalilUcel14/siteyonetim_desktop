import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';

final class HiveUserRepository extends HiveRepository<HiveUser> {
  HiveUserRepository({required super.boxName});

  @override
  Future<void> addItem(String id, HiveUser item) async {
    await hiveBox.put(id, item);
  }

  @override
  Future<void> delete(String id) async {
    await hiveBox.delete(id);
  }

  @override
  Future<List<HiveUser>> getAllItem() async {
    final response = hiveBox.values.toList();

    return response;
  }

  @override
  Future<HiveUser> getItemById(String id) async {
    final response = hiveBox.get(id);

    if (response == null) {
      return HiveUser.empty();
    }
    return response;
  }

  @override
  Future<void> update(String id, HiveUser item) async {
    await hiveBox.put(id, item);
  }

  Future<bool> getItemByUserName(String userName, String password) async {
    final response = hiveBox.values.any(
      (user) => user.username == userName && user.password == password,
    );

    //
    if (response) {
      return true;
    }
    return false;
  }
}
