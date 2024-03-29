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
  runApp(const MyAppInherited());
  //
}

class MyAppInherited extends StatefulWidget {
  const MyAppInherited({super.key});

  @override
  State<MyAppInherited> createState() => _MyAppInheritedState();
}

class _MyAppInheritedState extends State<MyAppInherited>
    with MyAppInheritedMixin {
  @override
  Widget build(BuildContext context) {
    return ThemeNotifier(
      notifier: themeModeType,
      child: LanguageNotifier(
        notifier: lang,
        child: const MyApp(),
      ),
    );
  }
}

mixin MyAppInheritedMixin on State<MyAppInherited> {
  late LangManager lang;
  late ThemeModeType themeModeType;

  @override
  void initState() {
    super.initState();
    themeModeType = ThemeModeType();
    lang = LangManager();
  }

  @override
  void dispose() {
    lang.dispose();
    themeModeType.dispose();
    super.dispose();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //

    bool? isLight() {
      final response = ThemeNotifier.of(context).notifier;
      if (response == null) return null;
      return response.isLight;
    }

    return MaterialApp(
      //
      title: AppString.materialTitle.text,
      //
      debugShowCheckedModeBanner: false,
      //

      //
      theme: isLight() ?? true ? LightTheme().theme : DarkTheme().theme,
      //
      routes: AppRoute.of.route,
      initialRoute: MyRoute.splash.name,
      //
    );
  }
}

// TODO: WBoldText ve WText düzeltmesi yap. super type olsun yada stless olsun