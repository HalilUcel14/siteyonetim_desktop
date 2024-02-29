import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

import '../../../../index.dart';

class HomeViewDrawer extends StatelessWidget with HomeDrawerMixin {
  const HomeViewDrawer({super.key});

  @override
  Drawer build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: logOutFunction,
            child: const Text('Logout'),
          ),
        ],
      ).withSizedBox(height: double.infinity, width: 300),
    );
  }
}
