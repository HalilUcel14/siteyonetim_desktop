import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class HomeDrawerSection extends StatelessWidget {
  const HomeDrawerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final languageManager = LanguageNotifier.of(context);
    return ColumnWithSpacing(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const WBoldText('Ana Sayfa'),
        ),
        ElevatedButton(
          onPressed: () {
            languageManager.notifier!.change();
          },
          child: WBoldText(
              languageManager.notifier!.isTr ? 'İngilizce' : 'Türkçe'),
        ),
        ElevatedButton(
          onPressed: () {
            ThemeNotifier.of(context).notifier!.change();
          },
          child: WBoldText(
              ThemeNotifier.of(context).notifier!.isLight ? 'Dark' : 'Light'),
        ),
      ],
    );
  }
}
