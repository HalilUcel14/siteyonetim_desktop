import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => WAppBarSize.small.size;
}

class _HomeAppBarState extends State<HomeAppBar> with HomeAppBarMixin {
  @override
  AppBar build(BuildContext context) {
    return AppBar(
      toolbarHeight: toolbarHeight,
      leadingWidth: leadingWidth,
      leading: LayoutBuilder(
        builder: (context, size) {
          return IconButton(
            onPressed: () => iconPressed,
            icon: Icon(
              Icons.menu_open_rounded,
              size: iconSize(size),
            ),
          );
        },
      ),
      title: WBoldText(
        text: lang.notifier!.isTr ? 'Ana Sayfa' : 'Home Page',
        wStyle: WTextStyle.headlineLarge,
        wColor: WColor.onPrimary,
      ),
    );
  }
}
