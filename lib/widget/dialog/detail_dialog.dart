import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

enum DialogType { success, error, warning, info }

class DetailDialogs extends StatefulWidget {
  const DetailDialogs({
    super.key,
    required this.title,
    required this.type,
  });

  final String title;
  final DialogType type;

  @override
  State<DetailDialogs> createState() => _DetailDialogsState();
}

class _DetailDialogsState extends State<DetailDialogs> with DetailDialogMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: boxConstraints,
      decoration: decoration,
      // --------------------------------
      child: ColumnWithSpacing(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // --------------------------------
          CircleAvatar(
            radius: SizeEnum.penta.size,
            backgroundColor: iconColor,
            child: Icon(
              icon,
              size: SizeEnum.mega.size,
              color: iconDataColor,
            ),
          ),
          // --------------------------------
          Card(
            child: WBoldText(
              widget.title,
              wStyle: WTextStyle.bodyLarge,
              wColor: WTextColor.onPrimary,
              style: const TextStyle(),
            ).padding(pad: 8.withPaddingAll),
          ),
          // --------------------------------
          ElevatedButton(
            onPressed: () => context.pop(),
            child: const WBoldText('Kapat'),
          ),
        ],
      ),
    );
  }
}
