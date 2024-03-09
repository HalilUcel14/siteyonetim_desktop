import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

class ApartmentView extends StatefulWidget {
  const ApartmentView({super.key});

  @override
  State<ApartmentView> createState() => _ApartmentViewState();
}

class _ApartmentViewState extends State<ApartmentView> with ApartmentViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ScaffoldKeys.of.apartmentKey,
      appBar: ApartmentAppBar(apartment: apartment),
      body: ApartmentViewBody(apartment: apartment),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.customShowDialog(const FormViewDialog(child: DaireForm()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
