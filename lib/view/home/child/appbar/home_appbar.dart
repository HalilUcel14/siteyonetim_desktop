import 'package:codeofland/codeofland.dart';
import 'package:flutter/material.dart';

import '../../../../index.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => ScaffoldKeys.of.homeKey.openDrawerSafety,
        icon: const Icon(Icons.menu_open_rounded),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(SizeEnum.ennea.size * 3);
}
