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
      appBar: ApartmentAppBar(apartment: apartment),
      body: const Center(
        child: Text('Apartment'),
      ),
    );
  }
}
