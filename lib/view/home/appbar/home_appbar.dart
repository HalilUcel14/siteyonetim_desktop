import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      toolbarHeight: double.infinity,
      leadingWidth: SizeEnum.penta.size * 2,
      leading: IconButton(
        onPressed: () => ScaffoldKeys.of.homeKey.openDrawerSafety,
        icon: LayoutBuilder(builder: (context, constraints) {
          return Icon(
            Icons.menu_open_rounded,
            size: constraints.maxHeight * PercentEnum.pSixty.size,
          );
        }),
      ),
    );
  }

  @override
  Size get preferredSize => AppBarSize.small.size;

  //
}
