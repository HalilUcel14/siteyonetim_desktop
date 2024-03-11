import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

class ApartmentViewBody extends StatefulWidget {
  const ApartmentViewBody({super.key, this.apartment});

  final TBLApartment? apartment;

  @override
  State<ApartmentViewBody> createState() => _ApartmentViewBodyState();
}

class _ApartmentViewBodyState extends State<ApartmentViewBody>
    with ApartmentBodyMixin {
  @override
  Widget build(BuildContext context) {
    //
    return ValueListenableBuilder(
      valueListenable: HiveBoxesObject.of.daireDB.boxListenable,
      builder: (context, box, child) {
        // -----------------------------------
        haveAnyApartment();
        // -----------------------------------
        final List<TBLDaire> userDaireList = getApartmentFlats(
          box.values.toList(),
        );
        // -----------------------------------
        haveAnyFlats(userDaireList);
        // -----------------------------------
        return ListView.separated(
          controller: floorController,
          itemCount: widget.apartment!.floorCount!,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            // -----------------------------------
            final List<List<TBLDaire>> flatsOnFloor =
                getFlatsOnFloor(userDaireList);
            // -----------------------------------
            return ApartmentFloorCard(
                floor: index,
                child: ApartmentFlatsCard(
                  list: flatsOnFloor[index],
                ));
            // -----------------------------------
          },
        );
        // -----------------------------------
      },
    ).padding(pad: SizeEnum.hexa.size.withPaddingAll);
  }
}
