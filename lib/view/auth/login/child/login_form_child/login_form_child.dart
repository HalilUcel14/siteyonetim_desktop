import 'package:codeofland/enum/view/view.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/feauture/enum/text/form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:siteyonetim/feauture/theme/theme.dart';
import 'package:siteyonetim/view/auth/login/child/login_form_child/login_form_mixin.dart';
import 'package:siteyonetim/widget/custom/custom_boxdecoration/custom_boxdecoration.dart';
import 'package:siteyonetim/widget/custom/form_field/text_form_field.dart';

final class LoginFormChild extends StatefulWidget with LoginFormMixin {
  LoginFormChild({
    super.key,
    required this.constraints,
    required this.userValidation,
    required this.gotoRegisterView,
  });
  final BoxConstraints constraints;
  final Function() userValidation;
  final Function() gotoRegisterView;
  @override
  State<LoginFormChild> createState() => _LoginFormChildState();
}

class _LoginFormChildState extends State<LoginFormChild> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.constraints.maxWidth / 2.5,
      height: widget.constraints.maxHeight / 1.5,
      decoration: MyBoxDecoration(
        color: AppStyle.grey,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
        boxShadow: const [
          BoxShadow(
              color: Colors.black45, offset: Offset(-5, 0), blurRadius: 5),
          BoxShadow(
              color: Colors.black45, offset: Offset(-5, 5), blurRadius: 5),
        ],
      ),
      child: SingleChildScrollView(
        child: ColumnWithSpacing(
          children: [
            Text(
              AppForm.yoneticigirisi.text,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: widget.constraints.maxHeight / 40,
            ),
            CustomTextFormField(
              controller: widget.userNameController,
              labelText: AppForm.usernameLabel.text,
            ),
            SizedBox(
              height: widget.constraints.maxHeight / 200,
            ),
            // -----------------------------
            CustomTextFormField(
              controller: widget.passwordController,
              labelText: AppForm.passwordLabel.text,
              obscureText: widget.showPass ? false : true,
            ),
            SizedBox(
              height: widget.constraints.maxHeight / 200,
            ),
            // -----------------------------
            RowWithSpacing(
              children: [
                const Spacer(),
                Text(
                  AppForm.showPassword.text,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: widget.constraints.maxWidth > 800 ? 10 : 5),
                Switch(
                    value: widget.showPass,
                    onChanged: (value) =>
                        setState(() => widget.showPass = value))
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: widget.constraints.maxWidth > 800 ? 25 : 10),
              child: RowWithSpacing(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: widget.userValidation,
                      child: Text(AppForm.signInButton.text),
                    ),
                  ),
                  SizedBox(width: widget.constraints.maxWidth > 800 ? 10 : 5),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: widget.gotoRegisterView,
                      child: Text(AppForm.joinUs.text),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).padding(pad: ViewEnum.hexa.size.withPaddingAll),
      ),
    );
  }
}
