import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:siteyonetim/index.dart';

class ApartmentCard extends StatefulWidget {
  final TBLApartment apartment;
  const ApartmentCard({super.key, required this.apartment});

  @override
  State<ApartmentCard> createState() => _ApartmentCardState();
}

class _ApartmentCardState extends State<ApartmentCard> with ApartmentCardMixin {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      return Column(
        children: [
          // --------------------------
          // --------------------------
          DecoratedBox(
            decoration: apartmentDecoration,
            child: iconSymbol(size),
          ).withSizedBox(width: cardWidth, height: cardHeight(size)),
          // --------------------------
          // --------------------------
          DecoratedBox(
            decoration: titleDecoration,
            child: titleView,
          ).withSizedBox(width: cardWidth, height: titleHeight(size)),
          // --------------------------
          // --------------------------
        ],
      );
    });
  }

  Widget get titleView {
    return GestureDetector(
      onDoubleTap: () => doubleTab(),
      child: WBoldText(
        text: '${widget.apartment.name}',
        wStyle: WTextStyle.titleLarge,
      ).center(),
    );
  }

  Widget iconSymbol(BoxConstraints size) {
    return WIconAsset(
      path: MyAsset.apartment5.iconPng,
      size: iconHeight(size),
    ).padding(pad: SizeType.hexa.size.withPaddingAll);
  }
}
