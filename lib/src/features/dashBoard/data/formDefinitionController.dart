import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../utils/appUrl.dart';

class FormDataProvider with ChangeNotifier {
  List<Map<String, dynamic>> _formDataList = [];

  List<Map<String, dynamic>> get formDataList => _formDataList;

  Future<void> fetchFormData() async {
    var response = await http.get(Uri.parse(formDefinitions));
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      if (responseData['data'] is List) {
        _formDataList = List<Map<String, dynamic>>.from(responseData['data']);
        print('formDefinition: $_formDataList');
      } else {
        print('Error: Invalid data format');
        // Handle error based on your requirements
      }
    } else {
      print('Error: ${response.body}');
      // Handle error based on your requirements
    }
    notifyListeners();
  }
}
