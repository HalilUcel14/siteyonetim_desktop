import 'package:codeofland/codeofland.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../app_hive.dart';

class DaireDatabase extends IHiveManager<TBLDaire> {
  DaireDatabase() : super();

  ValueListenable<Box<TBLDaire>> get boxListenable => box.listenable();

  //
  Future<bool> addNewDaire(TBLDaire daire) async {
    //
    if (daire.uid == null) return Future.value(false);
    //
    if (isUsedDaireNoAndKatNo(daire)) return Future.value(false);
    //
    return await addBox(daire.uid!, daire);
  }

  bool isUsedDaireNoAndKatNo(TBLDaire daire) {
    try {
      if (listBox().isEmpty) return false;
      //
      if (daire.floor == null) return false;
      if (daire.flats == null) return false;
      //
      return listBox().any(
        (db) => db.flats == daire.flats && db.floor == daire.floor,
      );
    } catch (e) {
      return false;
    }
  }
}
