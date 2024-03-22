import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ApartmentCard extends StatelessWidget {
  final TBLApartment apartment;
  const ApartmentCard({super.key, required this.apartment});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: LayoutBuilder(builder: (context, size) {
        return ColumnWithSpacing(
          spacing: SizeType.hexa.size,
          children: [
            iconSymbol,
            //
            title(context),
            //
          ],
        );
      }),
    ).aspectRatio(1);
  }

  Widget get iconSymbol {
    return WIconAsset(
      path: MyAsset.apartment.iconPng,
      size: double.infinity,
    ).expanded();
  }

  Widget title(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: WColor.primaryContainer.color(context),
        borderRadius: BorderRadius.circular(SizeType.ennea.size),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: WColor.onPrimaryContainer.color(context),
          width: SizeType.ennea.size,
        ),
      ),
      child: WBoldText(
        '${apartment.name}',
        wStyle: WTextStyle.titleLarge,
        wColor: WTextColor.onPrimaryContainer,
      ),
    );
  }
}
