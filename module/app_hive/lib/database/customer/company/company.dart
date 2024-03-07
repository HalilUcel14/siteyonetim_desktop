import '../../../app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CompanyDatabase extends IHiveManager<TBLCompany> {
  CompanyDatabase() : super();

  ValueListenable<Box<TBLCompany>> get boxListenable => box.listenable();
}
