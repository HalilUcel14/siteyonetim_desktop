import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

final class HomeViewDrawer extends StatelessWidget with HomeDrawerMixin {
  const HomeViewDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ColumnWithSpacing(
            children: [
              CircleAvatar(
                radius: constraints.maxWidth * WPercent.pQuarter.size,
                backgroundColor: context.colorScheme.primary,
              ),
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
          ).padding(pad: SizeEnum.ennea.size.withPaddingAll);
        },
      ),
    );
  }
}
