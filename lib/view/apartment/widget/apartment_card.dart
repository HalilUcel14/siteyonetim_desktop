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
            onPressed: () async => await Navigator.of(context).pushNamed(
              MyRoute.apartment.name,
              arguments: apartment,
            ),
            child: WBoldText(
              '${apartment.name}',
            ),
          ).expanded(),
          // --------------------------
          WBoldText(
            '(${apartment.buildYear!.year})',
            wStyle: WTextStyle.titleLarge,
            wColor: WTextColor.onError,
          ).expanded(),
          // --------------------------
        ],
      ).padding(pad: SizeEnum.octa.size.withPaddingAll),
    ).aspectRatio(2 / 3);
  }
}
