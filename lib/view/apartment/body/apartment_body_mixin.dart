import 'package:app_hive/app_hive.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

mixin ApartmentBodyMixin on State<ApartmentViewBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String? get userUid => HiveBoxesObject.of.metaDB.meta?.user?.uid;

  Widget buildFlats(dynamic box) {
    //
    if (widget.apartment == null) {
      return const Center(
        child: Text('Apartman Bilgisi Bulunamadı.'),
      );
    }
    //
    if (userUid == null) {
      return const Center(
        child: Text('Kullanıcı Bulunamadı.'),
      );
    }
    //
    List<TBLApartment> list = box.values.toList();
    List<TBLApartment> userList =
        list.where((apartment) => apartment.userUid == userUid).toList();
    //
    print(userList);
    //
    return ListView.builder(
      itemCount: widget.apartment!.floorCount,
      itemBuilder: (context, index) {
        return floorCard(index);
      },
    );
  }

  Widget floorCard(int index) {
    return Card(
      child: ColumnWithSpacing(
        children: [
          Text('Kat : $index'),
          //
          flatsCard(index),
        ],
      ),
    );
  }

  Widget flatsCard(int index) {
    return Text('Daire : $index');
  }
}
