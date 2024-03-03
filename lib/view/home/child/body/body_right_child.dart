import 'package:app_hive/app_hive.dart';
import 'package:flutter/material.dart';

class HomeBodyRightChild extends StatelessWidget {
  const HomeBodyRightChild({
    super.key,
    required this.apartmanList,
  });

  final Future<List<TBLApartment>> apartmanList;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
