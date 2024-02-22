import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

// TODO: Change My Packaged to my errors

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
      child: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 1,
        child: DecoratedBox(
          decoration: SplashBoxDecoration(context),
          child: FractionallySizedBox(
            widthFactor: 0.4,
            heightFactor: 0.4,
            child: DecoratedBox(
              decoration: CircleIconDecoration(context),
              child: WIconAsset(
                path: MyAsset.apartment.iconPng,
                size: ViewEnum.teta.size,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
