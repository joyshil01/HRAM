import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hrm/src/routing/routeNames.dart';
import 'package:hrm/src/utils/colors.dart';
import 'formDefinitionDetails.dart';
import 'textFormScreen.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final List<String> items = [
    'Employee onboarding',
    'FormDefinitionDetails',
  ];

  String? selectedValue;
  final textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedValue = items.first;
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appBarBg,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.formDefinition);
          },
          icon: const Icon(Icons.history),
        ),
        title: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            items: items
                .map(
                  (item) => DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        color: textColor2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
                .toList(),
            value: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            buttonStyleData: ButtonStyleData(
              decoration: BoxDecoration(
                color: const Color(0xFF45C5F4),
                borderRadius: BorderRadius.circular(25),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 35,
            ),
            dropdownStyleData: const DropdownStyleData(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              maxHeight: 400,
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 35,
            ),
            dropdownSearchData: DropdownSearchData(
              searchController: textEditingController,
              searchInnerWidgetHeight: 50,
              searchInnerWidget: Container(
                height: 50,
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 4,
                  right: 8,
                  left: 8,
                ),
                child: TextFormField(
                  style: const TextStyle(color: textColor2),
                  expands: true,
                  maxLines: null,
                  controller: textEditingController,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    hintText: 'Search for a form...',
                    hintStyle: const TextStyle(fontSize: 12, color: textColor2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              searchMatchFn: (item, searchValue) {
                return item.value.toString().contains(searchValue);
              },
            ),
            onMenuStateChange: (isOpen) {
              if (!isOpen) {
                textEditingController.clear();
              }
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.done,
                size: 32,
              ),
            ),
          ),
        ],
      ),
      body: selectedValue != null ? _buildForm(selectedValue!) : Container(),
    );
  }

  Widget _buildForm(String formName) {
    switch (formName) {
      case 'Employee onboarding':
        return
            //////
            TextFormScreen();
      // FormDefinitionDetails();
      case 'FormDefinitionDetails':
        return FormDefinitionDetailsForm();
      default:
        return Container();
    }
  }
}

class FormDefinitionDetailsForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Form Definition Details Form'),
    );
  }
}
