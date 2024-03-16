import 'package:app_hive/app_hive.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ApartmentFlatsCard extends StatelessWidget {
  const ApartmentFlatsCard({super.key, required this.list});

  final List<TBLDaire> list;

  @override
  Widget build(BuildContext context) {
    return RowWithSpacing(
      children: list
          .map(
            (daire) => ColumnWithSpacing(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WIconAsset(
                  path: MyAsset.house.iconPng,
                  size: double.infinity,
                ).expanded(),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Daire: ${daire.flats}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ).flexible()
              ],
            ).aspectRatio(1),
          )
          .toList(),
    );
  }
}
