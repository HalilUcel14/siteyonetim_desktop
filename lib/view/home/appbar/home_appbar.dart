import 'package:flutter/material.dart';

import '../../../index.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => AppBarSize.small.size;
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
            icon: Icon(Icons.menu_open_rounded, size: iconSize(size)),
          );
        },
      ),
      title: const CBoldText(
        'Ana Sayfa',
        styles: StyleType.labelMedium,
        type: TextType.secondary,
      ),
    );
  }
}
