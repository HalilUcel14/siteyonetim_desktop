import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

mixin SplashMixin on State<SplashView> {
  late AppMetaDataBase metaData;

  @override
  void initState() {
    super.initState();
    ScaffoldKeys.of.splashKey = GlobalKey<ScaffoldState>();
    metaData = AppMetaDataBase();

    //
    controlMetaToPush();
  }

  @override
  void dispose() {
    metaData.closeBox();
    super.dispose();
  }

  Future<void> controlMetaToPush() async {
    BuildContext? mContext = ScaffoldKeys.of.splashKey.currentContext;
    mContext ??= context;
    bool check = await checkMetaData();
    //
    if (!mContext.mounted) return;
    if (check) {
      mContext.pushNamedAndRemoveUntil(MyRoute.home.name);
    } else {
      mContext.pushNamedAndRemoveUntil(MyRoute.authLogin.name);
    }
  }

  Future<bool> checkMetaData() async {
    await metaData.openBox();
    //
    await Future.delayed(DurationConst.second(2).duration);
    //
    final data = metaData.readBox(AppString.metaDataId.text);
    //
    if (data == null || data.uid.isNullOrEmpty) return false;
    //
    return isCheckBeforeThreeDays(data.lastSign);
    //
  }

  bool isCheckBeforeThreeDays(DateTime? lastSign) {
    if (lastSign == null) return false;
    final DateTime current = DateTime.now();
    //
    final Duration different = current.difference(lastSign);
    //
    return different < DurationEnum.lastSign.duration ? true : false;
  }
}
