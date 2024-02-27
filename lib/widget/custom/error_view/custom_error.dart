import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final FlutterErrorDetails errorDetails;
  //
  const CustomErrorWidget({
    super.key,
    required this.errorDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ColumnWithSpacing(
        spacing: SizeEnum.hexa.size,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.red,
            size: SizeEnum.mega.size,
          ),
          const BoldText(
            'Error Occurred!',
            styles: TextStyles.titleLarge,
          ),
          BoldText(
            errorDetails.exceptionAsString(),
            textAlign: TextAlign.center,
            styles: TextStyles.bodyMedium,
          ),
        ],
      ),
    );
  }
}
