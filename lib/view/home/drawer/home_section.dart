import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class HomeDrawerSection extends StatelessWidget {
  const HomeDrawerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = LanguageManager.of(context).lang;
    return ColumnWithSpacing(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const WBoldText('Ana Sayfa'),
        ),
        ElevatedButton(
          onPressed: () {
            lang.setEN;
          },
          child: WBoldText(lang.isTr ? 'İngilizce' : 'Türkçe'),
        ),
        ElevatedButton(
          onPressed: () {
            lang.setTR;
          },
          child: WBoldText(lang.isTr ? 'İngilizce' : 'Türkçe'),
        ),
      ],
    );
  }
}
