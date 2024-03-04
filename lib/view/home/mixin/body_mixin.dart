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

  double firstWidth(BoxConstraints size) => size.maxWidth * (2 / 3);
  double secondWidth(BoxConstraints size) => size.maxWidth * (1 / 3);
}
