import 'package:flutter/material.dart';
import 'package:siteyonetim/feauture/index.dart';
import 'package:siteyonetim/view/auth/windows_view/windows_view.dart';

import '../index.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AppStyle.lightBlue, AppStyle.darkBlue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Stack(
          children: [
            windowsView(),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
