import 'package:codeofland/codeofland.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

mixin HomeBodyMixin on State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool get isOpenDetail => context.sizeOf.width > 1000;
  int get apartmentFlex => 2;
  int get detailFlex => 1;
}
