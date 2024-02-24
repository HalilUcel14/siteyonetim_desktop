import 'package:codeofland/codeofland.dart';

import '../../index.dart';

final class HiveMetaData extends HiveRepository<AppMetaData> {
  HiveMetaData({required super.boxName});

  @override
  Future<void> addItem(String id, AppMetaData item) async {
    await hiveBox.put(id, item);
  }

  @override
  Future<void> delete(String id) async {
    await hiveBox.delete(id);
  }

  @override
  Future<List<AppMetaData>> getAllItem() async {
    final response = hiveBox.values.toList();

    return response;
  }

  @override
  Future<AppMetaData> getItemById(String id) async {
    final response = hiveBox.get(id);

    if (response == null) {
      return AppMetaData.empty();
    }
    return response;
  }

  @override
  Future<void> update(String id, AppMetaData item) async {
    await hiveBox.put(id, item);
  }
}
