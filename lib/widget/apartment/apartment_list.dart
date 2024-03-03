import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

class ApartmenBodyList extends StatelessWidget {
  const ApartmenBodyList({super.key, required this.apartment});

  final TBLApartment apartment;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ColumnWithSpacing(
            children: [
              WIconAsset(
                path: MyAsset.apartment.iconPng,
                size: SizeEnum.hepta.size,
              ),
              Text('${apartment.name}'),
              Text('(${apartment.buildYear!.year})'),
            ],
          );
        },
      ),
    );
  }
}
