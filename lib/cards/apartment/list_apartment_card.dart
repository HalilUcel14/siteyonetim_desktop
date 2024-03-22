import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ApartmentListCard extends StatelessWidget with ApartmentListMixin {
  const ApartmentListCard({super.key});

  //TODO: Function yaz box<T> için list dönsün veya list(userid) ile user Apartment list dönsünl

  @override
  Widget build(BuildContext context) {
    return Card(
      child: apartmentListenable(
        builder: (context, box, child) {
          final list = box.getUserList(HiveBoxesObject.of.metaDB.userUid!);
          return LayoutBuilder(
            builder: (context, sizes) {
              //
              return GridView.builder(
                gridDelegate: delegate(sizes),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Container();
                },
              );
            },
          );
        },
      ),
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
    if (size.maxWidth < 400) crossAxis = 1;
    if (size.maxWidth < 800) crossAxis = 2;
    if (size.maxWidth < 1200) crossAxis = 3;
    if (size.maxWidth >= 1200) crossAxis = 4;
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxis,
      crossAxisSpacing: SizeType.hexa.size,
      mainAxisSpacing: SizeType.hexa.size,
    );
  }
}
