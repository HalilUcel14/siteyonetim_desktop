import 'package:codeofland/codeofland.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../app_hive.dart';

class KiraciDatabase extends IHiveManager<TBLKiraci> {
  KiraciDatabase() : super();

  ValueListenable<Box<TBLKiraci>> get boxListenable => box.listenable();

  //
  Future<bool> addNewTenant(TBLKiraci tenant) async {
    //
    if (tenant.uid == null) return Future.value(false);
    //
    if (isUsedEmail(tenant.customer?.email)) return Future.value(false);
    if (isUsedUserName(tenant.customer?.name)) return Future.value(false);
    //
    return await addBox(tenant.uid!, tenant);
  }

  bool isUsedUserName(String? name) {
    try {
      if (listBox().isEmpty) return false;
      //
      if (name.isNullOrEmpty) return false;
      //
      return listBox().any((db) => db.customer?.name == name);
    } catch (e) {
      return false;
    }
  }

  bool isUsedEmail(String? email) {
    try {
      if (listBox().isEmpty) return false;
      //
      if (email.isNullOrEmpty) return false;
      //
      return listBox().any((db) => db.customer?.email == email);
    } catch (e) {
      return false;
    }
  }
}
