// ignore_for_file: file_names, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:hrm/src/utils/colors.dart';

import 'selectedFiltter.dart';
// import 'package:provider/provider.dart';
// import '../data/formDefinitionController.dart';

class TextFormScreen extends StatefulWidget {
  const TextFormScreen({super.key});

  @override
  State<TextFormScreen> createState() => _TextFormScreenState();
}

class _TextFormScreenState extends State<TextFormScreen> {
  bool _isFocused = false;
  bool _showMoreDetails = false;
  final FocusNode _focusNode = FocusNode();
  final _emName = TextEditingController();
  final _emEmail = TextEditingController();
  final _emPhNumber = TextEditingController();
  final _description = TextEditingController();
  final _address = TextEditingController();
  String? selectedGender;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
    // Provider.of<FormDataProvider>(context, listen: false)
    //     .loadJsonData()
    //     .then((_) {
    //   setState(() {
    //     isLoading = false;
    //   });
    // });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final jsonDataNotifier = Provider.of<FormDataProvider>(context).jsonData;
    // print('formmdataaaaaa: $jsonDataNotifier');

    // if (jsonDataNotifier == null || jsonDataNotifier['formSteps'] == null) {
    //   return const CircularProgressIndicator();
    // }

    return Scaffold(
      body: ListView(
        children: [
          Card(
            elevation: 1.25,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          const Icon(Icons.text_fields),
                          const SizedBox(width: 5),
                          Expanded(
                            child: TextFormField(
                              controller: _emName,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                hintText: 'Employee Name',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 0.2,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          const Icon(Icons.email_outlined),
                          const SizedBox(width: 5),
                          Expanded(
                            child: TextFormField(
                              controller: _emEmail,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                hintText: 'Employee Email',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 0.2,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          const Icon(Icons.dialpad),
                          const SizedBox(width: 5),
                          Expanded(
                            child: TextFormField(
                              controller: _emPhNumber,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                hintText: 'Employee Phone Number',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 0.2,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          const Icon(Icons.sort),
                          const SizedBox(width: 5),
                          Expanded(
                            child: TextFormField(
                              controller: _description,
                              focusNode: _focusNode,
                              decoration: const InputDecoration(
                                hintText: 'Description',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                            ),
                          ),
                          if (_isFocused)
                            InkWell(
                              onTap: () {
                                _description.clear();
                              },
                              child: const CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  Icons.close_rounded,
                                  size: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 0.2,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: _showMoreDetails,
            child: Column(
              children: [
                Card(
                  elevation: 1.25,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_month_outlined),
                            const SizedBox(width: 5),
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Date of Birth',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 0.2,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 1.25,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            const Icon(Icons.touch_app_outlined),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Row(
                                children: [
                                  Radio<String>(
                                    value: 'male',
                                    groupValue: selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedGender = value;
                                      });
                                    },
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedGender = 'male';
                                      });
                                    },
                                    child: const Text(
                                      'Male',
                                      style: TextStyle(),
                                    ),
                                  ),
                                  Radio<String>(
                                    value: 'female',
                                    groupValue: selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedGender = value;
                                      });
                                    },
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedGender = 'female';
                                      });
                                    },
                                    child: const Text(
                                      'Female',
                                      style: TextStyle(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 0.2,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 1.25,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            const Icon(Icons.text_fields),
                            const SizedBox(width: 5),
                            Expanded(
                              child: TextFormField(
                                controller: _address,
                                keyboardType: TextInputType.streetAddress,
                                decoration: const InputDecoration(
                                  hintText: 'Address area',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 0.2,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            const Icon(Icons.text_fields),
                            const SizedBox(width: 5),
                            Expanded(
                              child: TextFormField(
                                // controller: _address,
                                keyboardType: TextInputType.streetAddress,
                                decoration: const InputDecoration(
                                  hintText: 'Post Office',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 0.2,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            const Icon(Icons.text_fields),
                            const SizedBox(width: 5),
                            Expanded(
                              child: TextFormField(
                                // controller: _address,
                                keyboardType: TextInputType.streetAddress,
                                decoration: const InputDecoration(
                                  hintText: 'Polic Station',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 0.2,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            const Icon(Icons.text_fields),
                            const SizedBox(width: 5),
                            Expanded(
                              child: TextFormField(
                                // controller: _address,
                                keyboardType: TextInputType.streetAddress,
                                decoration: const InputDecoration(
                                  hintText: 'District',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 0.2,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            const Icon(Icons.text_fields),
                            const SizedBox(width: 5),
                            Expanded(
                              child: TextFormField(
                                // controller: _address,
                                keyboardType: TextInputType.streetAddress,
                                decoration: const InputDecoration(
                                  hintText: 'State',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 0.2,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            const Icon(Icons.dialpad),
                            const SizedBox(width: 5),
                            Expanded(
                              child: TextFormField(
                                // controller: _address,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: 'Pin Code',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 0.2,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelectedFiltter(),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 1.25,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 14),
                          child: Row(
                            children: [
                              Icon(Icons.groups_outlined),
                              SizedBox(width: 10),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Department'),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 0.2,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _showMoreDetails = !_showMoreDetails;
              });
            },
            child: Card(
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
                      _showMoreDetails ? Icons.expand_less : Icons.expand_more,
                      size: 20,
                      color: appBarBg,
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: appBarBg,
              ),
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Save',
                    style: TextStyle(
                      color: textColor2,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
