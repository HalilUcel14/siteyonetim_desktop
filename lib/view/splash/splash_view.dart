import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SplashMixin {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _SplashChild(),
    );
  }
}

class _SplashChild extends StatelessWidget {
  const _SplashChild();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ColumnWithSpacing(
        children: [
          Icon(
            Icons.home,
            size: ViewEnum.teta.size,
          ),
          BoldText(
            AppString.appTitle.text,
            styles: TextStyles.displayMedium,
          ),
        ],
      ),
    );
  }
}
