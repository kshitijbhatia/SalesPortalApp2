// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sales_portal_app_2/edit%20page/edit_page_input.dart';
import 'package:sales_portal_app_2/resources/api_service.dart';
import 'package:sales_portal_app_2/model/column_data.dart';
import 'package:sales_portal_app_2/model/sales_data.dart';
import 'package:sales_portal_app_2/resources/textfield_validation.dart';

class EditSinglePage extends StatefulWidget {
  const EditSinglePage(
      {required this.columnNames, required this.sales, super.key});

  final List<Map<String, dynamic>> columnNames;
  final Sales sales;

  @override
  State<EditSinglePage> createState() => _EditSinglePageState();
}

class _EditSinglePageState extends State<EditSinglePage> {
  List<TextEditingController> controllers = [];

  int ind = 0;
  int counter = 0;

  APIService apiservice = APIService.instance;

  late FToast fToast;

  void initializeControllers() {
    controllers
        .add(TextEditingController(text: widget.sales.toJson()['DealerCode']));
    for (var i = 0; i < columnHeader.length; i++) {
      String columnName = columnHeader[i]['columnName'].replaceAll(' ', '');
      final TextEditingController controller =
          TextEditingController(text: widget.sales.toJson()[columnName]);
      controllers.add(controller);
    }
    for (var i = 0; i < columnHeader.length; i++) {
      if (columnHeader[i]['columnName'] ==
          widget.columnNames[0]['columnName']) {
        ind = i + 1;
        break;
      }
    }
  }

  void editData() async {
    final response = await apiservice.editData(controllers);
    log('$response');
    // Success
    if (response['msg'] == 'success') {
      Navigator.pop(context, {'msg': "success", 'data': response['data']});
    }
    // Failure
    else if (response['msg'] == 'error' || response['msg'] == 'failure') {
      counter++;
      if (counter == 2) {
        Navigator.pop(context, {'msg': "failure"});
        return;
      }
      showToast('Failed to add Data, please try again');
    }
  }

  void showToast(String text) {
    return fToast.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(24, 56, 131, 1),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.red,
                fontFamily: 'Roboto',
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }

  bool checkControllers(List<TextEditingController> controllers) {
    for (var i = 0; i < widget.columnNames.length; i++) {
      if (widget.columnNames[i]['error'] != null) {
        return true;
      }
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    initializeControllers();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: const Color.fromRGBO(24, 56, 131, 1),
              width: double.infinity,
              height: 100,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 12.0, right: 10),
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  const Text(
                    'Edit Details',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 38,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: controllers.length == 4 ? 400 : 450,
              child: ListView.builder(
                itemCount: widget.columnNames.length,
                itemBuilder: (BuildContext context, int index) {
                  String columnName = widget.columnNames[index]['columnName'];
                  bool isRequired = widget.columnNames[index]['required'];
                  return InputField(
                    errorText: widget.columnNames[index]['error'],
                    type: TextInputType.text,
                    text: isRequired
                        ? 'Enter $columnName *'
                        : 'Enter $columnName',
                    controller: controllers[index + ind],
                    removeError: (){
                    setState(() {
                      widget.columnNames[index]['error'] = null;
                    });
                  },
                  );
                },
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(
                    Color.fromRGBO(24, 56, 131, 1)),
                elevation: const MaterialStatePropertyAll(20),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
              onPressed: () {
                for (var i = 0; i < widget.columnNames.length; i++) {
                  if (widget.columnNames[i]['required'] &&
                      controllers[i + ind].text == '') {
                    setState(() {
                      widget.columnNames[i]['error'] =
                          'Please fill the required fields';
                    });
                  } else if (widget.columnNames[i]['required'] &&
                      controllers[i + ind].text != '') {
                    setState(() {
                      widget.columnNames[i]['error'] = null;
                    });
                  } else if (!widget.columnNames[i]['required']) {
                    setState(() {
                      widget.columnNames[i]['error'] = null;
                    });
                  }
                }

                if (checkControllers(controllers)) {
                  return;
                }

                for (var i = 0; i < widget.columnNames.length; i++) {
                  String column = widget.columnNames[i]['columnName'];
                  if (column.contains('Email')) {
                    if (controllers[i + ind].text == '') {
                      widget.columnNames[i]['error'] = null;
                    } else {
                      setState(() {
                        widget.columnNames[i]['error'] =
                            emailValidation(controllers[i + ind].text);
                      });
                    }
                  }
                  if (column.contains('Number')) {
                    if (controllers[i + ind].text == '') {
                      widget.columnNames[i]['error'] = null;
                    } else {
                      setState(() {
                        widget.columnNames[i]['error'] =
                            numberValidation(controllers[i + ind].text);
                      });
                    }
                  }
                }

                if (checkControllers(controllers)) {
                  return;
                }

                editData();
              },
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
