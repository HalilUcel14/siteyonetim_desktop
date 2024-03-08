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
    return LayoutBuilder(builder: (context, sizes) {
      return ValueListenableBuilder(
        valueListenable: HiveBoxesObject.of.apartmentDB.valueList,
        builder: (context, value, child) {
          //
          //
          final String? userUid = HiveBoxesObject.of.metaDB.meta?.user?.uid;
          //
          if (userUid == null) {
            return const Center(
              child: Text('User not found'),
            );
          }
          //
          List<TBLApartment> list = value.values.toList();
          List<TBLApartment> userList =
              list.where((apartment) => apartment.userUid == userUid).toList();
          //
          return ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {
              return const Text('data');
            },
          );

          // -----------------------------------
        },
      ).padding(pad: SizeEnum.hexa.size.withPaddingAll);
    });
  }
}
