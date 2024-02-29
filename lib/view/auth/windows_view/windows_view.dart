import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:siteyonetim/feauture/index.dart';

final buttonColor = WindowButtonColors(iconNormal: AppStyle.grey);
final closeButtonColors = WindowButtonColors(
  mouseOver: Colors.red,
  mouseDown: Colors.red,
  iconNormal: AppStyle.grey,
);

WindowTitleBarBox windowsView() {
  return WindowTitleBarBox(
    child: Stack(
      children: [
        MoveWindow(),
        Row(
          children: [
            SizedBox(
              width: 25,
            ),
            Text(
              'Site Yönetim',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            MinimizeWindowButton(
              colors: buttonColor,
            ),
            appWindow.isMaximized
                ? RestoreWindowButton(
                    colors: buttonColor,
                  )
                : MaximizeWindowButton(
                    colors: buttonColor,
                  ),
            CloseWindowButton(
              colors: closeButtonColors,
            )
          ],
        )
      ],
    ),
  );
}
