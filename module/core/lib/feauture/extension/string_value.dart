extension StringValidatorExtension on String? {
  bool get intTryParse {
    if (this == null || this!.isEmpty) return false;
    if (int.tryParse(this!) == null) return false;
    return true;
  }

  bool get positiveIntParse {
    if (!intTryParse) return false;
    if (int.parse(this!) <= 0) return false;
    return true;
  }
}
