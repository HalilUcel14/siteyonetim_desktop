import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
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
        return Stack(
          children: [
            // --------------------------------
            list.isEmpty ? buildEmptyList() : buildList(list, context),
            // --------------------------------
            Positioned(
              bottom: SizeType.hexa.size,
              right: SizeType.hexa.size,
              child: FloatingActionButton(
                onPressed: () => context.customShowDialog(
                  dialog: CustomDialog(
                    child: const FormViewDialog(
                      child: EvSahibiForm(),
                    ),
                  ),
                ),
                child: const Icon(Icons.add),
              ),
            ),
            // --------------------------------
          ],
        );

        //
      },
    );
  }

  Center buildEmptyList() => const Center(child: Text('Ev Sahibi Yok'));

  Widget buildList(List<TBLEvSahibi> list, BuildContext context) {
    return Column(
      children: [
        // ------------------------
        FormTitle(title: FormText.listOwner.text),
        // ------------------------
        ListView.separated(
          itemCount: list.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            // ------------------------
            return Card(
              child: ListTile(
                title: Text('${list[index].customer?.name}'),
                subtitle: Text('${list[index].customer?.email}'),
                leading: const Icon(Icons.person),
                onTap: () => context.pop<TBLEvSahibi>(result: list[index]),
              ),
            );
          },
        ).expanded(),
        // ------------------------
      ],
    ).padding(pad: SizeType.hexa.size.withPaddingAll);
  }
}
