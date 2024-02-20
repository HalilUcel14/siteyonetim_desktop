import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';

final class HiveUserRepository extends HiveRepository<HiveUser> {
  HiveUserRepository({required super.boxName});

  @override
  Future<void> addItem(String id, HiveUser item) async {
    await openBox();
    await hiveBox.put(id, item);
    await closeBox();
  }

  @override
  Future<void> delete(String id) async {
    await openBox();
    await hiveBox.delete(id);
    await closeBox();
  }

  @override
  Future<List<HiveUser>> getAllItem() async {
    await openBox();
    final response = hiveBox.values.toList();
    await closeBox();
    return response;
  }

  @override
  Future<HiveUser> getItemById(String id) async {
    await openBox();
    final response = hiveBox.get(id);
    await closeBox();
    if (response == null) {
      return const HiveUser.empty();
    }
    return response;
  }

  @override
  Future<void> update(String id, HiveUser item) async {
    await openBox();
    await hiveBox.put(id, item);
    await closeBox();
  }

  Future<bool> getItemByUserName(String userName, String password) async {
    await openBox();
    final response = hiveBox.values.any(
      (user) => user.username == userName && user.password == password,
    );
    await closeBox();
    //
    if (response) {
      return true;
    }
    return false;
  }
}
