import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';

import 'package:flutter/material.dart';

import '../../index.dart';

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

  EdgeInsets get padding => SizeEnum.hexa.size.withPaddingAll;

  FloatingActionButton get floatingButton {
    return FloatingActionButton(
      child: const Icon(Icons.home),
      onPressed: () {
        if (!context.mounted) return;
        context.customShowDialog(
          dialog: CustomDialog(
            child: const FormViewDialog(child: ApartmentForm()),
          ),
        );
      },
    );
  }
}
