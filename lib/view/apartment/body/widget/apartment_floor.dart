import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

class ApartmentFloorCard extends StatelessWidget {
  const ApartmentFloorCard(
      {super.key, required this.floor, required this.child});

  final int floor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: RowWithSpacing(
        children: [
          Container(
            height: double.infinity,
            width: SizeType.mega.size,
            decoration: BoxDecoration(
              color: context.colorScheme.secondaryContainer,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              border: Border.all(
                color: context.colorScheme.onPrimary,
                width: 2,
              ),
            ),
            child: Center(
              child: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  'Floor ${floor + 1}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),

          // -----------------------------------
          child,
        ],
      ),
    ).withSizedBox(height: 300, width: double.infinity);
  }
}
