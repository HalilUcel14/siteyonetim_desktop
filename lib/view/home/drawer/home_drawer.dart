import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';
import 'package:siteyonetim/view/home/drawer/home_section.dart';

import '../../../index.dart';

final class HomeViewDrawer extends StatelessWidget with HomeDrawerMixin {
  const HomeViewDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ColumnWithSpacing(
        children: [
          // -------------------
          CircleAvatar(
            backgroundColor: context.colorScheme.primary,
            child: personIcon(),
          )
              .aspectRatio(1)
              .padding(pad: SizeType.ennea.size.withPaddingHorizontal),
          // -------------------
          WBoldText(
            getUserName(),
            wStyle: WTextStyle.headlineSmall,
            wColor: WTextColor.onPrimary,
          ),
          // --------------------
          WBoldText(
            '${getPlan()}',
            wStyle: WTextStyle.headlineSmall,
            wColor: WTextColor.onPrimary,
          ),
          //
          Divider(
            color: context.colorScheme.primaryContainer,
            thickness: 4,
          ),
          //
          const HomeDrawerSection(),
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

  Widget personIcon() {
    return LayoutBuilder(builder: (context, sizes) {
      return Icon(
        Icons.person,
        color: context.colorScheme.onPrimaryContainer,
        size: sizes.maxWidth * WPercent.p3Quarter.size,
      );
    });
  }
}
