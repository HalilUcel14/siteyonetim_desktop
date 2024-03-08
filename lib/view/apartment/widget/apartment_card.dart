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
    return Card(
      child: LayoutBuilder(
        builder: (context, sizes) {
          return ColumnWithSpacing(
            spacing: SizeEnum.octa.size,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WIconAsset(
                path: MyAsset.apartment2.iconPng,
                size: double.infinity,
                //size: sizes.maxHeight * PercentEnum.pHalf.size,
              ).expanded(flex: 5),
              // -------------------------
              BorderButton(
                onPressed: () async {
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
              ).expanded(),
              // --------------------------
              BoldText(
                '(${apartment.buildYear!.year})',
                styles: TextStyles.bodyLarge,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ).expanded(),
              // --------------------------
            ],
          ).padding(pad: SizeEnum.octa.size.withPaddingAll);
        },
      ),
    ).aspectRatio(2 / 3);
  }
}
