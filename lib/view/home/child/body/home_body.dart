import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';
import 'package:siteyonetim/index.dart';

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
        return RowWithSpacing(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // HomeBodyLeftChild(apartmanList: apartmanList()).withSizedBox(
            //   height: double.infinity,
            //   width: size.maxWidth * (2 / 3),
            // ),
            HomeBodyLeftChild(
              stream: apartmentStream(),
            ),
            // --------------------------------
            // --------------------------------
            HomeBodyRightChild(apartmanList: apartmanList()).withSizedBox(
              height: double.infinity,
              width: size.maxWidth * (1 / 3),
            ),
          ],
        );
      },
    );
  }
}
