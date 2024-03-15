import 'package:flutter/material.dart';
import 'package:hrm/src/utils/colors.dart';

class SelectedFiltter extends StatelessWidget {
  const SelectedFiltter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarBg,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 22,
              ),
            ),
            const Text('AppBar'),
          ],
        ),
      ),
    );
  }
}
