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
    return GestureDetector(
      onDoubleTap: () => doubleTab(context),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeType.tetra.size),
        ),
        child: ColumnWithSpacing(
          children: [
            //
            title().expanded(),
            //
            iconSymbol.expanded(flex: 5),
            //
            buildYear().expanded(),
            //
          ],
        ).padding(pad: SizeType.octa.size.withPaddingTop),
      ),
    );
  }

  Widget get iconSymbol {
    return WIconAsset(
      path: MyAsset.apartment2.iconPng,
      size: double.infinity,
    ).padding(pad: SizeType.hexa.size.withPaddingAll);
  }

  Widget title() {
    return WBoldText(
      '${apartment.name}',
      wStyle: WTextStyle.titleLarge,
      wColor: WTextColor.onPrimaryContainer,
    ).fittedBox();
  }

  Widget buildYear() {
    return WBoldText(
      '(${apartment.buildYear?.year})',
      wStyle: WTextStyle.titleLarge,
      wColor: WTextColor.onPrimaryContainer,
    ).fittedBox();
  }

  void doubleTab(BuildContext context) => Navigator.of(context).pushNamed(
        MyRoute.apartment.name,
        arguments: apartment,
      );
}
