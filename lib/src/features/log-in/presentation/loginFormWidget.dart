// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../utils/sizes.dart';
import '../../../utils/textString.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: sFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person_outline_outlined),
                labelText: sEmail,
                hintText: sHintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: sFormHeight),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.fingerprint),
                labelText: sPassword,
                hintText: sPassword,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: const Icon(Icons.remove_red_eye_sharp),
              ),
            ),
            const SizedBox(height: sFormHeight - 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // ForgetPassworScreen.forgetPasswordBottomSheet(context);
                },
                child: const Text(sForgetPassword),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(sLogin.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
