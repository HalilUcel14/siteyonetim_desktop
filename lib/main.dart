import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:core/core.dart';
import 'package:core/feauture/index.dart';
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
  // ---------------------
  // ---------------------
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
    //
    return LanguageManager(
      lang: lang,
      child: MaterialApp(
        //
        title: AppString.materialTitle.text,

        //
        debugShowCheckedModeBanner: false,
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
        //
      ),
    );
  }
}

mixin MainAppMixin on State<MyApp> {
  late LangManager lang;

  @override
  void initState() {
    super.initState();
    lang = LangManager();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //languageManager = LanguageManager.of(context);
  }
}
