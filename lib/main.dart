import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInitializer.of.init();
  HiveRegisterAdapter.of.build();
  //
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
      child: Container(
        color: Colors.green.shade600,
        child: Center(
          child: Text(details.exception.toString()),
        ),
      ),
    );
  };
  //
  runApp(const MyApp());
  //
  await HiveInitializer.of.close();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.materialTitle.text,
      //

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
    );
  }
}
