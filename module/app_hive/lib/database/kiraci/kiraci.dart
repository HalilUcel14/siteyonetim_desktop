import 'package:codeofland/codeofland.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../app_hive.dart';

class KiraciDatabase extends IHiveManager<TBLKiraci> {
  KiraciDatabase() : super();

  ValueListenable<Box<TBLKiraci>> get boxListenable => box.listenable();
}
