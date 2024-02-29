import 'package:codeofland/enum/view/view.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:codeofwidget/widget/column/column_with_spacing.dart';
import 'package:codeofwidget/widget/row/row_with_spacing.dart';
import 'package:core/feauture/enum/text/form.dart';
import 'package:flutter/material.dart';
import 'package:siteyonetim/feauture/theme/theme.dart';
import 'package:siteyonetim/view/auth/register/child/register_form_child/register_form_mixin.dart';
import 'package:siteyonetim/widget/custom/custom_boxdecoration/custom_boxdecoration.dart';
import 'package:siteyonetim/widget/custom/form_field/text_form_field.dart';

class RegisterFormChild extends StatefulWidget with RegisterFormMixin {
  RegisterFormChild(
      {super.key,
      required this.constraints,
      required this.userValidation,
      required this.gotoLoginView});
  final BoxConstraints constraints;
  final Function() userValidation;
  final Function() gotoLoginView;
  @override
  State<RegisterFormChild> createState() => _RegisterFormChildState();
}

class _RegisterFormChildState extends State<RegisterFormChild> {
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
        // ----------------------
        child: ColumnWithSpacing(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppForm.yoneticikayitalani.text,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: widget.constraints.maxHeight / 50,
            ),
            //--------------------------------
            CustomTextFormField(
              controller: widget.userNameController,
              labelText: AppForm.usernameLabel.text,
            ),
            SizedBox(
              height: widget.constraints.maxHeight / 100,
            ),
            // --------------------------------
            CustomTextFormField(
              controller: widget.passwordController,
              labelText: AppForm.passwordLabel.text,
              obscureText: widget.showPass ? false : true,
            ),
            SizedBox(
              height: widget.constraints.maxHeight / 100,
            ),
            // --------------------------------
            CustomTextFormField(
              controller: widget.confirmPasswordController,
              labelText: AppForm.passwordLabel.text,
              obscureText: widget.showPass ? false : true,
            ),
            SizedBox(
              height: widget.constraints.maxHeight / 100,
            ),
            RowWithSpacing(
              children: [
                const Spacer(),
                Text(
                  AppForm.showPassword.text,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: widget.constraints.maxWidth > 800 ? 10 : 5),
                Switch(
                  value: widget.showPass,
                  onChanged: (value) => setState(() => widget.showPass = value),
                )
              ],
            ),
            // --------------------------------
            RowWithSpacing(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: widget.userValidation,
                  child: Text(
                    AppForm.signUpButton.text,
                  ),
                ),
                // --------------------------------------
                SizedBox(width: widget.constraints.maxWidth > 800 ? 10 : 5),
                // --------------------------------------
                ElevatedButton(
                  onPressed: widget.gotoLoginView,
                  child: Text(
                    AppForm.signInButton.text,
                  ),
                ),
              ],
            )
          ],
        ).padding(pad: ViewEnum.hexa.size.withPaddingAll),
      ),
    );
  }
}
