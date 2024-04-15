import 'package:app_hive/app_hive.dart';

final class HiveBoxesObject {
  static HiveBoxesObject? _of;
  static HiveBoxesObject get of => _of ??= HiveBoxesObject._();
  HiveBoxesObject._();
  //
  //
  late final AnnouncementDatabase announcementDB;
  late final ApartmentDatabase apartmentDB;
  late final ContractsDatabase contractsDB;
  late final CustomerDatabase customerDB;
  late final ExpensesDatabase expensesDB;
  late final ExpenseTypeDatabase expenseTypeDB;
  late final FlatsDatabase flatsDB;
  late final IncomeTypeDatabase incomeTypeDB;
  late final IncomesDatabase incomesDB;
  late final AppMetaDataBase metaDB;
  late final OwnerDatabase ownerDB;
  late final ReminderDatabase reminderDB;
  late final SubscriptionDatabase subscriptionDB;
  late final TenantDatabase tenantDB;
  late final TicketsDatabase ticketsDB;
  late final HiveUserDatabase userDB;

  Future<void> initBoxes() async {
    announcementDB = AnnouncementDatabase();
    apartmentDB = ApartmentDatabase();
    contractsDB = ContractsDatabase();
    customerDB = CustomerDatabase();
    expensesDB = ExpensesDatabase();
    expenseTypeDB = ExpenseTypeDatabase();
    flatsDB = FlatsDatabase();
    incomeTypeDB = IncomeTypeDatabase();
    incomesDB = IncomesDatabase();
    metaDB = AppMetaDataBase();
    ownerDB = OwnerDatabase();
    reminderDB = ReminderDatabase();
    subscriptionDB = SubscriptionDatabase();
    tenantDB = TenantDatabase();
    ticketsDB = TicketsDatabase();
    userDB = HiveUserDatabase();

    //
    await announcementDB.openBox();
    await apartmentDB.openBox();
    await contractsDB.openBox();
    await customerDB.openBox();
    await expensesDB.openBox();
    await expenseTypeDB.openBox();
    await flatsDB.openBox();
    await incomeTypeDB.openBox();
    await incomesDB.openBox();
    await metaDB.openBox();
    await ownerDB.openBox();
    await reminderDB.openBox();
    await subscriptionDB.openBox();
    await tenantDB.openBox();
    await ticketsDB.openBox();
    await userDB.openBox();
    //
  }

  void closeBoxes() {
    announcementDB.closeBox();
    apartmentDB.closeBox();
    contractsDB.closeBox();
    customerDB.closeBox();
    expensesDB.closeBox();
    expenseTypeDB.closeBox();
    flatsDB.closeBox();
    incomeTypeDB.closeBox();
    incomesDB.closeBox();
    metaDB.closeBox();
    ownerDB.closeBox();
    reminderDB.closeBox();
    subscriptionDB.closeBox();
    tenantDB.closeBox();
    ticketsDB.closeBox();
    userDB.closeBox();
  }
}
