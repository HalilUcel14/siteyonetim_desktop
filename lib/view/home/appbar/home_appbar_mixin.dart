import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

mixin HomeAppBarMixin on State<HomeAppBar> {
  double get toolbarHeight => double.infinity;
  double get leadingWidth => SizeEnum.penta.size * 2;

  double iconSize(BoxConstraints size) => size.maxHeight * WPercent.pHalf.size;

  void get iconPressed => ScaffoldKeys.of.homeKey.openDrawerSafety;
}
