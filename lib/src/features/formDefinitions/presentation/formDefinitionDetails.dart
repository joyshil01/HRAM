import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../utils/colors.dart';
import '../../../widgets/customSnakWidget.dart';
import '../data/formDefinitionController.dart';

class FormDefinitionDetails extends StatefulWidget {
  @override
  State<FormDefinitionDetails> createState() => _FormDefinitionDetailsState();
}

class _FormDefinitionDetailsState extends State<FormDefinitionDetails> {
  bool isLoading = true;
  bool _showMoreDetails = false;
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
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: jsonDataNotifier['formSteps'].length,
        itemBuilder: (context, stepIndex) {
          var step = jsonDataNotifier['formSteps'][stepIndex];
          return Column(
            children: [
              Card(
                elevation: 1.25,
                child: Column(
                  children: [
                    buildInputField(step['inputs'][0]),
                    buildInputField(step['inputs'][1]),
                    buildInputField(step['inputs'][2]),
                    buildInputField(step['inputs'][3]),
                  ],
                ),
              ),
              Card(
                elevation: 1.25,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _showMoreDetails
                            ? 'Hide more details'
                            : 'Show more details',
                        style: const TextStyle(
                          fontSize: 14,
                          color: appBarBg,
                        ),
                      ),
                      Icon(
                        _showMoreDetails
                            ? Icons.expand_less
                            : Icons.expand_more,
                        size: 20,
                        color: appBarBg,
                      )
                    ],
                  ),
                ),
              ),

              // SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: step['inputs'].length - 4,
                itemBuilder: (context, index) {
                  var dataForm = step['inputs'][index + 4];
                  var inputId = dataForm['inputId'];
                  textEditingControllers[inputId] ??= TextEditingController();
                  textFieldErrorShakeKeys[inputId] ??=
                      GlobalKey<ShakeWidgetState>();
                  isTextFieldErrorMap[inputId] ??= false;
                  return buildInputField(dataForm);
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildInputField(Map<String, dynamic> dataForm) {
    var inputId = dataForm['inputId'];
    if (dataForm['type'] == 'select') {
      return DropdownButtonFormField(
        value: textEditingControllers[inputId]?.text?.isNotEmpty == true
            ? textEditingControllers[inputId]!.text
            : dataForm['options'][0]['value'], // Set a default value
        items: dataForm['options'].map<DropdownMenuItem<String>>((option) {
          return DropdownMenuItem<String>(
            value: option['value'],
            child: Text(option['label']),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            textEditingControllers[inputId]!.text = value.toString();
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
                    groupValue: textEditingControllers[inputId]?.text ?? '',
                    onChanged: (value) {
                      setState(() {
                        textEditingControllers[inputId]?.text = value!;
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
      return ShakeWidget(
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
          style: const TextStyle(color: Colors.black, fontSize: 16),
          decoration: InputDecoration(
            labelText: dataForm['label'],
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.red, width: 2.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.red, width: 2.0),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            hintText: dataForm['placeholder'],
            // errorText: _getErrorText(dataForm, inputId),
          ),
        ),
      );
    } else {
      return Card(
        elevation: 0,
        child: TextField(
          onChanged: (text) {
            setState(() {
              isTextFieldErrorMap[inputId] = text.isEmpty;
            });
          },
          controller: textEditingControllers[inputId],
          inputFormatters: [
            if (dataForm['validationRules'] != null &&
                dataForm['validationRules'].containsKey('maxLength') &&
                dataForm['validationRules']['maxLength'] != null &&
                dataForm['validationRules']['maxLength']
                    .containsKey('validationValue'))
              LengthLimitingTextInputFormatter(
                dataForm['validationRules']['maxLength']['validationValue'],
              ),
          ],
          keyboardType: _getKeyboardType(dataForm['type']),
          style: const TextStyle(color: Colors.black, fontSize: 16),
          decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.red, width: 2.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.red, width: 2.0),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            hintText: dataForm['placeholder'],
            // errorText: _getErrorText(dataForm, inputId),
          ),
        ),
      );
    }
  }

  // String? _getErrorText(Map<String, dynamic> dataForm, String inputId) {
  //   if (isTextFieldErrorMap[inputId]!) {
  //     return dataForm['validationRules']?['isRequired']?['validationMessage'];
  //   } else {
  //     if (dataForm != null && dataForm.containsKey('validationRules')) {
  //       var validationRules = dataForm['validationRules'];

  //       if (validationRules != null) {
  //         String inputValue = textEditingControllers[inputId]!.text;
  //         if (inputValue.isEmpty) {
  //           return null;
  //         }

  //         if (validationRules.containsKey('minLength') &&
  //             validationRules['minLength'] != null &&
  //             validationRules['minLength'].containsKey('validationValue')) {
  //           int minLength = validationRules['minLength']['validationValue'];
  //           if (inputValue.length < minLength) {
  //             return validationRules['minLength']['validationMessage'];
  //           }
  //         }

  //         if (validationRules.containsKey('maxLength') &&
  //             validationRules['maxLength'] != null &&
  //             validationRules['maxLength'].containsKey('validationValue')) {
  //           int maxLength = validationRules['maxLength']['validationValue'];
  //           if (inputValue.length > maxLength) {
  //             return validationRules['maxLength']['validationMessage'];
  //           }
  //         }

  //         if (validationRules.containsKey('endsWith') &&
  //             validationRules['endsWith'] != null &&
  //             validationRules['endsWith'].containsKey('validationValue')) {
  //           List<String> allowedDomains = List<String>.from(
  //               validationRules['endsWith']['validationValue']);
  //           if (!allowedDomains.any(inputValue.endsWith)) {
  //             return validationRules['endsWith']['validationMessage'];
  //           }
  //         }
  //       }
  //     }

  //     return null;
  //   }
  // }

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
