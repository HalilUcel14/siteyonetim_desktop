import 'dart:ui';

import 'package:app_hive/app_hive.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:codeofland/codeofland.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInitializer.of.init();
  HiveRegisterAdapter.of.build();
  //
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    runApp(CustomErrorWidget(errorDetails: details));
  };
  //
  appWindow.size = const Size(800, 600);
  runApp(const MyApp());
  appWindow.show();
  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(800, 600);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = 'Site Yönetim';
    win.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.materialTitle.text,
      //
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppStyle.lightBlue),
        useMaterial3: true,
      ),
      //
      routes: AppRoute.of.route,
      initialRoute: MyRoute.splash.name,
    );
  }
}
