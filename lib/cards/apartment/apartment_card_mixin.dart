import 'package:codeofland/index.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:siteyonetim/index.dart';

mixin ApartmentCardMixin on State<ApartmentCard> {
  BoxDecoration get apartmentDecoration => BoxDecoration(
        border: Border.all(
          color: WColor.onBackground.color(context),
          width: 1,
        ),
        borderRadius: SizeType.ennea.size.radiusCircleOnlytop,
      );

  BoxDecoration get titleDecoration => BoxDecoration(
        border: Border.all(
          color: WColor.onBackground.color(context),
          width: 1,
        ),
        color: WColor.primaryContainer.color(context),
        borderRadius: SizeType.ennea.size.radiusCircleOnlyBottom,
      );

  void doubleTab() => Navigator.of(context).pushNamed(
        MyRoute.apartment.name,
        arguments: widget.apartment,
      );

  double get cardWidth => 200;
  double cardHeight(BoxConstraints size) =>
      size.maxHeight * WPercent.pEighty.size;
  double titleHeight(BoxConstraints size) =>
      size.maxHeight * WPercent.pTwenty.size;
  double iconHeight(BoxConstraints size) =>
      size.maxHeight * WPercent.p3Quarter.size;
}
