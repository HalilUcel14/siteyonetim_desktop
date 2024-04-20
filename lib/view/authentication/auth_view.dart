import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import 'index.dart';

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
        // ------------------------
        return Scaffold(
          key: scaffoldKey,
          // ------------------------
          body: SingleChildScrollView(
            controller: scrollController,
            child: ColumnWithSpacing(
              // ------------------------
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ------------------------
                AuhtImage(
                  path: MyAsset.sign.iconPng,
                ),
                // ------------------------
                formChild,
                // ------------------------
              ],
            ),
          ).withSizedBox(width: SizeType.zeta.size).center(),
        );
      },
    );
  }
}
