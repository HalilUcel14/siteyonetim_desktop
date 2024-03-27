import 'package:app_hive/app_hive.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ApartmentCard extends StatelessWidget {
  final TBLApartment apartment;
  const ApartmentCard({super.key, required this.apartment});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: WColor.onBackground.color(context),
          width: 1,
        ),
      ),
      child: ColumnWithSpacing(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        key: GlobalKey(),
        children: [
          iconSymbol,
          title(context).flexible(),
        ],
      ),
    );
  }

  Widget get iconSymbol {
    return WIconAsset(
      path: MyAsset.apartment4.iconPng,
      size: 200,
    );
  }

  Widget title(BuildContext context) {
    return ElevatedButton(
      onPressed: () => doubleTab(context),
      child: WBoldText(
        text: '${apartment.name}',
        wStyle: WTextStyle.titleLarge,
        wColor: WColor.onBackground,
      ),
    ).withSizedBox(height: 36, width: 150);
  }

  void doubleTab(BuildContext context) => Navigator.of(context).pushNamed(
        MyRoute.apartment.name,
        arguments: apartment,
      );
}
