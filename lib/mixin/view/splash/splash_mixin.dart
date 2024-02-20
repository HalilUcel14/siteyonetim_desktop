import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

mixin SplashMixin on State<SplashView> {
  //
  Future<AppMetaData> _getMetaDataFromHive() async {
    HiveMetaData metaData = HiveMetaData(boxName: MyHive.metadata.name);
    final val = await metaData.getItemById(AppString.metaDataId.text);
    return val;
  }

  Future<void> checkMetaData() async {
    final data = await _getMetaDataFromHive();
    await Future.delayed(DurationConst.second(2).duration);
    //

    if (data.id.isNullOrEmpty ||
        data.lastSign == null ||
        !isCheckBeforeThreeDays(data.lastSign) ||
        data.user == null) {
      //
      if (context.mounted) {
        context.pushNamedAndRemoveUntil(MyRoute.authLogin.name);
      }
    } else {
      if (context.mounted) {
        context.pushNamedAndRemoveUntil(MyRoute.home.name);
      }
    }
  }

  bool isCheckBeforeThreeDays(DateTime? lastSign) {
    if (lastSign == null) return false;
    final DateTime current = DateTime.now();
    //
    final Duration different = current.difference(lastSign);
    //
    return different < DurationEnum.lastSign.duration ? true : false;
  }

  @override
  void initState() {
    super.initState();
    checkMetaData();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
