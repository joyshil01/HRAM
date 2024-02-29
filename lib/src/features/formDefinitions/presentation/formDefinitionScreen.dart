import 'package:flutter/material.dart';
import 'package:hrm/src/routing/routeNames.dart';
import 'package:provider/provider.dart';
import '../data/formDefinitionController.dart';

class FormDefinitionScreen extends StatefulWidget {
  const FormDefinitionScreen({Key? key}) : super(key: key);

  @override
  _FormDefinitionScreenState createState() => _FormDefinitionScreenState();
}

class _FormDefinitionScreenState extends State<FormDefinitionScreen> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    Provider.of<FormDataProvider>(context, listen: false)
        .fetchFormData()
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var formDataProvider = Provider.of<FormDataProvider>(context).formDataList;
    print('dataaaaaaa: $formDataProvider');

    return Scaffold(
      appBar: AppBar(
        title: const Text('FormDefinitions'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 1,
              ),
              itemCount: formDataProvider.length,
              itemBuilder: (context, index) {
                var formData = formDataProvider[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteNames.formDefinitionDetails,
                        // arguments: formData,
                      );
                    },
                    child: SizedBox(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.white,
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(formData['pk'].toString()),
                              const SizedBox(height: 10),
                              Text(formData['name'].toString()),
                              // const SizedBox(height: 10),
                              // Text(formData['createdBy'].toString()),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
