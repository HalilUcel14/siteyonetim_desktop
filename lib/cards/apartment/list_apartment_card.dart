import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../index.dart';

class ApartmentListCard extends StatelessWidget with ApartmentListMixin {
  const ApartmentListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return apartmentListenable(
      builder: (context, box, child) {
        // --------------------------------
        final list = box.getUserList(HiveBoxesObject.of.metaDB.userUid!);
        // --------------------------------
        return LayoutBuilder(
          builder: (context, sizes) {
            // --------------------------------
            return GridView.builder(
              gridDelegate: delegate(sizes),
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ApartmentCard(
                  apartment: list[index],
                );
              },
            );
          },
        );
      },
    );
  }
}

mixin ApartmentListMixin on StatelessWidget {
  ValueListenableBuilder<Box<TBLApartment>> apartmentListenable({
    required Widget Function(
      BuildContext context,
      Box<TBLApartment> box,
      Widget? child,
    ) builder,
    Key? key,
  }) {
    return ValueListenableBuilder<Box<TBLApartment>>(
      key: key,
      valueListenable: HiveBoxesObject.of.apartmentDB.listenable,
      builder: builder,
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount delegate(
    BoxConstraints size,
  ) {
    int crossAxis = 1;
    if (size.maxWidth > 300) crossAxis = 2;
    if (size.maxWidth > 600) crossAxis = 3;
    if (size.maxWidth > 900) crossAxis = 4;

    //
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxis,
      crossAxisSpacing: SizeType.hexa.size,
      mainAxisSpacing: SizeType.hexa.size,
    );
  }
}
