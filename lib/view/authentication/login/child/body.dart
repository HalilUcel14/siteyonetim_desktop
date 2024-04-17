import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/feauture/enum/asset/my_asset.dart';
import 'package:flutter/material.dart';

import '../../../../index.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ColumnWithSpacing(
        children: [
          AuhtImage(
            path: MyAsset.sign.iconPng,
          ),
          const LoginForm(),
        ],
      ).withSizedBox(
        width: SizeType.zeta.size,
      ),
    );
  }
}
