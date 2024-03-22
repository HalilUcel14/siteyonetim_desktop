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
}
