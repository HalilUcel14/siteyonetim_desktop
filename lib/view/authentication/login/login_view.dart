import 'package:flutter/material.dart';

import '../../../index.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: const LoginViewBody(),
    );
  }
}
