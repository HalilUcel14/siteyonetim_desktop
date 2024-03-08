import 'package:codeofland/codeofland.dart';
import 'package:flutter/material.dart';

import '../../../../index.dart';

mixin HomeBodyLeftChildMixin on State<HomeBodyLeftChild> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  SliverGridDelegateWithFixedCrossAxisCount delegate(
    BoxConstraints constraints,
  ) =>
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: constraints.maxWidth > 1500
            ? 4
            : constraints.maxWidth > 1000
                ? 3
                : constraints.maxWidth > 500
                    ? 2
                    : 1,
        crossAxisSpacing: SizeEnum.hexa.size,
        mainAxisSpacing: SizeEnum.hexa.size,
      );
}
