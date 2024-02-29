import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

class _SplashChild extends StatefulWidget {
  const _SplashChild();

  @override
  State<_SplashChild> createState() => __SplashChildState();
}

class __SplashChildState extends State<_SplashChild> {
  double _progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    _simulateProgress();
  }

  void _simulateProgress() {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _progressValue += 0.1;
        if (_progressValue < 1.0) {
          _simulateProgress();
        } else {
          _progressValue = 1.0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppStyle.darkBlue,
                  AppStyle.grey,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: SizedBox(
              width: constraints.maxWidth / 1.5,
              height: constraints.maxHeight / 1.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: constraints.maxHeight / 20),
                  SvgPicture.asset('assets/logo/xlogo.svg',
                      height: constraints.maxHeight / 5),
                  SizedBox(height: constraints.maxHeight / 20),
                  SvgPicture.asset(
                    'assets/logo/logo.svg',
                    height: constraints.maxHeight / 10,
                    width: constraints.maxWidth / 10,
                  ),
                  SizedBox(height: constraints.maxHeight / 20),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth / 10),
                    child: LinearProgressIndicator(
                      value: _progressValue,
                      minHeight: constraints.maxHeight / 100,
                      borderRadius: BorderRadius.circular(200),
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight / 20),
                  Text('${(_progressValue * 100).toStringAsFixed(1)}%'),
                  SizedBox(height: constraints.maxHeight / 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
/*
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
}*/
