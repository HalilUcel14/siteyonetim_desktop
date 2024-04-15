import 'package:app_hive/app_hive.dart';
import 'package:flutter/widgets.dart';

extension DatabaseContextExtension on BuildContext {
  HiveBoxesObject get _hiveBoxes => HiveBoxesObject.of;

  AnnouncementDatabase get announcementDB => _hiveBoxes.announcementDB;
  ApartmentDatabase get apartmentDB => _hiveBoxes.apartmentDB;
  ContractsDatabase get contractsDB => _hiveBoxes.contractsDB;
  CustomerDatabase get customerDB => _hiveBoxes.customerDB;
  ExpensesDatabase get expensesDB => _hiveBoxes.expensesDB;
  ExpenseTypeDatabase get expenseTypeDB => _hiveBoxes.expenseTypeDB;
  FlatsDatabase get flatsDB => _hiveBoxes.flatsDB;
  IncomeTypeDatabase get incomeTypeDB => _hiveBoxes.incomeTypeDB;
  IncomesDatabase get incomesDB => _hiveBoxes.incomesDB;
  AppMetaDataBase get metaDB => _hiveBoxes.metaDB;
  OwnerDatabase get ownerDB => _hiveBoxes.ownerDB;
  ReminderDatabase get reminderDB => _hiveBoxes.reminderDB;
  SubscriptionDatabase get subscriptionDB => _hiveBoxes.subscriptionDB;
  TenantDatabase get tenantDB => _hiveBoxes.tenantDB;
  TicketsDatabase get ticketsDB => _hiveBoxes.ticketsDB;
  HiveUserDatabase get userDB => _hiveBoxes.userDB;
}
