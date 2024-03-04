import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

import '../../../../index.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> with HomeBodyMixin {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HomeBodyLeftChild().withSizedBox(
              height: double.infinity,
              width: firstWidth(size),
            ),
            // --------------------------------
            // --------------------------------
            const HomeBodyRightChild().withSizedBox(
              height: double.infinity,
              width: secondWidth(size),
            ),
          ],
        );
      },
    );
  }
}
