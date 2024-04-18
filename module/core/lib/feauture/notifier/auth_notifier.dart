import 'package:flutter/foundation.dart';

import '../../core.dart';

class AuthTypeNotifier extends ValueNotifier<AuthType> {
  AuthTypeNotifier(super.value);

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
