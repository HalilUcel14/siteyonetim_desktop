import 'package:app_hive/app_hive.dart';
import 'package:hive/hive.dart';

final class HiveRegisterAdapter {
  static HiveRegisterAdapter? _of;
  static HiveRegisterAdapter get of => _of ??= HiveRegisterAdapter._();
  HiveRegisterAdapter._();

  void build() {
    Hive.registerAdapter(AppMetaDataAdapter());
    Hive.registerAdapter(HiveUserAdapter());
  }
}
