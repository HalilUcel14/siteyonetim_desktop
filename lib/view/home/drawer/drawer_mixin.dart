import 'package:app_hive/index.dart';
import 'package:codeofland/codeofland.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

mixin HomeDrawerMixin on StatelessWidget {
  void logOutFunction() async {
    await HiveBoxesObject.of.metaDB.logOutUser();
    //
    await ScaffoldKeys.of.homeKey.pushReplacementNamedNullable(
      MyRoute.authLogin.name,
    );
  }

  bool isNullableUser() {
    if (HiveBoxesObject.of.metaDB.meta.isNull) return true;
    final HiveUser? value = HiveBoxesObject.of.metaDB.meta!.user;
    if (value.isNull) return true;
    return false;
  }

  String getUserName() {
    if (!isNullableUser()) {
      return HiveBoxesObject.of.metaDB.meta!.user!.username!;
    }
    return '';
  }

  String? getPlan() {
    if (!isNullableUser()) {
      return HiveBoxesObject.of.metaDB.meta!.user!.userType;
    }
    return null;
  }
}
