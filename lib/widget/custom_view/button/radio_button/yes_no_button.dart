import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class RadioYesNoButton extends StatelessWidget {
  const RadioYesNoButton({
    super.key,
    required this.notifier,
    required this.title,
  });

  final BoolNotifier notifier;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: (context, yesNo, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            RowWithSpacing(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: SizeType.hexa.size,
              children: [
                ...[
                  Radio.adaptive(
                    value: true,
                    groupValue: yesNo,
                    onChanged: (value) => notifier.change(),
                  ),
                  const Text('Evet'),
                ],
                ...[
                  Radio.adaptive(
                    value: false,
                    groupValue: yesNo,
                    onChanged: (value) => notifier.change(),
                  ),
                  const Text('Hayır'),
                ],
              ],
            ),
          ],
        );
      },
    );
  }
}
