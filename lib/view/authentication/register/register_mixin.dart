import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

mixin RegisterViewMixin on State<RegisterView> {
  @override
  void initState() {
    super.initState();
    ScaffoldKeys.of.registerKey = GlobalKey<ScaffoldState>();
  }

  @override
  void dispose() {
    ScaffoldKeys.of.registerKey.currentState?.dispose();
    super.dispose();
  }
}
