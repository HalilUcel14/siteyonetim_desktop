import 'package:codeofwidget/codeofwidget.dart';
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
    return Center(
      child: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 1,
        //--------------------------------
        child: DecoratedBox(
          decoration: SplashBoxDecoration(context),
          //--------------------------------
          child: FractionallySizedBox(
            widthFactor: 0.4,
            heightFactor: 0.4,
            //--------------------------------
            child: DecoratedBox(
              decoration: CircleIconDecoration(context),
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  LayoutBuilder get child => LayoutBuilder(
        builder: (context, constraints) {
          return WIconAsset(
            path: MyAsset.apartment.iconPng,
            size: constraints.maxWidth * PercentEnum.pNinety.size,
          );
        },
      );
}
