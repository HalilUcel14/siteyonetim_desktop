import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';

final class FormValidation {
  static FormValidation? _of;
  static FormValidation get of => _of ??= FormValidation._();
  FormValidation._();
  //
  final minLength = 6;

  bool isNullable(String? text) => text.isNullOrEmpty;

  //
  String? text(String? text, String? label) {
    if (isNullable(text)) return '$label boş olamaz';
    if (text!.length < minLength) {
      return '$label en az $minLength karakter olmalıdır.';
    }
    return null;
  }

  String? textNullable(String? text, String? label) {
    if (isNullable(text)) return null;
    if (text!.length < minLength) {
      return '$label en az $minLength karakter olmalıdır.';
    }
    return null;
  }

  String? intText(String? text, String? label) {
    if (isNullable(text)) return '$label boş olamaz';
    if (int.tryParse(text!) == null) return '$label tamsayı olmalıdır.';
    if (int.parse(text) < 0) return '$label 0 dan büyük olmalıdır.';
    return null;
  }

  String? intNullableText(String? text, String? label) {
    if (isNullable(text)) return null;
    if (int.tryParse(text!) == null) return '$label tamsayı olmalıdır.';
    if (int.parse(text) < 0) return '$label 0 dan büyük olmalıdır.';
    return null;
  }

  String? doubleText(String? text, String? label) {
    if (isNullable(text)) return '$label boş olamaz';
    if (double.tryParse(text!) == null) return '$label ondalık olmalıdır.';
    if (double.parse(text) < 0) return '$label 0 dan büyük olmalıdır.';
    return null;
  }

  String? doubleNullableText(String? text, String? label) {
    if (isNullable(text)) return null;
    if (double.tryParse(text!) == null) return '$label ondalık olmalıdır.';
    if (double.parse(text) < 0) return '$label 0 dan büyük olmalıdır.';
    return null;
  }

  String? dateText(String? text, String? label) {
    if (isNullable(text)) return '$label boş olamaz';
    //
    DateTime? time = DateTime.tryParse(text!);
    //
    if (time == null) return '$label tarih olmalıdır.';
    //
    if (!time.isBefore(DateTime.now())) {
      return '$label Şuandan önce olmalıdır.';
    }
    //
    if (!time.isAfter(DateTime(1950))) {
      return '$label 1950 yılından sonra olmalıdır.';
    }
    return null;
  }

  String? dateNullableText(String? text, String? label) {
    if (isNullable(text)) return null;
    //
    DateTime? time = DateTime.tryParse(text!);
    //
    if (time == null) return '$label tarih olmalıdır.';
    //
    if (!time.isBefore(DateTime.now())) {
      return '$label Şuandan önce olmalıdır.';
    }
    //
    if (!time.isAfter(DateTime(1950))) {
      return '$label 1950 yılından sonra olmalıdır.';
    }
    return null;
  }

  String? passwordText(String? text, String? label) {
    if (isNullable(text)) return '$label boş olamaz';
    if (!text!.isValidMediumPassword) {
      return '$label şifre deseni (en az 8 karakter, en az bir rakam ve bir harf)';
    }
    return null;
  }

  String? emailText(String? text, String? label) {
    if (isNullable(text)) return '$label boş olamaz';
    if (!text!.isValidEmailRegex) {
      return '$label geçerli bir email adresi olmalıdır.';
    }
    return null;
  }

  String? emailNullableText(String? text, String? label) {
    if (isNullable(text)) return null;
    if (!text!.isValidEmailRegex) {
      return '$label geçerli bir email adresi olmalıdır.';
    }
    return null;
  }

  String? phoneText(String? text, String? label) {
    if (isNullable(text)) return '$label boş olamaz';
    if (!text!.isPhoneNumber) {
      return '$label geçerli bir telefon numarası olmalıdır.';
    }
    return null;
  }

  String? phoneNullableText(String? text, String? label) {
    if (isNullable(text)) return null;
    if (!text!.isPhoneNumber) {
      return '$label geçerli bir telefon numarası olmalıdır.';
    }
    return null;
  }
}
