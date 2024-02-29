import 'package:flutter/material.dart';

import '../../../index.dart';

mixin HomeViewMixin on State<HomeView> {
  @override
  void initState() {
    super.initState();
    ScaffoldKeys.of.homeKey = GlobalKey<ScaffoldState>();
  }

  @override
  void dispose() {
    ScaffoldKeys.of.homeKey.currentState?.dispose();
    super.dispose();
  }
}
