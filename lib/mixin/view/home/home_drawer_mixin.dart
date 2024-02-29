import 'package:app_hive/index.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

mixin HomeDrawerMixin on StatelessWidget {
  void logOutFunction() async {
    final metaData = AppMetaDataBase();
    await metaData.openBox();
    await metaData.logOutUser(AppString.metaDataId.text);
    //
    await ScaffoldKeys.of.homeKey.pushNamedAndRemoveUntil(
      MyRoute.authLogin.name,
    );
  }
}
