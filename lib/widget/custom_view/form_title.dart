import 'package:flutter/material.dart';

class FormTitle extends StatelessWidget {
  const FormTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // --------------------------------
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        // --------------------------------
        const Divider(),
        // --------------------------------
      ],
    );
  }
}
