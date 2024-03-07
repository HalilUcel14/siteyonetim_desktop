import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';

import 'package:flutter/material.dart';

import '../../../index.dart';

mixin SplashMixin on State<SplashView> {
  @override
  void initState() {
    super.initState();
    ScaffoldKeys.of.splashKey = GlobalKey<ScaffoldState>();
    //
    controlMetaToPush();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> controlMetaToPush() async {
    bool check = true;
    await Future.delayed(DurationConst.second(2).duration);
    //
    AppMetaData? meta = HiveBoxesObject.of.metaDB.meta;
    //
    if (!HiveBoxesObject.of.metaDB.isNullable) check = false;
    //
    if (meta!.lastSign!
        .isBefore(DateTime.now().subtract(DurationConst.day(3).duration))) {
      check = false;
    }
    //
    if (check) {
      //
    } else {
      //Navigator.pushReplacementNamed(context, RouteName.sign);
    }
  }
}
