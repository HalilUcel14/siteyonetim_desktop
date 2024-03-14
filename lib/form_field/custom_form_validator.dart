import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';

class FormValidator {
  static FormValidator? _of;
  static FormValidator get of => _of ??= FormValidator._init();
  FormValidator._init();

  String? emailValidator(String? value) {
    if (value.isNullOrEmpty) return FormError.emptyEmail.text;
    //
    if (!value!.isValidEmailRegex) return FormError.notValidEmail.text;
    //
    return null;
  }

  String? passwordValidator(String? value) {
    if (value.isNullOrEmpty) return FormError.emptyPassword.text;
    //
    if (value!.length < 8) return FormError.shortPassword.text;
    //
    if (!value.isValidMediumPassword) return FormError.notValidPassword.text;
    //
    return null;
  }
}
