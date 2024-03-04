import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

import '../../../../index.dart';

class HomeBodyLeftChild extends StatefulWidget {
  const HomeBodyLeftChild({super.key});

  @override
  State<HomeBodyLeftChild> createState() => _HomeBodyLeftChildState();
}

class _HomeBodyLeftChildState extends State<HomeBodyLeftChild>
    with HomeBodyLeftChildMixin {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // -----------------------------------
        // -----------------------------------
        return ValueListenableBuilder(
          valueListenable: HiveBoxesObject.of.apartmentDB.valueList,
          builder: (context, value, child) {
            final list = value.values.toList();
            // -----------------------------------
            return GridView.builder(
              gridDelegate: delegate(constraints),
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ApartmentCard(apartment: list[index]);
              },
            );
          },
        );
      },
    ).padding(pad: SizeEnum.hexa.size.withPaddingAll);
  }
}
