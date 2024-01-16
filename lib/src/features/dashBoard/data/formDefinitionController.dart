import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../../../utils/appUrl.dart';

class FormDataProvider with ChangeNotifier {
  List<Map<String, dynamic>> _formDataList = [];
  // List<Map<String, dynamic>> _jsonData = [];
  Map<String, dynamic> jsonData = {};

  List<Map<String, dynamic>> get formDataList => _formDataList;
  // List<Map<String, dynamic>> get jsonData => _jsonData;

  Future<void> fetchFormData() async {
    var response = await http.get(Uri.parse(baseUrl2nd));
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      if (responseData['data'] is List) {
        _formDataList = List<Map<String, dynamic>>.from(responseData['data']);
        // var msg = responseData['message'];
        print('formDefinition: $_formDataList');
        print(responseData['message']);
      } else {
        print(responseData['message']);
        // Handle error based on your requirements
      }
    } else {
      print('Error: ${response.body}');
      // Handle error based on your requirements
    }
    notifyListeners();
  }

  Future<void> loadJsonData() async {
    String jsonDataString =
        await rootBundle.loadString('assets/jsonData/form_definition.json');
    jsonData = json.decode(jsonDataString);

    // if (jsonDataString != null && jsonDataString.isNotEmpty) {
    //   var jsonData = json.decode(jsonDataString);

    //   if (jsonData != null && jsonData['data'] is List) {
    //     _jsonData = List<Map<String, dynamic>>.from(jsonData['data']);
    //     print(jsonData);
    //     notifyListeners();
    //   } else {
    //     print('Invalid JSON structure: $jsonData');
    //   }
    // } else {
    //   print('Failed to load JSON data');
    // }
    notifyListeners();
  }
}

// class JsonDataProvider extends ChangeNotifier {
//   Map<String, dynamic> jsonData = {};

//   Future<void> loadJsonData() async {
//     String jsonDataString =
//         await rootBundle.loadString('assets/json/welcome.json');
//     jsonData = json.decode(jsonDataString);
//     print(jsonData);
//     notifyListeners();
//   }
// }
