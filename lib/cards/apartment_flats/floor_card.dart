import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';
import 'package:siteyonetim/index.dart';

class FloorCards extends StatefulWidget {
  const FloorCards({super.key, required this.floor, required this.floorNumber});

  final List<TBLDaire> floor;
  final int floorNumber;

  @override
  State<FloorCards> createState() => _FloorCardsState();
}

class _FloorCardsState extends State<FloorCards> with FloorCardsMixin {
  @override
  Widget build(BuildContext context) {
    return stackView;
  }

  Widget get stackView => LayoutBuilder(
        builder: (context, size) {
          return Column(
            children: [
              Stack(
                children: [
                  // ------------------------
                  Column(
                    children: [
                      // ------------------------
                      SizedBox(height: SizeType.ennea.size),
                      // ------------------------
                      Container(
                        decoration: decoration,
                        height: SizeType.teta.size,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.floor.length,
                          itemBuilder: (context, index) {
                            final flats = widget.floor[index];
                            return FlatsCard(flats: flats);
                          },
                        ),
                      ),
                    ],
                  ),
                  // ------------------------
                  Positioned(
                    top: 0,
                    left: size.maxWidth / 2 - SizeType.mega.size,
                    right: size.maxWidth / 2 - SizeType.mega.size,
                    child: Container(
                      decoration: titleDecoration,
                      height: SizeType.penta.size,
                      child: WBoldText(
                        text: 'Kat: ${widget.floorNumber}',
                      ).center(),
                    ),
                  ),
                  // ------------------------
                ],
              ),
              // ------------------------
              SizedBox(height: SizeType.ennea.size),
            ],
          );
        },
      );
}

mixin FloorCardsMixin on State<FloorCards> {
  BoxDecoration get decoration => BoxDecoration(
        color: WColor.background.color(context),
        borderRadius: BorderRadius.circular(SizeType.hexa.size),
        border: Border.all(
          color: WColor.onBackground.color(context),
          width: 1,
          style: BorderStyle.solid,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      );

  BoxDecoration get titleDecoration => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(SizeType.hexa.size),
        border: Border.all(
          color: WColor.onBackground.color(context),
          width: 1,
          style: BorderStyle.solid,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      );
}
