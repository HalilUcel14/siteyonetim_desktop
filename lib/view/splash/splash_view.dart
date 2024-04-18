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
    return Scaffold(
      key: ScaffoldKeys.of.splashKey,
      body: const _SplashChild(),
    );
  }
}

class _SplashChild extends StatelessWidget {
  const _SplashChild();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: SplashBoxDecoration(context),
      //--------------------------------
      child: FractionallySizedBox(
        heightFactor: 0.5,
        widthFactor: 0.5,
        child: WIconAsset(
          path: MyAsset.splash.iconPng,
          size: double.infinity,
        ),
      ),
    );
  }
}
