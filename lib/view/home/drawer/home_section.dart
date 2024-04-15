import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class HomeDrawerSection extends StatelessWidget {
  const HomeDrawerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final languageManager = LanguageNotifier.of(context);
    return ColumnWithSpacing(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const WBoldText(text: 'Ana Sayfa'),
        ),
        ElevatedButton(
          onPressed: () {
            languageManager.notifier!.change();
          },
          child: WBoldText(
              text: languageManager.notifier!.isTr ? 'İngilizce' : 'Türkçe'),
        ),
        ElevatedButton(
          onPressed: () {
            ThemeNotifier.of(context).notifier!.change();
          },
          child: WBoldText(
              text: ThemeNotifier.of(context).notifier!.isLight
                  ? 'Dark'
                  : 'Light'),
        ),
      ],
    );
  }
}
