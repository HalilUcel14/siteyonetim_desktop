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
    if (isUsedEmailOrName(owner.customer)) return Future.value(false);
    //
    if (owner.uid == null) return Future.value(false);
    //
    return await addBox(owner.uid!, owner);
  }

  bool isUsedEmailOrName(CustomerModel? customer) {
    try {
      if (listBox().isEmpty) return false;
      //
      if (customer == null) return false;
      //
      return listBox().any(
        (db) =>
            db.customer?.email == customer.email ||
            db.customer?.name == customer.name,
      );
    } catch (e) {
      return false;
    }
  }
}
