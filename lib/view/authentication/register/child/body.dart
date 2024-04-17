import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../index.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ColumnWithSpacing(
        children: [
          AuhtImage(
            path: MyAsset.signup.iconPng,
          ),
          const RegisterForm(),
        ],
      ).withSizedBox(
        width: SizeType.zeta.size,
      ),
    );
  }
}
