import 'package:codeofland/enum/view/view.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/feauture/enum/text/form.dart';
import 'package:flutter/material.dart';
import 'package:siteyonetim/view/auth/register/child/register_decoration/register_svg_view.dart';
import 'package:siteyonetim/view/auth/register/child/register_form_child/register_form_child.dart';
import 'package:siteyonetim/widget/custom/custom_boxdecoration/custom_boxdecoration.dart';

import '../../../../index.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> with RegisterViewMixin {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        return Center(
          child: RowWithSpacing(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RegisterSvgView(
                constraints: constraints,
              ),
              RegisterFormChild(
                constraints: constraints,
                userValidation: userValidation,
                gotoLoginView: gotoLoginView,
              ),
            ],
          ).padding(pad: ViewEnum.hexa.size.withPaddingAll),
        );
      } else {
        return Container();
      }
    });
  }
}


/*SingleChildScrollView(
      // ----------------------
      child: ColumnWithSpacing(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            controller: userNameController,
            labelText: AppForm.usernameLabel.text,
          ),
          // --------------------------------
          CustomTextFormField(
            controller: passwordController,
            labelText: AppForm.passwordLabel.text,
          ),
          // --------------------------------
          CustomTextFormField(
            controller: confirmPasswordController,
            labelText: AppForm.passwordLabel.text,
          ),
          // --------------------------------
          RowWithSpacing(
            children: [
              ElevatedButton(
                onPressed: userValidation,
                child: Text(
                  AppForm.signUpButton.text,
                ),
              ),
              // --------------------------------------
              ElevatedButton(
                onPressed: gotoLoginView,
                child: Text(
                  AppForm.signInButton.text,
                ),
              ),
            ],
          )
        ],
      ),
    ); */