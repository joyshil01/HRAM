// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../../utils/imageString.dart';
import '../../../utils/sizes.dart';
import '../../../utils/text/textString.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('OR'),
        const SizedBox(height: sFormHeight - 20),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: Image.asset(sGoogleLogo, width: 20),
            label: const Text(sSigninGoogle),
          ),
        ),
        const SizedBox(height: sFormHeight - 20),
        TextButton(
          onPressed: () {},
          child: Text.rich(
            TextSpan(
              text: sAlreadyAccount,
              style: Theme.of(context).textTheme.titleMedium,
              children: const [
                TextSpan(
                  text: sSignUp,
                  style: TextStyle(
                    color: sSignupTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
