import 'package:app_hive/app_hive.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

mixin DaireFormMixin on State<DaireForm> {
  late TextEditingController floor;
  late TextEditingController flats;
  late TextEditingController squareM;
  late TextEditingController netSquareM;
  late TextEditingController room;
  late TextEditingController owner;
  late TextEditingController tenant;
  late BoolNotifier isOwner;
  late BoolNotifier isTenant;

  @override
  void initState() {
    FormKeys.of.daireFormKey = GlobalKey<FormState>();
    floor = TextEditingController();
    flats = TextEditingController();
    squareM = TextEditingController();
    netSquareM = TextEditingController();
    room = TextEditingController();
    owner = TextEditingController();
    tenant = TextEditingController();
    isOwner = BoolNotifier(false);
    isTenant = BoolNotifier(false);
    super.initState();
  }

  @override
  void dispose() {
    floor.dispose();
    flats.dispose();
    squareM.dispose();
    netSquareM.dispose();
    room.dispose();
    owner.dispose();
    tenant.dispose();
    isOwner.dispose();
    isTenant.dispose();
    FormKeys.of.daireFormKey.currentState?.dispose();
    super.dispose();
  }

  void submitOwnerFlats() {
    final listOwner = HiveBoxesObject.of.evSahibiDB.listBox();
    //
    final List<Widget> listView = listOwner
        .map((owner) => ListTile(
              title: Text('${owner.customer?.name}'),
              subtitle: Text('${owner.customer?.email}'),
            ))
        .toList();
    //

    //
    context.customShowDialog(
      FormViewDialog(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: listView,
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Kapat'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
