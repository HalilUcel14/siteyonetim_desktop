import 'package:flutter/material.dart';

import '../../../../index.dart';

class HomeBodyLeftChild extends StatefulWidget {
  const HomeBodyLeftChild({super.key});

  @override
  State<HomeBodyLeftChild> createState() => _HomeBodyLeftChildState();
}

// TODO: implement mixin
class _HomeBodyLeftChildState extends State<HomeBodyLeftChild>
    with HomeBodyLeftChildMixin {
  @override
  Widget build(BuildContext context) {
    return ApartmentView();
  }
}

    // return LayoutBuilder(
    //   builder: (context, sizes) {
    //     return ValueListenableBuilder(
    //       valueListenable: HiveBoxesObject.of.apartmentDB.valueList,
    //       builder: (context, value, child) {
    //         if (!value.isOpen) HiveBoxesObject.of.apartmentDB.openBox();
    //         //
    //         final list = value.values.toList();
    //         // -----------------------------------
    //         return GridView.builder(
    //           gridDelegate: delegate(sizes),
    //           itemCount: list.length,
    //           itemBuilder: (context, index) {
    //             return ApartmentCard(apartment: list[index]);
    //           },
    //         );
    //       },
    //     ).padding(pad: SizeEnum.hexa.size.withPaddingAll);
    //   },
    // );