import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

class ApartmentCard extends StatelessWidget {
  final TBLApartment apartment;
  const ApartmentCard({super.key, required this.apartment});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        double cSpacing = size.maxHeight > 400
            ? SizeEnum.ennea.size
            : size.maxHeight > 300
                ? SizeEnum.hexa.size
                : size.maxHeight > 200
                    ? SizeEnum.octa.size
                    : 0;

        //------------------------
        return Card(
          child: ColumnWithSpacing(
            spacing: cSpacing,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WIconAsset(
                path: MyAsset.apartment2.iconPng,
                size: size.maxHeight * PercentEnum.pHalf.size,
              ).expanded(flex: 2),
              // -------------------------
              BorderButton(
                onPressed: () async {
                  // await Navigator.of(context).pushNamed(
                  //   MyRoute.apartment.name,
                  //   arguments: apartment,
                  // );
                  await context.pushNamed(
                    MyRoute.apartment.name,
                    agrument: apartment,
                  );
                },
                child: Text(
                  '${apartment.name}',
                  style: TextStyles.bodyLarge.style(context)?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ).flexible(),
              // --------------------------
              BoldText(
                '(${apartment.buildYear!.year})',
                styles: TextStyles.bodyLarge,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ).flexible(),
              // --------------------------
            ],
          ),
        );
      },
    );
  }
}
