import 'package:codeofland/codeofland.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../app_hive.dart';

class DaireDatabase extends IHiveManager<TBLDaire> {
  DaireDatabase() : super();

  ValueListenable<Box<TBLDaire>> get boxListenable => box.listenable();
}
