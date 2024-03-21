import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

final class HomeViewDrawer extends StatelessWidget with HomeDrawerMixin {
  const HomeViewDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ColumnWithSpacing(
        children: [
          CircleAvatar(
            backgroundColor: context.colorScheme.primary,
          ).aspectRatio(1).padding(pad: SizeType.ennea.size.withPaddingAll),
          //
          futureText(),
          //
          const Spacer(),
          //
          ElevatedButton(
            onPressed: logOutFunction,
            child: const Text('Logout'),
          ),
        ],
      ).padding(pad: SizeType.ennea.size.withPaddingAll),
    );
  }
}
