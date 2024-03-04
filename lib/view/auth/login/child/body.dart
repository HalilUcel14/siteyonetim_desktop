import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

import '../../../../index.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        heightFactor: 0.8,
        alignment: Alignment.center,
        child: ColumnWithSpacing(
          children: [
            const AuhtImage().expanded(),
            const LoginForm().expanded(),
          ],
        ).withSizedBox(
          height: double.infinity,
          width: SizeEnum.zeta.size,
        ),
      ),
    );
  }
}
