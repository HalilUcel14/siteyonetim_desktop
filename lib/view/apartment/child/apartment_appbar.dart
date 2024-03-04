import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
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
  Size get preferredSize => Size.fromHeight(SizeEnum.ennea.size * 3);
}
