import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

class ApartmentCard extends StatelessWidget {
  final TBLApartment apartment;
  const ApartmentCard({super.key, required this.apartment});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ColumnWithSpacing(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // -------------------------
          WIconAsset(
            path: MyAsset.apartment2.iconPng,
            size: double.infinity,
          ).padding(pad: SizeEnum.octa.size.withPaddingAll).expanded(flex: 5),
          // -------------------------
          BorderButton(
            onPressed: () async => await context.pushNamed(
              MyRoute.apartment.name,
              agrument: apartment,
            ),
            child: CBoldText(
              '${apartment.name}',
              styles: StyleType.bodyLarge,
              style: TextStyles.bodyLarge.style(context)?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ).expanded(),
          // --------------------------
          CBoldText(
            '(${apartment.buildYear!.year})',
            styles: StyleType.headlineLarge,
            type: TextType.error,
          ).expanded(),
          // --------------------------
        ],
      ).padding(pad: SizeEnum.octa.size.withPaddingAll),
    ).aspectRatio(2 / 3);
  }
}
