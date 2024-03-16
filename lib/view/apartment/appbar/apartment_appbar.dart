import 'package:app_hive/app_hive.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

class ApartmentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ApartmentAppBar({super.key, required this.apartment});

  final TBLApartment? apartment;

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Text('${apartment?.name} Apartmanı'),
    );
  }

  @override
  Size get preferredSize => WAppBarSize.small.size;
}
