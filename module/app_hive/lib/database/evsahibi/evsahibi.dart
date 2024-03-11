import 'package:codeofland/codeofland.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../app_hive.dart';

class EvSahibiDatabase extends IHiveManager<TBLEvSahibi> {
  EvSahibiDatabase() : super();

  ValueListenable<Box<TBLEvSahibi>> get boxListenable => box.listenable();

  //
  Future<bool> addNewOwner(TBLEvSahibi owner) async {
    //
    if (owner.uid == null) return Future.value(false);
    //
    if (isUsedEmail(owner.customer?.email)) return Future.value(false);
    if (isUsedUserName(owner.customer?.name)) return Future.value(false);
    //
    return await addBox(owner.uid!, owner);
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
