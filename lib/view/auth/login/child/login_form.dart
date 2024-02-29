import 'package:codeofland/enum/view/view.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/feauture/enum/text/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:siteyonetim/view/auth/login/child/login_form_child/login_form_child.dart';
import 'package:siteyonetim/view/auth/login/child/login_decoration/login_form_svg_view.dart';
import 'package:siteyonetim/widget/custom/custom_boxdecoration/custom_boxdecoration.dart';
import '../../../../index.dart';

class LoginForm extends StatefulWidget {
  LoginForm({
    super.key,
  });
  bool showPass = false;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with LoginViewMixin {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        bool showPass;
        if (constraints.maxWidth > 600) {
          return Center(
            child: RowWithSpacing(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginSvgView(
                  constraints: constraints,
                ),
                LoginFormChild(
                  constraints: constraints,
                  userValidation: userValidation,
                  gotoRegisterView: gotoRegisterView,
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
