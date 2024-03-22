import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> with HomeBodyMixin {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const ApartmentListCard().expanded(flex: apartmentFlex),
        // --------------------------------
        // --------------------------------
        const HomeBodyRightChild()
            .expanded(flex: detailFlex)
            .isVisibility(visible: isOpenDetail),
      ],
    );
  }
}
