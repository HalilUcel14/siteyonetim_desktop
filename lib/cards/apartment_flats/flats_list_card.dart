import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:siteyonetim/index.dart';

class FlatsListCard extends StatelessWidget with FlatsListCardMixin {
  const FlatsListCard({super.key, required this.apartment});

  final TBLApartment apartment;

  @override
  Widget build(BuildContext context) {
    return daireListenable(
      builder: (context, box, child) {
        final list = box.getApartmentList(apartment.uid);
        if (list.isEmpty) return emptyFlats;
        return listView(list);
      },
    );
  }

  Widget get emptyFlats => WBoldText(
        text: '${apartment.name} için Daire Bulunamadı!',
      ).center();

  Widget listView(List<TBLFlats> list) {
    return ListView.builder(
      itemCount: apartment.floor ?? 0,
      padding: SizeType.ennea.size.withPaddingAll,
      itemBuilder: (context, index) {
        final floors = list.getApartmentFloorList(index + 1);
        //
        if (floors.isEmpty) return const SizedBox.shrink();
        //
        return FloorCards(
          floor: floors,
          floorNumber: index + 1,
        );
      },
    );
  }
}

mixin FlatsListCardMixin on StatelessWidget {
  ValueListenableBuilder<Box<TBLFlats>> daireListenable({
    required Widget Function(
      BuildContext context,
      Box<TBLFlats> box,
      Widget? child,
    ) builder,
    Key? key,
  }) {
    return ValueListenableBuilder<Box<TBLFlats>>(
      key: key,
      valueListenable: HiveBoxesObject.of.flatsDB.listenable,
      builder: builder,
    );
  }
}
