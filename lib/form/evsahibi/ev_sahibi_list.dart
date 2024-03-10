import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

class EvSahibiList extends StatelessWidget {
  const EvSahibiList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveBoxesObject.of.evSahibiDB.boxListenable,
      builder: (context, box, child) {
        List<TBLEvSahibi> list = box.values.toList();
        //
        return list.isEmpty ? buildEmptyList() : buildList(list, context);
        //
      },
    );
  }

  Center buildEmptyList() => const Center(child: Text('Ev Sahibi Yok'));

  Widget buildList(List<TBLEvSahibi> list, BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            FormTitle(title: TableText.listOwner.text),
            // ------------------------
            ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${list[index].customer?.name}'),
                  subtitle: Text('${list[index].customer?.email}'),
                );
              },
            ).expanded(),
          ],
        ).padding(pad: SizeEnum.hexa.size.withPaddingAll),
        // ------------------------
        // ------------------------
        Positioned(
          bottom: SizeEnum.hexa.size,
          right: SizeEnum.hexa.size,
          child: FloatingActionButton(
            onPressed: () => context.customShowDialog(
              const FormViewDialog(child: EvSahibiForm()),
            ),
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
