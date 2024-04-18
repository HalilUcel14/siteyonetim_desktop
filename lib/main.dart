import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:core/core.dart';
import 'package:core/feauture/index.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInitializer.of.init();
  HiveRegisterAdapter.of.build();
  await HiveBoxesObject.of.initBoxes();
  //
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return CustomErrorView(details: details);
  };
  // ---------------------
  // ---------------------
  runApp(const MyAppInherited());
  //
}

class MyAppInherited extends StatelessWidget {
  const MyAppInherited({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeNotifier(
      notifier: ThemeChange(),
      child: LanguageNotifier(
        notifier: LangManager(),
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //
      title: AppString.materialTitle.text,
      //
      debugShowCheckedModeBanner: false,
      //
      theme: context.isThemeLight ? LightTheme().theme : DarkTheme().theme,
      //
      routes: AppRoute.of.route,
      initialRoute: MyRoute.splash.name,
      //
    );
  }
}
