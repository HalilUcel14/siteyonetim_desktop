import 'package:codeofland/codeofland.dart';

import '../../index.dart';

final class HiveMetaData extends HiveRepository<AppMetaData> {
  HiveMetaData({required super.boxName});

  @override
  Future<void> addItem(String id, AppMetaData item) async {
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
  Future<List<AppMetaData>> getAllItem() async {
    await openBox();
    final response = hiveBox.values.toList();
    await closeBox();
    return response;
  }

  @override
  Future<AppMetaData> getItemById(String id) async {
    await openBox();
    final response = hiveBox.get(id);
    await closeBox();
    if (response == null) {
      return AppMetaData.empty();
    }
    return response;
  }

  @override
  Future<void> update(String id, AppMetaData item) async {
    await openBox();
    await hiveBox.put(id, item);
    await closeBox();
  }
}
