import 'package:app_hive/app_hive.dart';
import 'package:hive/hive.dart';

final class HiveRegisterAdapter {
  static HiveRegisterAdapter? _of;
  static HiveRegisterAdapter get of => _of ??= HiveRegisterAdapter._();
  HiveRegisterAdapter._();

  void build() {
    Hive.registerAdapter(AppMetaDataAdapter());
    Hive.registerAdapter(HiveUserAdapter());
    Hive.registerAdapter(TBLApartmentAdapter());
    Hive.registerAdapter(TBLContractsAdapter());
    Hive.registerAdapter(TBLCustomerAdapter());
    Hive.registerAdapter(TBLExpenseTypeAdapter());
    Hive.registerAdapter(TBLExpensesAdapter());
    Hive.registerAdapter(TBLFlatsAdapter());
    Hive.registerAdapter(TBLIncomeTypeAdapter());
    Hive.registerAdapter(TBLIncomesAdapter());
    Hive.registerAdapter(TBLOwnerAdapter());
    Hive.registerAdapter(TBLSubscriptionAdapter());
    Hive.registerAdapter(TBLTenantAdapter());
    Hive.registerAdapter(TBLAnnouncementAdapter());
    Hive.registerAdapter(TBLReminderAdapter());
    Hive.registerAdapter(TBLTagsAdapter());
  }
}
