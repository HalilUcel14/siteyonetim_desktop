import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

class ApartmentViewBody extends StatefulWidget {
  const ApartmentViewBody({super.key, this.apartment});

  final TBLApartment? apartment;

  @override
  State<ApartmentViewBody> createState() => _ApartmentViewBodyState();
}

class _ApartmentViewBodyState extends State<ApartmentViewBody> {
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return LayoutBuilder(builder: (context, sizes) {
      return ValueListenableBuilder(
        valueListenable: HiveBoxesObject.of.daireDB.boxListenable,
        builder: (context, value, child) {
          // -----------------------------------
          if (widget.apartment == null || widget.apartment?.uid == null) {
            return const Center(
              child: Text('Apartment not found'),
            );
          }
          // -----------------------------------
          final List<TBLDaire> daireList = value.values.toList();
          // -----------------------------------
          final List<TBLDaire> userDaireList = daireList
              .where((flats) => flats.apartmentUid == widget.apartment!.uid)
              .toList();
          // -----------------------------------
          return ListView.builder(
            controller: scrollController,
            itemCount: widget.apartment!.floorCount ?? 0,
            itemBuilder: (context, index) {
              // -----------------------------------
              final floorList = userDaireList
                  .where((flats) => flats.floor == index + 1)
                  .toList();
              print(floorList);
              // -----------------------------------
              return Card(
                child: ListTile(
                  title: Text('Floor: ${index + 1}'),
                  subtitle: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: floorList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Daire: ${floorList[index].flats}'),
                        subtitle: Text('Floor: ${floorList[index].floor}'),
                      );
                    },
                  ),
                ),
              ).withSizedBox(height: 250, width: double.infinity);
            },
          );
        },
      ).padding(pad: SizeEnum.hexa.size.withPaddingAll);
    });
  }
}
