import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

class UserApartmanList extends StatelessWidget {
  const UserApartmanList({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, sizes) {
        return ValueListenableBuilder(
          valueListenable: HiveBoxesObject.of.apartmentDB.valueList,
          builder: (context, value, child) {
            final String? userUid = HiveBoxesObject.of.metaDB.meta?.user?.uid;
            // -----------------------------------
            if (userUid == null) {
              return const Center(child: Text('User not found'));
            }
            // -----------------------------------
            final list = value.values.toList();
            List<TBLApartment> userApartman =
                list.where((apartmen) => apartmen.userUid == userUid).toList();
            // -----------------------------------
            return GridView.builder(
              gridDelegate: delegate(sizes),
              itemCount: userApartman.length,
              itemBuilder: (context, index) {
                return ApartmentCard(apartment: userApartman[index]);
              },
            );
          },
        );
      },
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount delegate(
    BoxConstraints constraints,
  ) =>
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: constraints.maxWidth > 1200
            ? 4
            : constraints.maxWidth > 800
                ? 3
                : constraints.maxWidth > 400
                    ? 2
                    : 1,
        crossAxisSpacing: SizeEnum.hexa.size,
        mainAxisSpacing: SizeEnum.hexa.size,
      );
}
