import 'package:codeofland/codeofland.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../app_hive.dart';

class IndividualDatabase extends IHiveManager<TBLIndividual> {
  IndividualDatabase() : super();

  ValueListenable<Box<TBLIndividual>> get boxListenable => box.listenable();
}
