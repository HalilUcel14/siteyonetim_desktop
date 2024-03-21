import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

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
  //
  runApp(const MyApp());
  //
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with MainAppMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //

      title: AppString.materialTitle.text,
      //
      debugShowCheckedModeBanner: false,
      //
      // TODO: Plans Banner for the app Free Banner
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: child!,
        );
      },
      //
      theme: LightTheme().theme,
      //
      routes: AppRoute.of.route,
      initialRoute: MyRoute.splash.name,
      //
    );
  }
}

mixin MainAppMixin on State<MyApp> {
  @override
  void dispose() {
    HiveBoxesObject.of.closeBoxes();
    super.dispose();
  }
}
