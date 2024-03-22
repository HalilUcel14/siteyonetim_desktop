import 'package:codeofland/codeofland.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../app_hive.dart';

class ApartmentDatabase extends IHiveManager<TBLApartment> {
  ApartmentDatabase() : super();

  ValueListenable<Box<TBLApartment>> get valueList => box.listenable();
}
