// ignore_for_file: file_names, unnecessary_null_comparison, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../widgets/customSnakWidget.dart';
import '../data/formDefinitionController.dart';

class FormDefinitionDetails extends StatefulWidget {
  @override
  State<FormDefinitionDetails> createState() => _FormDefinitionDetailsState();
}

class _FormDefinitionDetailsState extends State<FormDefinitionDetails> {
  bool isLoading = true;
  Map<String, TextEditingController> textEditingControllers = {};
  Map<String, GlobalKey<ShakeWidgetState>> textFieldErrorShakeKeys = {};
  Map<String, bool> isTextFieldErrorMap = {};

  @override
  void initState() {
    super.initState();
    Provider.of<FormDataProvider>(context, listen: false)
        .loadJsonData()
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final jsonDataNotifier = Provider.of<FormDataProvider>(context).jsonData;
    print('formmdataaaaaa: $jsonDataNotifier');

    if (jsonDataNotifier == null || jsonDataNotifier['formSteps'] == null) {
      return const CircularProgressIndicator();
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(jsonDataNotifier['formDescription'].toString()),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: jsonDataNotifier['formSteps'].length,
        itemBuilder: (context, stepIndex) {
          var step = jsonDataNotifier['formSteps'][stepIndex];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step['stepTitle'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: step['inputs'].length,
                  itemBuilder: (context, index) {
                    var dataForm = step['inputs'][index];
                    var inputId = dataForm['inputId'];
                    textEditingControllers[inputId] ??= TextEditingController();
                    textFieldErrorShakeKeys[inputId] ??=
                        GlobalKey<ShakeWidgetState>();
                    isTextFieldErrorMap[inputId] ??= false;
                    if (dataForm['type'] == 'select') {
                      return DropdownButtonFormField(
                        value: textEditingControllers[inputId]!.text.isNotEmpty
                            ? textEditingControllers[inputId]!.text
                            : dataForm['options'][0]
                                ['value'], // Set a default value
                        items: dataForm['options']
                            .map<DropdownMenuItem<String>>((option) {
                          return DropdownMenuItem<String>(
                            value: option['value'],
                            child: Text(option['label']),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            textEditingControllers[inputId]!.text =
                                value.toString();
                          });
                        },
                        decoration: InputDecoration(
                          labelText: dataForm['label'],
                          hintText: dataForm['placeholder'],
                        ),
                      );
                    } else if (dataForm['type'] == 'radio') {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(dataForm['label']),
                          Row(
                            children: dataForm['options'].map<Widget>((option) {
                              return Row(
                                children: [
                                  Radio<String>(
                                    value: option['value'],
                                    groupValue:
                                        textEditingControllers[inputId]!.text,
                                    onChanged: (value) {
                                      setState(() {
                                        textEditingControllers[inputId]!.text =
                                            value!;
                                      });
                                    },
                                  ),
                                  Text(option['label']),
                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    } else if (dataForm['type'] == 'file') {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 5),
                        child: ShakeWidget(
                          key: textFieldErrorShakeKeys[inputId],
                          shakeCount: 3,
                          shakeOffset: 10,
                          shakeDuration: const Duration(milliseconds: 500),
                          child: TextField(
                            onTap: () {
                              print('Profile Image 👮‍♂️');
                            },
                            controller: textEditingControllers[inputId],
                            readOnly: true,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                            decoration: InputDecoration(
                                labelText: dataForm['label'],
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 2.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 2.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: Colors.greenAccent, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: Colors.lightBlue, width: 1.0),
                                ),
                                hintText: dataForm['placeholder'],
                                errorText: _getErrorText(dataForm, inputId)),
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 5),
                        child: ShakeWidget(
                          key: textFieldErrorShakeKeys[inputId],
                          shakeCount: 3,
                          shakeOffset: 10,
                          shakeDuration: const Duration(milliseconds: 500),
                          child: TextField(
                            onChanged: (text) {
                              setState(() {
                                isTextFieldErrorMap[inputId] = text.isEmpty;
                              });
                            },
                            controller: textEditingControllers[inputId],
                            inputFormatters: [
                              if (dataForm['validationRules'] != null &&
                                  dataForm['validationRules']
                                      .containsKey('maxLength') &&
                                  dataForm['validationRules']['maxLength'] !=
                                      null &&
                                  dataForm['validationRules']['maxLength']
                                      .containsKey('validationValue'))
                                LengthLimitingTextInputFormatter(
                                  dataForm['validationRules']['maxLength']
                                      ['validationValue'],
                                ),
                            ],
                            keyboardType: _getKeyboardType(dataForm['type']),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                            decoration: InputDecoration(
                                labelText: dataForm['label'],
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 2.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 2.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: Colors.greenAccent, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: Colors.lightBlue, width: 1.0),
                                ),
                                hintText: dataForm['placeholder'],
                                errorText: _getErrorText(dataForm, inputId)),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String? _getErrorText(Map<String, dynamic> dataForm, String inputId) {
    if (isTextFieldErrorMap[inputId]!) {
      return dataForm['validationRules']['isRequired']['validationMessage'];
    } else {
      if (dataForm.containsKey('validationRules')) {
        var validationRules = dataForm['validationRules'];

        if (validationRules != null) {
          String inputValue = textEditingControllers[inputId]!.text;
          if (inputValue.isEmpty) {
            return null;
          }

          if (validationRules.containsKey('minLength') &&
              validationRules['minLength'] != null &&
              validationRules['minLength'].containsKey('validationValue')) {
            int minLength = validationRules['minLength']['validationValue'];
            if (inputValue.length < minLength) {
              return validationRules['minLength']['validationMessage'];
            }
          }

          if (validationRules.containsKey('maxLength') &&
              validationRules['maxLength'] != null &&
              validationRules['maxLength'].containsKey('validationValue')) {
            int maxLength = validationRules['maxLength']['validationValue'];
            if (inputValue.length > maxLength) {
              return validationRules['maxLength']['validationMessage'];
            }
          }

          if (validationRules.containsKey('endsWith') &&
              validationRules['endsWith'] != null &&
              validationRules['endsWith'].containsKey('validationValue')) {
            List<String> allowedDomains = List<String>.from(
                validationRules['endsWith']['validationValue']);
            if (!allowedDomains.any(inputValue.endsWith)) {
              return validationRules['endsWith']['validationMessage'];
            }
          }
        }
      }

      return null;
    }
  }

  TextInputType _getKeyboardType(String type) {
    switch (type) {
      case 'text':
        return TextInputType.text;
      case 'email':
        return TextInputType.emailAddress;
      case 'number':
        return TextInputType.number;
      case 'file':
        return TextInputType.url;
      case 'date':
        return TextInputType.datetime;
      default:
        return TextInputType.text;
    }
  }
}
