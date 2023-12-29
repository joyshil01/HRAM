// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../utils/imageString.dart';
import '../../../utils/textString.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(
          sWelcomeScreenImage,
          height: size.height * 0.3,
        ),
        Text(
          sLoginTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          sLoginSubTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
