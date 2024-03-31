import 'package:app_hive/app_hive.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

class ApartmentViewBody extends StatefulWidget {
  const ApartmentViewBody({super.key, required this.apartment});

  final TBLApartment apartment;

  @override
  State<ApartmentViewBody> createState() => _ApartmentViewBodyState();
}

class _ApartmentViewBodyState extends State<ApartmentViewBody>
    with ApartmentBodyMixin {
  @override
  Widget build(BuildContext context) {
    //
    return FlatsListCard(apartment: widget.apartment);
  }
}

// YODO:S