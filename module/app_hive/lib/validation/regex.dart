final RegExp phoneNumberRegExp = RegExp(r'^[1-9][0-9]{9}$');
final RegExp identityIndividualRegExp = RegExp(r'^[1-9]\d{10}$');
final RegExp identityCompanyRegExp = RegExp(r'^\d{10}|\d{11}$');

extension PhoneTextExtension on String {
  bool get isPhoneNumber => phoneNumberRegExp.hasMatch(this);
  bool get isIndividualIdentity => identityIndividualRegExp.hasMatch(this);
  bool get isCompanyIdentity => identityCompanyRegExp.hasMatch(this);
}
