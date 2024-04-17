import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';

import 'package:flutter/material.dart';

import '../../index.dart';

class AuthNotifier extends ValueNotifier<AuthType> {
  AuthNotifier(super.value);

  void typeLogin() {
    value = AuthType.login;
  }

  void typeRegister() {
    value = AuthType.register;
  }

  void typeForgot() {
    value = AuthType.forgot;
  }
}

late AuthNotifier authNotifier;

enum AuthType {
  login,
  register,
  forgot,
}

mixin AuthViewStateMixin on State<AuthView> {
  @override
  void initState() {
    ScaffoldKeys.of.loginKey = GlobalKey<ScaffoldState>();
    ScaffoldKeys.of.registerKey = GlobalKey<ScaffoldState>();
    ScaffoldKeys.of.forgotKey = GlobalKey<ScaffoldState>();
    authNotifier = AuthNotifier(AuthType.login);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    ScaffoldKeys.of.loginKey.currentState?.dispose();
    ScaffoldKeys.of.registerKey.currentState?.dispose();
    ScaffoldKeys.of.forgotKey.currentState?.dispose();
    authNotifier.dispose();
  }

  GlobalKey<ScaffoldState> get scaffoldKey => switch (authNotifier.value) {
        AuthType.login => ScaffoldKeys.of.loginKey,
        AuthType.register => ScaffoldKeys.of.registerKey,
        AuthType.forgot => ScaffoldKeys.of.forgotKey,
      };

  Widget get formChild => switch (authNotifier.value) {
        AuthType.login => const LoginForm(),
        AuthType.register => const RegisterForm(),
        AuthType.forgot => Container(),
      };
}

class AuthView extends StatefulWidget {
  const AuthView({
    super.key,
  });

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> with AuthViewStateMixin {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: authNotifier,
      builder: (context, type, child) {
        print(type.toString());
        // ------------------------
        return Scaffold(
          key: scaffoldKey,
          body: SingleChildScrollView(
            controller: ScrollController(),
            child: ColumnWithSpacing(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AuhtImage(),
                // ------------------------
                formChild,
              ],
            )
                .withSizedBox(
                  width: SizeType.zeta.size,
                )
                .center(),
          ),
        );
      },
    );
  }
}
