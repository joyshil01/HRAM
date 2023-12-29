// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../utils/sizes.dart';
import 'loginFooterWidget.dart';
import 'loginFormWidget.dart';
import 'loginHeaderWidget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(sDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginHeader(size: size),
              const LoginForm(),
              const LoginFooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
