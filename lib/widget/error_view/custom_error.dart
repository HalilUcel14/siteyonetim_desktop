import 'package:codeofland/codeofland.dart';
import 'package:flutter/material.dart';

class CustomErrorView extends StatelessWidget {
  const CustomErrorView({super.key, required this.details});

  final FlutterErrorDetails details;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.green.shade600,
          child: Builder(builder: (context) {
            return Column(
              children: [
                Center(
                  child: Text(details.exception.toString()),
                ),
                ElevatedButton(
                  onPressed: () => context.pop(),
                  child: const Text('Geri Dön'),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
