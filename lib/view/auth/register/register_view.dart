import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with RegisterViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ScaffoldKeys.of.registerKey,
      body: const RegisterViewBody(),
    );
  }
}
