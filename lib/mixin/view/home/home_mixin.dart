import 'package:app_hive/app_hive.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

mixin HomeViewMixin on State<HomeView> {
  @override
  void initState() {
    super.initState();
    ScaffoldKeys.of.homeKey = GlobalKey<ScaffoldState>();
    HiveBoxesObject.of.initBoxes();
  }

  @override
  void dispose() {
    ScaffoldKeys.of.homeKey.currentState?.dispose();
    HiveBoxesObject.of.closeBoxes();
    super.dispose();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }
}
