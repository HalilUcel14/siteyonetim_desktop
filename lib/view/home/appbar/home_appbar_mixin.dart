import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:core/feauture/index.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

mixin HomeAppBarMixin on State<HomeAppBar> {
  double get toolbarHeight => double.infinity;
  double get leadingWidth => SizeType.penta.size * 2;

  double iconSize(BoxConstraints size) => size.maxHeight * WPercent.pHalf.size;

  void get iconPressed => ScaffoldKeys.of.homeKey.openDrawerNullable;

  late LanguageNotifier lang;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant HomeAppBar oldWidget) {
    lang = LanguageNotifier.of(context);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    lang = LanguageNotifier.of(context);
    super.didChangeDependencies();
  }
}
