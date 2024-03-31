import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:siteyonetim/index.dart';

mixin DaireValidatorMixin on State<DaireForm> {
  CustomFormDecoration floorDecoration() {
    return CustomFormDecoration(
      context,
      labelText: FormText.daireFloor.text,
    );
  }

  String? floorValidator(String? value) {
    if (value.isNullOrEmpty) return FormError.emptyField.text;
    //
    if (!value.intTryParse) return FormError.integerField.text;
    //
    if (!value.positiveIntParse) return FormError.positiveInteger.text;
    //
    if (widget.apartment.isNullable) return FormError.apartmentEmpty.text;
    if (widget.apartment.floorCount! < int.parse(value!)) {
      return FormError.floorCount.text;
    }
    return null;
  }

  CustomFormDecoration flatsDecoration() {
    return CustomFormDecoration(
      context,
      labelText: FormText.daireNumber.text,
    );
  }

  String? flatsValidator(String? value) {
    if (value.isNullOrEmpty) return FormError.emptyField.text;
    //
    if (!value.intTryParse) return FormError.integerField.text;
    //
    if (!value.positiveIntParse) return FormError.positiveInteger.text;
    //
    if (widget.apartment.isNullable) return FormError.apartmentEmpty.text;
    if (widget.apartment.flatsCount! < int.parse(value!)) {
      return FormError.flatsCount.text;
    }
    return null;
  }

  CustomFormDecoration squareMDecoration() {
    return CustomFormDecoration(
      context,
      labelText: FormText.daireSquare.text,
    );
  }

  CustomFormDecoration netSquareMDecoration() {
    return CustomFormDecoration(
      context,
      labelText: FormText.daireNetSquare.text,
    );
  }

  String? integerValidator(String? value) {
    if (value.isNullOrEmpty) return null;
    //
    if (!value.intTryParse) return FormError.integerField.text;
    //
    if (!value.positiveIntParse) return FormError.positiveInteger.text;
    return null;
  }

  CustomFormDecoration ownerDecoration(TextEditingController controller) {
    return CustomFormDecoration(
      context,
      labelText: FormText.daireOwner.text,
      suffixIcon: IconButton(
        onPressed: () => submitOwnerFlats(controller),
        icon: const Icon(Icons.view_list_rounded),
      ),
    );
  }

  void submitOwnerFlats(TextEditingController controller) async {
    //
    final response = await context.customShowDialog<TBLEvSahibi>(
      dialog: CustomDialog(
        child: const FormViewDialog(
          child: EvSahibiList(),
        ),
      ),
    );
    //
    if (response == null) return;
    //
    if (response.customer == null) return;
    //
    controller.text = response.customer!.name ?? '';
    //
    return;
  }

  String? ownerValidator(String? value) {
    if (value.isNullOrEmpty) return FormError.emptyField.text;
    return null;
  }

  CustomFormDecoration tenantDecoration(TextEditingController controller) {
    return CustomFormDecoration(
      context,
      labelText: FormText.daireTenant.text,
      suffixIcon: IconButton(
        onPressed: () => submitTenantFlats(controller),
        icon: const Icon(Icons.view_list_rounded),
      ),
    );
  }

  void submitTenantFlats(TextEditingController controller) async {
    //
    final response = await context.customShowDialog<TBLKiraci>(
      dialog: CustomDialog(
        child: const FormViewDialog(
          child: KiraciList(),
        ),
      ),
    );
    //
    if (response == null) return;
    //
    if (response.customer == null) return;
    //
    controller.text = response.customer!.name ?? '';
    return;
  }

  String? tenantValidator(String? value) {
    if (value.isNullOrEmpty) return FormError.emptyField.text;
    return null;
  }
}
