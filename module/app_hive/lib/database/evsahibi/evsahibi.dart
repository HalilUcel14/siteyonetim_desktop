import 'package:codeofland/codeofland.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../app_hive.dart';

class EvSahibiDatabase extends IHiveManager<TBLEvSahibi> {
  EvSahibiDatabase() : super();

  ValueListenable<Box<TBLEvSahibi>> get boxListenable => box.listenable();
}
