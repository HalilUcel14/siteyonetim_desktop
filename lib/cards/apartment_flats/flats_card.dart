import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class FlatsCard extends StatefulWidget {
  const FlatsCard({super.key, required this.flats});

  final TBLFlats flats;

  @override
  State<FlatsCard> createState() => _FlatsCardState();
}

class _FlatsCardState extends State<FlatsCard> {
  @override
  Widget build(BuildContext context) {
    return WIconAsset(
      path: MyAsset.house.iconPng,
      size: SizeType.hepta.size,
    ).padding(pad: SizeType.hexa.size.withPaddingHorizontal);
  }
}
