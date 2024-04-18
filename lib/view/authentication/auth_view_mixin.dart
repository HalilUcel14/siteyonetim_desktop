import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

mixin AuthViewStateMixin on State<AuthView> {
  late AuthTypeNotifier authNotifier;
  late ScrollController scrollController;
  @override
  void initState() {
    ScaffoldKeys.of.loginKey = GlobalKey<ScaffoldState>();
    ScaffoldKeys.of.registerKey = GlobalKey<ScaffoldState>();
    ScaffoldKeys.of.forgotKey = GlobalKey<ScaffoldState>();
    scrollController = ScrollController();
    authNotifier = AuthTypeNotifier(AuthType.login);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    ScaffoldKeys.of.loginKey.currentState?.dispose();
    ScaffoldKeys.of.registerKey.currentState?.dispose();
    ScaffoldKeys.of.forgotKey.currentState?.dispose();
    scrollController.dispose();
    authNotifier.dispose();
  }

  GlobalKey<ScaffoldState> get scaffoldKey => switch (authNotifier.value) {
        AuthType.login => ScaffoldKeys.of.loginKey,
        AuthType.register => ScaffoldKeys.of.registerKey,
        AuthType.forgot => ScaffoldKeys.of.forgotKey,
      };

  Widget get formChild => switch (authNotifier.value) {
        AuthType.login => LoginForm(notifier: authNotifier),
        AuthType.register => RegisterForm(notifier: authNotifier),
        AuthType.forgot => Container(),
      };
}
