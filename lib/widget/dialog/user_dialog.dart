import '../../index.dart';

class CustomUserDialog extends DetailDialogs {
  const CustomUserDialog.info({
    super.key,
    required String text,
  }) : super(type: DialogType.info, title: text);

  const CustomUserDialog.warning({
    super.key,
    required String text,
  }) : super(type: DialogType.warning, title: text);

  const CustomUserDialog.error({
    super.key,
    required String text,
  }) : super(type: DialogType.error, title: text);

  const CustomUserDialog.success({
    super.key,
    required String text,
  }) : super(type: DialogType.success, title: text);
}
