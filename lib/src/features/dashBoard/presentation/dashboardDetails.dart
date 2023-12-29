import 'package:flutter/material.dart';

class DashboardDetails extends StatelessWidget {
  final Map<String, dynamic> formData;

  const DashboardDetails({Key? key, required this.formData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('FormDefinitions Details'),
      ),
      body: Text(formData['formDefinition'].toString()),
    );
  }
}
