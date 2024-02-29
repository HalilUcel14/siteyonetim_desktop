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
    super.dispose();
  }
}
