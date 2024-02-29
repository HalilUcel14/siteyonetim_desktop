import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
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
      body: Center(
        child: FractionallySizedBox(
          heightFactor: 0.8,
          alignment: Alignment.center,
          child: ColumnWithSpacing(
            children: [
              const AuhtImage().expanded(),
              const RegisterForm().expanded(),
            ],
          ).withSizedBox(
            height: double.infinity,
            width: SizeEnum.zeta.size,
          ),
        ),
      ),
    );
  }
}
