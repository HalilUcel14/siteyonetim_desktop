import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:siteyonetim/feauture/theme/theme.dart';
import 'package:siteyonetim/widget/custom/custom_boxdecoration/custom_boxdecoration.dart';

class LoginSvgView extends StatelessWidget {
  const LoginSvgView({
    super.key,
    required this.constraints,
  });
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: constraints.maxWidth / 2.5,
      height: constraints.maxHeight / 1.5,
      decoration: MyBoxDecoration(
        color: AppStyle.darkBlue,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        boxShadow: const [
          BoxShadow(
              color: Colors.black45, offset: Offset(-5, 5), blurRadius: 5),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(constraints.maxWidth / 50),
        child: SvgPicture.asset(
          'assets/logo/login.svg',
        ),
      ),
    );
  }
}
