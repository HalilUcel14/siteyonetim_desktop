import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

final class AppRoute {
  static AppRoute? _of;
  static AppRoute get of => _of ??= AppRoute._();
  AppRoute._();

  Map<String, Widget Function(BuildContext context)> route = {
    MyRoute.home.name: (context) => const HomeView(),
    MyRoute.splash.name: (context) => const SplashView(),
    MyRoute.authLogin.name: (context) => const LoginView(),
    MyRoute.authRegister.name: (context) => const RegisterView(),
  };
}
