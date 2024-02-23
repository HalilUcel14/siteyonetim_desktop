import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            width: ViewEnum.zeta.size,
          ),
        ),
      ),
    );
  }
}
