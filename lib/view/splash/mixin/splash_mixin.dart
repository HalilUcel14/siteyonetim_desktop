// ignore_for_file: use_build_context_synchronously

import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:core/core.dart';
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
    await Future.delayed(DurationConst.second(2).duration);
    //
    if (!context.mounted) return;
    //
    AppMetaData? meta = HiveBoxesObject.of.metaDB.meta;
    //
    if (HiveBoxesObject.of.metaDB.isNullable) return await goToAuth();
    //
    if (meta!.lastSign!.isBefore3Days) return await goToAuth();
    //
    return await goToHome();
  }

  Future<void> goToHome() async =>
      await context.pushNamedAndRemoveUntil(MyRoute.home.name);

  Future<void> goToAuth() async =>
      await context.pushNamedAndRemoveUntil(MyRoute.authLogin.name);
}
