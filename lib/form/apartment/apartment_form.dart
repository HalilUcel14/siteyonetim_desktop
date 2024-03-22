import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:siteyonetim/index.dart';

class ApartmentForm extends StatefulWidget {
  const ApartmentForm({super.key});

  @override
  State<ApartmentForm> createState() => _ApartmentFormState();
}

class _ApartmentFormState extends State<ApartmentForm>
    with ApartmentFormMixin, ApartmentValidatorMixin {
  @override
  Widget build(BuildContext context) {
    return CustomFormView(
      formKey: FormKeys.of.apartmentFormKey,
      children: [
        // ---------------------------------
        FormTitle(title: FormText.createApartman.text),
        // --------------------------------
        CustomTextFormField(
          controller: name,
          decoration: nameDecoration(),
          forceField: true,
          minimumValueLenght: FormSettings.fieldLength.value.toInt(),
          validator: (value) => nameValidator(value),
        ),
        // --------------------------------
        CustomTextFormField(
          controller: address,
          validator: (value) => addressValidator(value),
          decoration: addressDecoration(),
        ),

        // --------------------------------
        CustomTextFormField(
          controller: floorCount,
          decoration: floorCountDecoration(),
          forceField: true,
          validator: (value) => floorCountValidator(value ?? ''),
        ),
        // --------------------------------
        CustomTextFormField(
          controller: flatsCount,
          decoration: flatsCountDecoration(),
          forceField: true,
          validator: (value) => flatsCountValidator(value ?? ''),
        ),
        // --------------------------------
        RadioYesNoButton(
          notifier: isElevator,
          title: FormText.isHaveElevator.text,
        ),
        // --------------------------------
        CustomTextFormField(
          controller: buildYear,
          decoration: buildYearDecoration(buildYearIcon()),
          forceField: true,
          validator: (value) => buildYearValidator(value ?? ''),
        ),
        // --------------------------------
        ElevatedButton(
          onPressed: () async => await formValidation(),
          child: Text(ButtonText.save.text),
        ),
      ],
    );
  }
}
